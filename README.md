# PowerShell Script for Cleaning Temporary Files from Windows User Profiles

#Description:
This PowerShell script is designed to clean temporary files and browser caches from all user profiles on a Windows computer. It targets common locations where temporary files accumulate, including web browsers and Windows system folders.

#Functionality:

1. Firefox Cleanup:
   - Removes cache files, thumbnails, and SQLite databases from Firefox profiles.

2. Chrome and Edge Cleanup:
   - Identifies all user profiles for both Chrome and Edge browsers.
   - Clears various caches, including main cache, media cache, and service worker cache.
   - Removes cookies and related files.

3. Windows System Cleanup:
   - Clears Temporary Internet Files.
   - Removes Windows Error Reporting files.
   - Empties the Windows Temp folder and the system-wide Temp folder.
   - Clears the Recycle Bin.

#Usage Instructions:
1. Save the script with a .ps1 extension (e.g., "CleanupTempData.ps1").
2. Open PowerShell with administrator privileges.
3. Navigate to the directory containing the script.
4. Execute the script using: .\CleanupTempData.ps1

#Important Notes:
- Administrator Rights: This script requires administrator privileges to access and modify files across all user profiles and system directories.
- Verbose Output: The script uses the -Verbose flag, providing detailed information about each operation.
- Error Handling: It employs -EA SilentlyContinue to suppress non-critical errors and continue execution if a file cannot be deleted.
- Browser Closure: For optimal results, close all web browsers before running the script to ensure all files are accessible for deletion.

#Caution:
While this script is designed to remove only temporary and cache files, it's advisable to review the script and potentially test it in a controlled environment before running it on critical systems.

#Potential Benefits:
- Frees up disk space by removing unnecessary temporary files.
- May improve system performance by clearing outdated caches.
- Provides a quick way to clean multiple user profiles simultaneously.

This script can be particularly useful for system administrators managing multiple workstations or for users looking to perform thorough system maintenance. Always ensure you have current backups before performing any system-wide cleanup operations.
