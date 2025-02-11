.text
.globl isPalindromeASM
isPalindromeASM:
pushl %ebp
movl %esp, %ebp
pushl %ebx
movl 8(%ebp), %esi #potential palindrome
# DEBUT COMPLETION


# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:   
popl %ebx
leave
ret
