import requests
from requests.exceptions import SSLError

url = 'https://studentofftask.com'

def attempt():
    try:
        response = requests.get(url, verify=False)
        if response.status_code == 200:
            return [True, "* SOT: Success *"]
        return [False, f"! SOT (STATUS): {response.status_code} !"]
    except SSLError as e:
        return [False, f"! SOT (SSL): {e} !"]
    except Exception as e:
        return [False, f"! SOT (UNKNOWN) !"]
