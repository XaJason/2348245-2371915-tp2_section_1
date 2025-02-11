.data
iteration:
.int 3 # nombre de termes de la suite
iteration_FPU:  
.float 3   # no actuel du terme de la suite
factorial_value: # nombre en multiplication (pour faire 1 sur factorial_value apres)
.float 0
factorial: # no actuel du terme de la suite en float
.float 0
e:         # somme de la suite
.float 0
reset:
.float 0
one:
.float 1
.text
.globl e_euler_flottante

e_euler_flottante:
# Prologue 
push %ebp       #Ajustement pour utiliser EBP
mov %esp,%ebp
push %ebx           # Storer les callee-saved sur le dessus de la pile

leal iteration, %ecx
movl (%ecx), %ecx 

# DEBUT COMPLETION


# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
end:
flds e
flds one         # cas 1/0!
faddp

# Epilogue
pop %ebx
leave         # Désallouer les variables locales et ajuster pointeur ebp
ret           # Retour à la fonctione
