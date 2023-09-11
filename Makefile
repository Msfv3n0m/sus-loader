default: sus-loader.img run

sus-loader.img: sus-loader.asm
	nasm sus-loader.asm -o sus-loader.img

run: 
	qemu-system-x86_64 sus-loader.img

clean:
	rm -f sus-loader.img
