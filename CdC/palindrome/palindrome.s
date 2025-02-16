.data
one: .byte 1
zero: .byte 0

.text
.globl isPalindromeASM
isPalindromeASM:
pushl %ebp
movl %esp, %ebp
pushl %ebx
movl 8(%ebp), %esi #potential palindrome
# DEBUT COMPLETION
movl %esi, %ebx
movb zero, %ah
movl $0, %edx

counter:
lodsb
cmp %ah,%al
jz set_pointers
incl %edx
jmp counter

set_pointers: 
decl %edx
movl zero, %ecx
movl %ebx, %esi

compare_letters:
cmp %ecx, %edx
jbe isPalindrome
movb (%esi, %ecx, 1), %bl
movb (%esi, %edx, 1), %bh
cmp %bl, %bh
jne isNotPalindrome
inc %ecx
dec %edx
jmp compare_letters

isPalindrome:
movl one, %eax
jmp retour

isNotPalindrome:
movl zero, %eax
jmp retour

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:   
popl %ebx
leave
ret
