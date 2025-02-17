.data
zero: .long 0
one: .long 1

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
movl one, %ebx
movl one, %ecx

iteration:
cmp %esi, %ecx
ja end

imull %ecx, %ebx
movl one, %eax
movl zero, %edx
divl %ebx
addl %eax, -4(%ebp)
addl $1, %ecx
jmp iteration

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
 
