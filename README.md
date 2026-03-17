# Puppet Windows Automation Lab

**Author:** Your Name  
**Date:** March 2026

This repository contains a set of Puppet manifests that automate various configuration tasks on a Windows machine. Each manifest is self-contained and demonstrates a core Puppet capability.

## Structure

- `manifests/` – Contains all level manifests.
- `site.pp` – The active manifest (copied from one of the levels).
- `deploy.ps1` – Helper script to deploy a specific level.

## Levels

1. **File Creation** – Creates `C:\Puppet-Lab\welcome.txt` with system facts.
2. **Service Control** – Disables the Windows Search service (`WSearch`).
3. **Registry Management** – Adds `HKLM\Software\MyCompany\DeploymentID`.
4. **Silent Install** – Installs 7-Zip via Chocolatey.
5. **System Report** – Generates a facts-based report in `C:\Puppet-Lab\system_info.txt`.
6. **Self-Healing Website** – Deploys IIS with a custom homepage that auto-restores if changed.

## Prerequisites

- Docker Desktop (on the master host)
- Puppet Agent installed on the Windows machine
- Administrator privileges on the Windows agent

## Quick Start

1. Start the Puppet Master:
   ```powershell
   docker-compose up -d --build