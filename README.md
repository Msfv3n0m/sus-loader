# sus-loader-mbr
This project was inspired by https://github.com/brainsmoke/nyanmbr </br>
## Description
sus-loader is a Stage 1 BIOS bootloader. The master boot record (mbr) in legacy BIOS devices allows for programs under 512 bytes, this project is merely 335. </br>
![](https://github.com/Msfv3n0m/sus-loader/blob/main/sus.PNG)

## Usage
### Testing
`make`: build and run project with qemu </br>
`make build`: build the project </br>
`make run`: run the project with qemu </br>
### Bare Metal
#### Windows
Just run the `overwrite-mbr.ps1` file as an administrator
#### Linux

