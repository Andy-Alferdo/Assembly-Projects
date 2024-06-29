; This Program clears the screen, finds the multiples of 2
; and 3 less than 50

INCLUDE irvine32.inc

N = 50

.data
    K DWORD ?
    arr1 DWORD N DUP(0) ; initialize the array elements with 0s

.code
main PROC

    ; Clear the screen
    call Clrscr

    ; Find the multiples of 2
    mov K, 2 ; K = 2
    mov eax, K ; pass EAX = 2 to the procedure
    call Find_Multiples

    ; Find the multiples of 3
    mov K, 3 ; K = 3
    mov eax, K ; pass EAX = 3 to the procedure
    call Find_Multiples

    ; Print the array
    mov ecx, N
    mov esi, 0
L1:
    mov eax, arr1[esi*4]
    call WriteDec
    call Crlf
    inc esi
    loop L1

    ; Exit program
    call ExitProcess

main ENDP

Find_Multiples PROC USES eax ebx ecx esi

    ; Finds the multiples of a number & sets corresponding
    ; array elements to 1
    ; Receives EAX = number whose multiples are to be found
    ; Returns Nothing

    mov ecx, N          ; Initialize the counter to N
    mov esi, eax        ; Initialize the index pointer to the multiple value

L1:
    cmp esi, N          ; Compare the index with N
    jae L2              ; If esi >= N, exit the loop

    mov arr1[esi*4], 1  ; Set the corresponding array element to 1
    add esi, eax        ; Increment index pointer by the multiple value
    jmp L1              ; Repeat the loop

L2:
    ret
Find_Multiples ENDP

END main