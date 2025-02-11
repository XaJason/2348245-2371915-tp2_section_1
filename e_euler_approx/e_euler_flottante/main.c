#include <stdio.h>
#include<stdint.h>

extern float e_euler_flottante();

int main(void) {
	float euler = e_euler_flottante();
	printf("L'approxmiation de la valeur de e flottante apres 3 itérations = %f\n",euler);
	return 0;
}
