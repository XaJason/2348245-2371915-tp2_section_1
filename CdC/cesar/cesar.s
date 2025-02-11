.text
.globl caesarASM
caesarASM:
pushl %ebp
movl %esp, %ebp
pushl %ebx
movl 8(%ebp), %esi #message initial
movl 8(%ebp), %edi #message initial
movl 12(%ebp), %ecx #clé
# DEBUT COMPLETION

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:   
popl %ebx
leave
ret
