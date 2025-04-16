
$userprofiles = @(dir "C:\Users" -Directory |% {$_.Fullname})

foreach ($userprofile in $userprofiles) {
    $userprofile

    Remove-Item -path "$userprofile\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache\*" -Recurse -Force -EA SilentlyContinue -Verbose
    Remove-Item -path "$userprofile\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache\*.*" -Recurse -Force -EA SilentlyContinue -Verbose
    Remove-Item -path "$userprofile\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache2\entries\*.*" -Recurse -Force -EA SilentlyContinue -Verbose
    Remove-Item -path "$userprofile\AppData\Local\Mozilla\Firefox\Profiles\*.default\thumbnails\*" -Recurse -Force -EA SilentlyContinue -Verbose
    Remove-Item -path "$userprofile\AppData\Local\Mozilla\Firefox\Profiles\*.default\cookies.sqlite" -Recurse -Force -EA SilentlyContinue -Verbose
    Remove-Item -path "$userprofile\AppData\Local\Mozilla\Firefox\Profiles\*.default\webappsstore.sqlite" -Recurse -Force -EA SilentlyContinue -Verbose
    Remove-Item -path "$userprofile\AppData\Local\Mozilla\Firefox\Profiles\*.default\chromeappsstore.sqlite" -Recurse -Force -EA SilentlyContinue -Verbose

    $chromiumProfiles = @()
    @("$userprofile\AppData\Local\Google\Chrome\User Data", "$userprofile\AppData\Local\Microsoft\Edge\User Data") |% {
        if (Test-Path -Path $_ -PathType Container -EA SilentlyContinue) {
            $chromiumProfiles += @(Get-ChildItem -Path $_ |? Name -Match "Default|Profile [\d{2}]" |% fullname)
        }
    }
    
    $chromiumProfiles |% {

        Remove-Item -path "$_\Cache\*" -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path "$_\Cache2\entries\*" -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path "$_\Cookies" -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path "$_\Media Cache" -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path "$_\Cookies-Journal" -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path "$_\Service Worker\CacheStorage" -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path "$_\Code Cache" -Recurse -Force -EA SilentlyContinue -Verbose

    }

    Remove-Item -path "$userprofile\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -EA SilentlyContinue -Verbose
	Remove-Item -path "$userprofile\AppData\Local\Microsoft\Windows\WER\*" -Recurse -Force -EA SilentlyContinue -Verbose
	Remove-Item -path "$userprofile\AppData\Local\Temp\*" -Recurse -Force -EA SilentlyContinue -Verbose
	Remove-Item -path "C:\Windows\Temp\*" -Recurse -Force -EA SilentlyContinue -Verbose
	Remove-Item -path "C:\`$recycle.bin\" -Recurse -Force -EA SilentlyContinue -Verbose

}
