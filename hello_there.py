import requests

response = requests.get('https://www.google.com')

if response.status_code == 200:
    print('Get successfully !!')
else:
    print('Get Failed !!')