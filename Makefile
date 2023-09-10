default:
	nasm sus-loader.asm -o sus-loader.img
	qemu-system-x86_64 sus-loader.img
build: 
	nasm sus-loader.asm -o sus-loader.img
run: 
	qemu-system-x86_64 sus-loader.img
clean:
	rm -f sus-loader.img
