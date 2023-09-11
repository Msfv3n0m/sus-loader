# sus-loader

This project was inspired by https://github.com/brainsmoke/nyanmbr </br>

## Description

sus-loader is a Stage 1 BIOS bootloader. The master boot record (mbr) in legacy BIOS devices is 512 bytes. Therefore, a program must be under 512 bytes to fit into the first stage of the boot process. </br>
![](https://github.com/Msfv3n0m/sus-loader/blob/main/sus.PNG)

## Usage

### Testing

`make`: build and run project with qemu </br>
`make build`: build the project </br>
`make run`: run the project with qemu </br>
`./makeCadets.sh`: make numerous bootloaders with an array of names specified in `makeCadets.sh`. Resulting bootloaders are in the `cadets` folder
### Bare Metal

#### Windows

Just run the `overwrite-mbr.ps1` file as an administrator to overwrite the mbr with sus-loader.img

#### Linux

Run this command to overwrite the mbr with sus-loader.img: </br>
`sudo dd if=sus-loader.img of=/dev/sda bs=512 count=1`

## References
- https://stackoverflow.com/questions/23723828/interrupt-10h-is-not-displaying-a-string
- https://stackoverflow.com/questions/23721441/how-to-stop-certain-point-for-adding-pixels-int10h-for-assembly-8086
- https://stackoverflow.com/questions/45765480/interrupt-0x15-function-0x86-bios-wait-runs-far-slower-on-real-hardware-than-o
