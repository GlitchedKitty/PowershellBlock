# PowershellBlock

**What this script does:
  - Still allows Powershell to run and allows the execution of Powershell-based Intune scripts and remediations.
  - Still allows Powershell to be launched by anyone, but does not allow input.  Powershell will need to be launched as an admin in order to be used.
  - Creates a profile.ps1 script on the user's device that contains the necessary code to block non-elevated Powershell sessions and writes a banner message that states that access has been disabled.

**What this script does NOT do:
  - Does not completely block Powershell
  - Does not prevent it from being launched as an admin

**How to use this script:
This script was created to be used in Microsoft Intune as a platform script.

1. Launch Intune and navigate to Devices > Scripts and Remediations
2. Select the 'Platform Script' tab
3. Click 'Add' and follow the prompts.
4. Make sure the folllowing options are set as:
  Run this script using the logged on credentials: Yes
  Enforce script signature check: No
  Run script in 64 bit PowerShell Host: Yes
5. This script works best when applied at the user level rather than device level.

**You will also need to set the execution policy to allow for local and remote-signed scripts to be executed

1. Launch Intune and navigate to Devices > Configuration
2. Select 'Create', select Windows 10 and Later, select 'Settings Catalog'
3. Search for the following setting: Administrative Templates > Windows Components > Windows Powershell
4. Select 'Turn on Script Execution'.
5. Set Execution Policy to 'Allow local scripts and remote-signed scripts'.
6. Turn on Script Execution: Enabled
7. Scope this to the user as well.
