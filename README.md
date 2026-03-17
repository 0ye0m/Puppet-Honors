# Puppet Windows Automation Lab

**Author:** Om Mandwade 
**Date:** March 2026

This repository contains a complete Puppet setup that automates several Windows configuration tasks. All levels are defined in a single `site.pp` manifest.

## Levels Included

1. **File Creation** – Creates `C:\Puppet-Lab\welcome.txt` with a custom message.
2. **Service Control** – Stops and disables the Windows Search service (`WSearch`).
3. **Registry Management** – Adds `HKLM\Software\MyCompany\DeploymentID` registry value.
4. **Silent Installation** – Installs 7‑Zip using Chocolatey.
5. **System Report** – Generates `C:\Puppet-Lab\system_info.txt` with hardware facts.
6. **Self-Healing Website** – Installs IIS, ensures the service runs, and deploys a custom homepage that automatically reverts if changed.

## Prerequisites

- Docker Desktop (on the master host)
- Puppet Agent installed on the Windows machine (same machine or another)
- Administrator privileges on the Windows agent

## Quick Start

1. Start the Puppet Master:
   ```powershell
   docker-compose up -d --build