# Cloud Server Deployment — Ubuntu + Nginx

## Goal

Create a Linux VM in the cloud, connect through SSH, secure it, deploy Nginx and verify the service from another machine/browser.

## Step 1 — Create the VM

Reference platform: AWS EC2.

Choose an Ubuntu Server LTS image and a small instance appropriate for your account.

Record:

```text
Instance ID:
Public IPv4:
Private IPv4:
Key pair:
Security Group:
```

Do not put private keys in this repository.

## Step 2 — Configure the Security Group

Minimum inbound rules:

| Type | Port | Source |
|---|---:|---|
| SSH | 22 | Your public IP/32 |
| HTTP | 80 | 0.0.0.0/0 |

Avoid:

```text
SSH 22 -> 0.0.0.0/0
```

unless there is a specific, controlled reason and you understand the risk.

## Step 3 — SSH into the server

On Linux/macOS/WSL:

```bash
chmod 400 your-key.pem
ssh -i your-key.pem ubuntu@<SERVER_IP>
```

On Windows PowerShell, OpenSSH is normally available on current Windows installations.

## Step 4 — Update packages

```bash
sudo apt update
sudo apt upgrade -y
```

## Step 5 — Check the machine

```bash
hostnamectl
ip addr
ip route
df -h
free -h
```

## Step 6 — Configure UFW carefully

First allow SSH from your own public IP:

```bash
sudo ufw allow from <YOUR_PUBLIC_IP> to any port 22 proto tcp
```

Then allow HTTP:

```bash
sudo ufw allow 80/tcp
```

Enable:

```bash
sudo ufw enable
```

Verify:

```bash
sudo ufw status verbose
```

If HTTPS is configured later:

```bash
sudo ufw allow 443/tcp
```

## Step 7 — Install Nginx

```bash
sudo apt install nginx -y
```

Start and enable:

```bash
sudo systemctl enable --now nginx
```

Check:

```bash
sudo systemctl status nginx
```

## Step 8 — Deploy the sample page

The repository contains:

```text
website/index.html
```

Copy it to the web root:

```bash
sudo cp website/index.html /var/www/html/index.html
```

Then:

```bash
sudo nginx -t
sudo systemctl reload nginx
```

## Step 9 — Test locally on the server

```bash
curl -I http://127.0.0.1
curl http://127.0.0.1
```

## Step 10 — Test from your computer

```bash
curl -I http://<SERVER_IP>
```

Or open:

```text
http://<SERVER_IP>
```

in a browser.

## Step 11 — Check listening ports

```bash
sudo ss -tulpn
```

Expected relevant listener:

```text
*:80
```

## Step 12 — Logs

Nginx access log:

```bash
sudo tail -f /var/log/nginx/access.log
```

Nginx error log:

```bash
sudo tail -f /var/log/nginx/error.log
```

## Step 13 — Troubleshooting

### Website does not open

Check:

```bash
sudo systemctl status nginx
sudo nginx -t
sudo ss -tulpn | grep :80
sudo ufw status
```

Then check the cloud Security Group for TCP 80.

### SSH does not work

Check:

- correct public IP
- correct username (`ubuntu` for the standard Ubuntu EC2 image)
- correct key
- key permissions
- Security Group port 22
- your current public IP

### DNS command missing

Install:

```bash
sudo apt install dnsutils -y
```

Then:

```bash
dig example.com
```

## Final verification

Run:

```bash
hostnamectl
ip addr
ip route
sudo ss -tulpn
sudo systemctl status nginx --no-pager
curl -I http://127.0.0.1
```

From your own computer:

```bash
curl -I http://<SERVER_IP>
```

The server should return an HTTP response such as:

```text
HTTP/1.1 200 OK
```
