.data
elem0: .byte 1
index: .byte 0
compteur: .byte 10
x: .long 1

.text
.globl e_euler_entiere

e_euler_entiere:
# Prologue

push %ebp          #Ajustement pour utiliser EBP
mov %esp,%ebp

subl $4, %esp      # Faire espace sur la pile pour la variable locale

push %ebx          # Storer les callee-saved sur le dessus de la pile
push %esi
push %edi

movl 8(%ebp),%esi   # esi = iteration 10 

movl $0, -4(%ebp)    # Initialise la somme à 0 dans une variable locale

# DEBUT COMPLETION
mov $1, %eax 
mov $0, %edx
mov $1, %ebx #sommation
mov $1, %ecx # assignation à 1 vu qu'il commence avec 1/0!

sigma: 
mov compteur, %bl
mov %bl, index
cmpb $0, index
jnz factorielle 
cmpb $0, compteur
jnz sigma 
jmp end

factorielle: 
imul x, %ebx
incb x
decb index
jnz factorielle
mov $1, %eax
div %ebx
addl %eax, %ecx #division
decb compteur
mov $1, %ebx
movb $1, x
jmp sigma


# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
end:
addl $0x01, -4(%ebp) # cas 1/0!


# Epilogue
movl -4(%ebp), %eax   # Sauver la variable locale

pop %edi              # Restaurer les callee-saved
pop %esi
pop %ebx
leave                 # Désallouer les variables locales et ajuster pointeur ebp
ret                   # Retour à la fonctione

