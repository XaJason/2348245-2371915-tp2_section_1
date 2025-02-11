.data
taille: .byte 0
left: .byte 0
right: .byte 0

.text
.globl isPalindromeASM
isPalindromeASM:
pushl %ebp
movl %esp, %ebp
pushl %ebx
movl 8(%ebp), %esi #potential palindrome
# DEBUT COMPLETION
#compter nombre d'éléments
#left = (%esi) départ
#right -> left + 8* (taille-1) (on va dire) -> le but est d'accéder le dernier élément 
#comparer les pointeurs 
# décrémenter right et incrémenter left
xorl %eax, %eax # il est a 0 
cld
compteur: 
lodsb #déplace esi dans eax(al)
cmp $0,%eax
jz comparateur
incb taille
jmp compteur

comparateur: 
movb taille, %cl
#edge case: taille nulle
movb %cl, right
decb right
movb right, %al






//jle

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:   
popl %ebx
leave
ret
