# Caller-saved registers: eax, ecx, edx
.data
taille: .byte 0
left: .byte 0
right: .byte 0
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
pushl %esi
xorl %eax, %eax # il est a 0 
cld
compteur: 
lodsb #déplace esi dans eax(al)
cmp $0,%al
jz comparateur
incb taille
jmp compteur

comparateur: 
movb taille, %cl
#edge case: taille nulle
movb %cl, right
decb right
movzbl right, %ecx
movzbl left, %edx
popl %esi
comparison:
cmp %edx, %ecx
jle isPalindrome

movb (%esi, %edx, 1), %al
movb (%esi, %ecx, 1), %ah
cmp %al, %ah
jne notPalindrome
inc %edx
dec %ecx
jmp comparison

isPalindrome:
movl one, %eax
jmp retour
notPalindrome:
movl zero, %eax
jmp retour
# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:   
popl %ebx
leave
ret
