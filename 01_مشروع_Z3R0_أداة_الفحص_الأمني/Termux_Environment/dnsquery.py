#!/usr/bin/env python3
import sys
import dns.resolver

def query_all(domain):
    r = dns.resolver.Resolver(configure=False)
    r.nameservers = ['8.8.8.8', '1.1.1.1']
    r.timeout = 5
    r.lifetime = 10

    print(f"; DNS Query for {domain}")
    print(f"; Nameservers: {r.nameservers}")
    print("")

    for rtype in ['A', 'AAAA', 'MX', 'NS', 'TXT', 'SOA', 'CNAME']:
        try:
            answers = r.resolve(domain, rtype)
            print(f"{rtype}:")
            for a in answers:
                print(f"  {a.to_text()}")
        except dns.resolver.NoAnswer:
            pass
        except dns.resolver.NXDOMAIN:
            print(f"{rtype}: NXDOMAIN")
            return
        except dns.exception.Timeout:
            print(f"{rtype}: TIMEOUT")
        except Exception as e:
            print(f"{rtype}: ERR ({e})")
    print("")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("usage: dnsquery.py <domain>")
        sys.exit(1)
    query_all(sys.argv[1])
