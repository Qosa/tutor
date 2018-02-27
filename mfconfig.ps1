###### SKRYPT AKTYWUJACY IBM NOTES ORAZ IMPORTUJACY ZAKLADKI DO FIREFOXA

function copyFirefoxFiles($profile_full_path) {
    Copy-Item ".\Profilefiles\places.sqlite" -Destination $profile_full_path -Force
    Copy-Item ".\Profilefiles\xulstore.json" -Destination $profile_full_path -Force
    Copy-Item ".\Profilefiles\extensions.json" -Destination $profile_full_path -Force
    Copy-Item ".\Profilefiles\extensions.ini" -Destination $profile_full_path -Force
}

if(Test-Path D:\Users\$env:UserName\AppData\Roaming\Mozilla){
    Set-Location D:\Users\$env:UserName\AppData\Roaming\Mozilla\Firefox\Profiles
    $profile_folder = Get-ChildItem -Filter *3.default | Select -exp Name
    $profile_full_path = "D:\Users\kolosinski_l\AppData\Roaming\Mozilla\Firefox\Profiles" + $profile_folder
    copyFirefoxFiles $profile_full_path
} else {
    Start-Process firefox.exe
    Set-Location D:\Users\kolosinski_l\AppData\Roaming\Mozilla\Firefox\Profiles
    $profile_folder = Get-ChildItem -Filter *3.default | Select -exp Name
    $profile_full_path = "D:\Users\kolosinski_l\AppData\Roaming\Mozilla\Firefox\Profiles" + $profile_folder
    copyFirefoxFiles $profile_full_path
}
    