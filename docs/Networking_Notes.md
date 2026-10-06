# Networking Notes — Beginner Friendly

## 1. What is an IP address?

An IP address identifies a device/interface on a network.

Example private IPv4:

```text
192.168.1.20
```

Example public IPv4:

```text
203.0.113.10
```

`203.0.113.0/24` is reserved for documentation, so it is used here only as an example.

## 2. Private vs public IP

**Private IP:** Used inside a private network/VPC.

**Public IP:** Can be reachable from the Internet when routing and firewall rules allow it.

A cloud VM commonly has a private IP and may also have a public IPv4 address.

## 3. CIDR

CIDR describes a network range.

Example:

```text
192.168.1.0/24
```

A `/24` IPv4 network contains 256 addresses in the full mathematical range.

## 4. Important ports

| Port | Protocol | Common use |
|---:|---|---|
| 22 | TCP | SSH |
| 53 | UDP/TCP | DNS |
| 80 | TCP | HTTP |
| 443 | TCP | HTTPS |
| 3306 | TCP | MySQL |
| 5432 | TCP | PostgreSQL |

Only open ports that are actually required.

## 5. DNS

DNS converts names into IP addresses.

Example:

```text
example.com -> IP address
```

Commands:

```bash
nslookup example.com
```

or:

```bash
dig example.com
```

## 6. Connectivity testing

Ping:

```bash
ping -c 4 8.8.8.8
```

Test DNS:

```bash
getent hosts example.com
```

Test HTTP:

```bash
curl -I http://example.com
```

Test a TCP port:

```bash
nc -vz <SERVER_IP> 80
```

## 7. Listening ports

Use:

```bash
ss -tulpn
```

For a web server you should see a listener on port 80 when Nginx is running.

## 8. Firewall vs security group

### Cloud Security Group

A cloud security group controls traffic around a VM at the cloud networking layer.

Example inbound rules:

```text
SSH 22   -> Your public IP only
HTTP 80  -> 0.0.0.0/0
```

### Linux firewall

Ubuntu can use UFW:

```bash
sudo ufw status
sudo ufw allow from <YOUR_PUBLIC_IP> to any port 22 proto tcp
sudo ufw allow 80/tcp
sudo ufw enable
```

Always make sure SSH is allowed before enabling a firewall on a remote server, otherwise you can lock yourself out.

## 9. Network flow

```text
Laptop
   |
   | Internet
   v
Cloud Public IP
   |
   | Security Group
   v
Linux VM
   |
   | UFW
   v
Nginx :80
   |
   v
Web page
```

## 10. Module 2 practice checklist

- [ ] Understand IPv4
- [ ] Understand private/public IP
- [ ] Understand CIDR
- [ ] Understand DNS
- [ ] Know common ports
- [ ] Use ping
- [ ] Use curl
- [ ] Use ss
- [ ] Understand security groups
- [ ] Understand UFW
