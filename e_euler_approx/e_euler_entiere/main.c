#include <stdio.h>
#include<stdint.h>

extern int32_t e_euler_entiere(int32_t a);

int main(void) {
	int32_t iteration = 10;

	int32_t euler = e_euler_entiere(iteration);
	printf("L'approxmiation de la valeur de e entiere apres %d itérations = %d\n",iteration,euler);
	return 0;
}
