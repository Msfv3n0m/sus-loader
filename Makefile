default:
	nasm sus_loader.asm -o sus_loader.img
	qemu-system-x86_64 sus_loader.img
build: 
	nasm sus_loader.asm -o sus_loader.img
run: 
	qemu-system-x86_64 sus_loader.img
clean:
	rm -f sus_loader.img