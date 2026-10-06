# Linux Notes — Beginner Friendly

## 1. What is Linux?

Linux is an operating system widely used on servers and cloud platforms. Most cloud virtual machines use Linux because it is stable, secure and efficient.

## 2. Basic CLI commands

| Command | Purpose | Example |
|---|---|---|
| `pwd` | Show current directory | `pwd` |
| `ls` | List files | `ls -la` |
| `cd` | Change directory | `cd /var/www/html` |
| `mkdir` | Create directory | `mkdir project` |
| `touch` | Create empty file | `touch notes.txt` |
| `cp` | Copy | `cp a.txt b.txt` |
| `mv` | Move/rename | `mv old.txt new.txt` |
| `rm` | Delete | `rm file.txt` |
| `cat` | Display file | `cat notes.txt` |
| `less` | Read large file | `less /var/log/syslog` |
| `grep` | Search text | `grep error app.log` |
| `find` | Find files | `find /var/log -name "*.log"` |
| `head` | First lines | `head file.txt` |
| `tail` | Last lines | `tail -f app.log` |
| `man` | Manual/help | `man ls` |

## 3. Files and directories

Important directories:

```text
/           root of the filesystem
/home       normal users' home directories
/etc        configuration files
/var        changing data and logs
/var/log    system/application logs
/tmp        temporary files
/usr        installed programs and libraries
/opt        optional applications
```

## 4. Permissions

Linux permissions normally contain:

```text
r = read
w = write
x = execute
```

Example:

```text
-rwxr-xr--
```

It can be understood as:

```text
owner:  rwx
group:  r-x
others: r--
```

Change permissions:

```bash
chmod 755 script.sh
chmod 644 index.html
```

Change owner:

```bash
sudo chown ubuntu:ubuntu index.html
```

### Common numeric permissions

| Value | Meaning |
|---|---|
| 7 | read + write + execute |
| 6 | read + write |
| 5 | read + execute |
| 4 | read only |
| 0 | no permission |

## 5. Users and groups

Show current user:

```bash
whoami
```

Show users:

```bash
cut -d: -f1 /etc/passwd
```

Create a user:

```bash
sudo adduser trainee
```

Create a group:

```bash
sudo groupadd developers
```

Add user to group:

```bash
sudo usermod -aG developers trainee
```

Check groups:

```bash
groups trainee
```

## 6. Processes

List processes:

```bash
ps aux
```

Interactive process view:

```bash
top
```

If available:

```bash
htop
```

Find a process:

```bash
ps aux | grep nginx
```

Stop a process:

```bash
kill <PID>
```

Force stop only when necessary:

```bash
kill -9 <PID>
```

## 7. Services with systemd

Check service:

```bash
sudo systemctl status nginx
```

Start:

```bash
sudo systemctl start nginx
```

Stop:

```bash
sudo systemctl stop nginx
```

Restart:

```bash
sudo systemctl restart nginx
```

Enable at boot:

```bash
sudo systemctl enable nginx
```

## 8. SSH

SSH means Secure Shell. It provides secure remote command-line access to a server.

Connect:

```bash
ssh -i your-key.pem ubuntu@<SERVER_IP>
```

Important:

```bash
chmod 400 your-key.pem
```

Do not share your private key.

## 9. Useful system commands

```bash
hostnamectl
uname -a
df -h
free -h
uptime
who
date
```

## 10. Module 2 practice checklist

- [ ] Navigate directories
- [ ] Create/copy/move/delete files
- [ ] Understand `rwx`
- [ ] Use `chmod`
- [ ] Use `chown`
- [ ] Create users/groups
- [ ] Inspect processes
- [ ] Manage a service
- [ ] Connect with SSH
- [ ] Read system information
