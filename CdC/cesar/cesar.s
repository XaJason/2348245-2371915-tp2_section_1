.data
lowercase_max: .byte 0x7a
uppercase_max: .byte 0x5a
alphabet_length: .byte 26

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
movb lowercase_max, %bl
movb uppercase_max, %bh
movl alphabet_length, %eax

decode_string:
cmpb $0, (%esi)
je end_decoding
cmpb %bh, (%esi)
jg decode_lowercase
jmp decode_uppercase

decode_uppercase:
movb %bh, %dl
jmp apply_key

decode_lowercase:
movb %bl, %dl
jmp apply_key

apply_key:
addb %cl, (%esi)
jmp test_limits

test_limits:
cmp %dl, (%esi)
ja alphabet_loop
inc %esi
jmp decode_string

alphabet_loop:
subb %al, (%esi)
jmp test_limits

end_decoding:
movl %edi, %eax
# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:   
popl %ebx
leave
ret
