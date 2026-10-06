# Security Checklist

## SSH

- [ ] Use SSH keys
- [ ] Never commit private keys
- [ ] Keep `.pem` files out of Git
- [ ] Restrict port 22 to your IP where possible
- [ ] Use a non-root administrative account when appropriate
- [ ] Disable password authentication only after confirming key access works

## Network

- [ ] Open only required ports
- [ ] Port 80 is open only because this demo deploys HTTP
- [ ] Do not expose database ports publicly
- [ ] Review cloud Security Group rules

## Linux

- [ ] Keep packages updated
- [ ] Use `sudo` only when needed
- [ ] Use appropriate file permissions
- [ ] Check running services
- [ ] Review logs when troubleshooting

## GitHub

Never commit:

```text
*.pem
*.key
.env
.env.*
credentials
secrets
passwords
tokens
```

The repository `.gitignore` already blocks common secret files.

## Before submitting

Run:

```bash
git status
git diff --cached
```

Confirm that no secret or private key is included.
