    bits 16
    org 0x7c00      ; load all labels in reference to 0x7c00 because that is the memory address of the mbr

main:
    mov ah, 0h      ; set video mode
    mov ax, 13h     ; mode 13h = 320x200 pixels with 256 colors 
    int 10h         ; interrupt 10h offers video services
    push 0xa000     ; a000 is the memory address for the beginning of video memory
    pop es          ; load es register with a000h
    jmp draw

pixel:                      ; code from https://stackoverflow.com/questions/23721441/how-to-stop-certain-point-for-adding-pixels-int10h-for-assembly-8086
    cld                     ; clear the directional flag so the esi register is incrimented
    push cx                 ; prevent cx register from getting corrupted by rep stosb
    rep stosb               ; number of pixels in cx register
    pop cx                  ; restore cx
    add di, dx              ; add (the difference between (the screen width and the length of the previously drawn line) and (the end of the previously drawn line)) to make the pixels seem larger
    ; assess loop
    dec bx                  ; decriment bx
    cmp bx, 0               ; compare bx to 0
    jnz pixel               ; if bx is not 0, restart the loop
    ret                     ; else, return
draw:
    ; head
    mov dx, 320             ; set dx to the width of the screen
    mov bx, 4*1             ; set bx to 4*(the height we want this row to be)
    mov cx, 4*3             ; set cx to 4*(the length we want this row to be)
    push cx                 ; push cx onto the stack 
    sub dx, cx              ; subtract the width of the screen from the length of the row to determine how much we need to incriment our loop by when we start drawing the next row to form the larger pixel
    mov di, 130*320+250     ; set di to the coordinates we want to start coloring pixels at. row=130, col=250
    mov ax, 9h              ; load al with color to draw (red)
    call pixel              ; call the pixel label
    ; head
    mov dx, 320
    mov bx, 4*1           
    mov cx, 4*7             
    push cx 
    sub dx, cx
    mov di, 133*320+242         
    call pixel
    ; head
    mov dx, 320
    mov bx, 4*1           
    mov cx, 4*3             
    push cx 
    sub dx, cx
    mov di, 137*320+258             
    call pixel
    ; neck 
    mov dx, 320
    mov bx, 4*1           
    mov cx, 4*3             
    push cx 
    sub dx, cx
    mov di, 140*320+262             
    call pixel
    ; neck
    mov dx, 320
    mov bx, 4*2           
    mov cx, 4*2             
    push cx 
    sub dx, cx
    mov di, 144*320+266              
    call pixel
    ; backpack
    mov dx, 320
    mov bx, 4*10           
    mov cx, 4*2             
    push cx 
    sub dx, cx
    mov di, 148*320+278             
    call pixel
    ; neck
    mov dx, 320
    mov bx, 4*1           
    mov cx, 4*3             
    push cx 
    sub dx, cx
    mov di, 152*320+262             
    call pixel
    ; neck
    mov dx, 320
    mov dx, 320
    mov bx, 4*1           
    mov cx, 4*4             
    push cx 
    sub dx, cx
    mov di, 156*320+258        
    call pixel
    ; belly
    mov dx, 320
    mov bx, 4*7           
    mov cx, 4*9             
    push cx 
    sub dx, cx
    mov di, 160*320+238              
    call pixel
    ; left leg
    mov dx, 320
    mov bx, 4*2           
    mov cx, 4*2             
    push cx 
    sub dx, cx
    mov di, 188*320+238               
    call pixel
    ; right leg
    mov dx, 320
    mov bx, 4*2           
    mov cx, 4*2             
    push cx 
    sub dx, cx
    mov di, 188*320+266                
    call pixel
    ; first line of goggles
    mov dx, 320
    mov bx, 4*1           
    mov cx, 4*5             
    push cx 
    sub dx, cx
    mov di, 140*320+238   
    mov ax, 0fh     
    call pixel
    ; second and third lines of goggles
    mov dx, 320
    mov bx, 4*2           
    mov cx, 4*7             
    push cx 
    sub dx, cx
    mov di, 144*320+234        
    call pixel
    ; last line of goggles
    mov dx, 320
    mov bx, 4*1          
    mov cx, 4*5             
    push cx 
    sub dx, cx
    mov di, 152*320+238      
    call pixel
    ; stars 
    mov bx, 10              ; write 20 stars
    mov di, 15*320+45       ; starting at row=15, col=45
    call stars_loop
    mov bx, 10
    mov di, 15*320+275
    call stars_loop
    mov bx, 10
    mov di, 50*320+15
    call stars_loop
stars_loop:
    mov cx, 1               ; the star should be 1x1 pixels 
    rep stosb               ; write the star 
    dec bx                  ; decriment the bx register
    shr di, 3               ; shift the values in the di register right 3 times
    shl di, 4               ; shift the values in the di register left 4 times
    cmp bx, 0               ; compare the bx register to 0
    jnz stars_loop          ; if the bx register is not 0, restart the stars_loop    
    ret                     ; else, return

times 510-($-$$) db 0   ; fill current position until byte 510 with 0s 
dw 0xaa55               ; ibm magic bytes, if this were not here it would indicate that the device is not compatible with ibm 
