import requests

def get_all_ips_for_region(region):
    response = requests.get('https://ip-ranges.amazonaws.com/ip-ranges.json')
    data = response.json()
    ips = []

    for prefix in data['prefixes']:
        if prefix['region'] == region:
            ips.append(prefix['ip_prefix'])

    return ips

if __name__ == '__main__':
    region = 'us-east-1'
    ips = get_all_ips_for_region(region)
    for ip in ips:
        print(ip)
