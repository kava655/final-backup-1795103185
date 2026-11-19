#!/usr/bin/env python3
import os, time, subprocess, gc, signal, shutil
from datetime import datetime

WATCH_DIR = "/sdcard/Z3R0"
CMD_FILE = os.path.join(WATCH_DIR, "command.txt")
RES_FILE = os.path.join(WATCH_DIR, "result.txt")
RUN_FILE = os.path.join(WATCH_DIR, "running.txt")
CANCEL_FILE = os.path.join(WATCH_DIR, "cancel.txt")
HIST_DIR = os.path.join(WATCH_DIR, "history")

os.makedirs(WATCH_DIR, exist_ok=True)
os.makedirs(HIST_DIR, exist_ok=True)
for f in [CMD_FILE, RUN_FILE, RES_FILE, CANCEL_FILE]:
    if os.path.exists(f):
        try: os.remove(f)
        except: pass

print("Z3R0 daemon started (v5).", flush=True)

def run_shell(cmd, timeout_sec=300):
    """ينفّذ الأمر ويراقب cancel.txt أثناء التنفيذ."""
    env = os.environ.copy()
    env["PATH"] = "/data/data/com.termux/files/usr/bin:" + env.get("PATH", "")
    env["TERM"] = "dumb"

    proc = subprocess.Popen(
        ["bash", "-c", cmd],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        env=env,
        preexec_fn=os.setsid
    )

    start = time.time()
    cancelled = False

    while proc.poll() is None:
        # فحص cancel.txt كل 0.5 ثانية
        if os.path.exists(CANCEL_FILE):
            cancelled = True
            print("CANCELLED by user", flush=True)
            try:
                os.killpg(os.getpgid(proc.pid), signal.SIGTERM)
            except Exception:
                pass
            try:
                proc.wait(timeout=5)
            except Exception:
                try:
                    os.killpg(os.getpgid(proc.pid), signal.SIGKILL)
                except Exception:
                    pass
            break

        if time.time() - start > timeout_sec:
            print("TIMEOUT", flush=True)
            try:
                os.killpg(os.getpgid(proc.pid), signal.SIGTERM)
            except Exception:
                pass
            try:
                proc.wait(timeout=5)
            except Exception:
                pass
            break

        time.sleep(0.5)

    try:
        stdout, stderr = proc.communicate(timeout=5)
    except Exception:
        stdout, stderr = "", ""

    code = proc.returncode if proc.returncode is not None else -1
    if cancelled:
        return stdout or "", (stderr or "") + "\n[CANCELLED BY USER]", -2
    return stdout or "", stderr or "", code

def save_history(cmd, code, out):
    try:
        ts = datetime.now().strftime("%Y%m%d_%H%M%S")
        tool = cmd.split()[0] if cmd.split() else "cmd"
        if "/" in tool:
            tool = tool.split("/")[-1]
        hist_file = os.path.join(HIST_DIR, ts + "_" + tool + ".txt")
        with open(hist_file, "w") as hf:
            hf.write("# " + cmd + "\n")
            hf.write("# " + datetime.now().strftime("%Y-%m-%d %H:%M:%S") + "\n\n")
            hf.write("EXIT=" + str(code) + "\n")
            hf.write(out)
        files = sorted([f for f in os.listdir(HIST_DIR) if f.endswith('.txt')])
        while len(files) > 150:
            os.remove(os.path.join(HIST_DIR, files[0]))
            files.pop(0)
    except Exception as e:
        print("HISTORY ERR:", e, flush=True)

while True:
    try:
        if os.path.exists(CMD_FILE):
            try:
                with open(CMD_FILE, "r") as f:
                    cmd = f.read().strip()
            except Exception:
                cmd = ""

            if cmd:
                print("EXEC:", cmd, flush=True)

                for f in [RES_FILE, RUN_FILE, CANCEL_FILE]:
                    if os.path.exists(f):
                        try: os.remove(f)
                        except: pass
                try:
                    os.remove(CMD_FILE)
                except: pass

                with open(RUN_FILE, "w") as f:
                    f.write(cmd)

                if "nuclei" in cmd:
                    try:
                        shutil.rmtree(os.path.expanduser("~/.cache/nuclei"), ignore_errors=True)
                    except: pass

                try:
                    stdout, stderr, code = run_shell(cmd, timeout_sec=300)
                    out = stdout
                    if stderr:
                        out += "\n[STDERR]\n" + stderr
                except Exception as e:
                    out, code = "ERROR: " + str(e), -1

                try:
                    with open(RES_FILE, "w") as f:
                        f.write("EXIT=" + str(code) + "\n")
                        f.write(out)
                except Exception as e:
                    print("WRITE ERR:", e, flush=True)

                save_history(cmd, code, out)

                if os.path.exists(RUN_FILE):
                    try: os.remove(RUN_FILE)
                    except: pass

                gc.collect()

        time.sleep(0.5)
    except KeyboardInterrupt:
        break
    except Exception as e:
        print("MAIN ERR:", e, flush=True)
        time.sleep(2)
