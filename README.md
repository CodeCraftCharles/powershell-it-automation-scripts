# PowerShell IT Automation Scripts

A collection of PowerShell scripts for common IT support and Active 
Directory administration tasks, built and tested in a live Windows 
Server/Active Directory lab environment.

## Scripts

### New-BulkUsers.ps1
Creates multiple Active Directory user accounts from a CSV file, instead 
of creating them one at a time manually. Reads first name, last name, 
username, and target OU from the CSV, then provisions each account with 
a default password and forces a password change at next logon.

### Reset-UserPassword.ps1
Prompts for a username and resets that account's password, automatically 
setting the "must change password at next logon" flag — a common Tier 1 
help desk task.

### Get-SystemHealth.ps1
Reports current disk space and memory usage on a machine, useful for 
quick health checks during troubleshooting.

### Get-InstalledSoftware.ps1
Lists all installed software on a machine (name, version, publisher) and 
exports the results to a CSV file — useful for software audits.

### Find-InactiveAccounts.ps1
Scans Active Directory for enabled accounts that haven't logged in within 
the last 30 days, helping identify accounts that may need review or 
deactivation.

## Environment

These scripts were built and tested against a Windows Server 2022 Active 
Directory domain controller, as part of a broader home lab project. See 
my related repo: [home-lab-active-directory-helpdesk](https://github.com/CodeCraftCharles/home-lab-active-directory-helpdesk)

## Sample Output
=== System Health Check ===

Disk Space:
Drive C: - 48.34 GB free of 59.39 GB (81.4% free)

Memory Usage:
0.78 GB free of 2 GB total

## What I Learned

Writing these scripts reinforced how much manual, repetitive work in IT 
support can be automated — even simple scripts like these save significant 
time compared to doing the same tasks by hand through the GUI, and reduce 
the chance of human error on repetitive tasks like bulk account creation.

## Future Improvements

- Add error handling and logging to each script
- Add a script to bulk-disable accounts from a CSV list
- Parameterize scripts to accept command-line arguments instead of 
  hardcoded values
