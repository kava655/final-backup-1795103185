#!/usr/bin/env python3
import socket, re

def query(server, domain):
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(15)
        s.connect((server, 43))
        s.send((domain + "\r\n").encode())
        data = b""
        while True:
            chunk = s.recv(4096)
            if not chunk: break
            data += chunk
        s.close()
        return data.decode("utf-8", errors="ignore")
    except Exception as e:
        return "WHOIS ERROR (" + server + "): " + str(e)

def raw_whois(domain):
    text = query("whois.iana.org", domain)
    print("IANA len:", len(text))
    m = re.search(r"refer:\s*(\S+)", text)
    print("match:", m)
    if m:
        server = m.group(1)
        print("server:", server)
        full = query(server, domain)
        print("full len:", len(full))
        return full
    return text

result = raw_whois("scanme.nmap.org")
print("RESULT LEN:", len(result))
print("FIRST 200:", result[:200])
