# Module 2 — Linux, Networking & Cloud Infrastructure

**Internship Module:** Day 6–Day 10  
**Level:** Beginner  
**Focus:** Linux CLI, networking, cloud VM deployment, secure access, service deployment and connectivity testing.

## What this project demonstrates

1. Linux command-line operations
2. Files, permissions, users and groups
3. Process and service management
4. SSH key-based secure access
5. IP addressing, DNS, ports and connectivity
6. Cloud security-group concepts
7. Linux VM deployment
8. Nginx web-service deployment
9. Basic server hardening
10. Connectivity testing with `ping`, `curl`, `ss`, `dig`/`nslookup`

## Architecture

```text
                    Internet
                        |
                        | HTTP :80
                        v
              +-------------------+
              | AWS EC2 / Linux VM|
              | Ubuntu Server     |
              +-------------------+
                |             |
          SSH :22          Nginx :80
                |             |
                v             v
           Admin PC       Web Application
                              |
                         /website/index.html
```

A more detailed architecture diagram is available in `diagrams/cloud_architecture.svg`.

## Repository structure

```text
Module_2_Linux_Networking_Cloud/
├── README.md
├── .gitignore
├── LICENSE
├── docs/
│   ├── Linux_Notes.md
│   ├── Networking_Notes.md
│   ├── Cloud_Server_Deployment.md
│   └── Security_Checklist.md
├── scripts/
│   ├── linux_basics.sh
│   ├── network_check.sh
│   ├── server_setup_ubuntu.sh
│   ├── deploy_nginx.sh
│   └── test_connectivity.sh
├── website/
│   └── index.html
├── configs/
│   └── nginx-site.conf
├── diagrams/
│   └── cloud_architecture.svg
└── evidence/
    ├── README.md
    ├── terminal_demo_linux.png
    ├── terminal_demo_network.png
    └── terminal_demo_deployment.png
```

## Recommended cloud setup

This project uses **Ubuntu Server on AWS EC2** as the reference environment. The same Linux commands can be adapted to Azure VM, Google Cloud VM, or another Linux cloud server.

### Suggested EC2 configuration

- OS: Ubuntu Server LTS
- Instance: small/free-tier-eligible instance according to your AWS account
- Storage: default small root volume
- Security Group:
  - SSH TCP 22 → **your public IP only**
  - HTTP TCP 80 → `0.0.0.0/0`
- Do not open unnecessary ports.

> Cloud providers and free-tier eligibility can change. Check the current pricing/free-tier page before launching resources.

## Important safety note

Never upload a private SSH key (`.pem`, `.key`, etc.) to GitHub.

The repository contains only commands and configuration examples. Replace placeholders such as `<SERVER_IP>` and `<YOUR_PUBLIC_IP>` with your own values when working on the real server.

## Quick start

### 1. Clone the repository

```bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
cd Module_2_Linux_Networking_Cloud
```

### 2. Review the notes

Read:

- `docs/Linux_Notes.md`
- `docs/Networking_Notes.md`
- `docs/Cloud_Server_Deployment.md`
- `docs/Security_Checklist.md`

### 3. Make scripts executable

```bash
chmod +x scripts/*.sh
```

### 4. Run the local Linux practice script

```bash
./scripts/linux_basics.sh
```

### 5. Test networking

```bash
./scripts/network_check.sh
```

### 6. On an Ubuntu cloud VM

First connect with SSH:

```bash
ssh -i /path/to/your-key.pem ubuntu@<SERVER_IP>
```

Then upload/copy the deployment files and run:

```bash
chmod +x scripts/server_setup_ubuntu.sh
./scripts/server_setup_ubuntu.sh

chmod +x scripts/deploy_nginx.sh
./scripts/deploy_nginx.sh
```

Finally:

```bash
./scripts/test_connectivity.sh
```

Open:

```text
http://<SERVER_IP>
```

## Expected result

A simple web page should load showing:

**Module 2 — Linux, Networking & Cloud Infrastructure**

The terminal checks should also show:

- current IP information
- DNS resolution
- listening ports
- HTTP response
- server connectivity

## Evidence

The `evidence/` folder contains **reference/demo screenshots**, not proof of an actual cloud deployment. For your final internship submission, replace them with screenshots from your own VM/console if the internship portal requires real evidence.

Recommended real screenshots:

1. EC2 instance running
2. Security Group inbound rules
3. SSH connection
4. `ip addr` / `hostnamectl`
5. `ss -tulpn`
6. Nginx status
7. Browser showing the deployed page
8. `curl http://<SERVER_IP>`

## Module 2 submission

The dashboard asks for:

- **GitHub Repository Link**
- **LinkedIn Post Link**

After pushing this project, submit your GitHub repository URL in the internship dashboard. Then create the LinkedIn post using the ready-to-use content provided separately in the chat.

## Learning outcome

After completing this module, I can explain and demonstrate basic Linux administration, networking concepts, SSH access, cloud VM setup, firewall/security-group configuration, web-service deployment and connectivity testing.
