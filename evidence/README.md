# Evidence / Screenshots

The PNG files in this folder are **reference/demo screenshots created for the project documentation**. They are not actual screenshots of your personal AWS account.

For a strong internship submission, capture and replace/add your own screenshots after you complete the deployment:

### Screenshot 1 — Cloud VM
Show the running EC2 instance with:
- instance state
- public IPv4
- instance type

### Screenshot 2 — Security Group
Show:
- SSH 22 from your IP only
- HTTP 80 from the Internet

### Screenshot 3 — SSH
Show a terminal connected to the Ubuntu server.

### Screenshot 4 — Linux commands
Run:
```bash
hostnamectl
ip addr
df -h
free -h
```

### Screenshot 5 — Ports
Run:
```bash
sudo ss -tulpn
```

### Screenshot 6 — Nginx
Run:
```bash
sudo systemctl status nginx --no-pager
```

### Screenshot 7 — Browser
Open:
```text
http://<SERVER_IP>
```
and capture the deployed Module 2 page.

### Screenshot 8 — Connectivity
Run from your own computer:
```bash
curl -I http://<SERVER_IP>
```

These screenshots are optional unless your internship evaluator explicitly asks for evidence.
