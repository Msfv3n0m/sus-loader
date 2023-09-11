# sus-loader
This project was inspired by https://github.com/brainsmoke/nyanmbr </br>
## Description
sus-loader is a Stage 1 BIOS bootloader. The master boot record (mbr) in legacy BIOS devices is 512 bytes. Therefore, a program must be under 512 bytes to fit into the first stage of the boot process. This project is merely 335 bytes. </br>
![](https://github.com/Msfv3n0m/sus-loader/blob/main/sus.PNG)

## Usage
### Testing
`make`: build and run project with qemu </br>
`make build`: build the project </br>
`make run`: run the project with qemu </br>
### Bare Metal
#### Windows
Just run the `overwrite-mbr.ps1` file as an administrator to overwrite the mbr with sus-loader.img
#### Linux
Run this command to overwrite the mbr with sus-loader.img: </br>
`sudo dd if=sus-loader.img of=/dev/sda bs=512 count=1`
