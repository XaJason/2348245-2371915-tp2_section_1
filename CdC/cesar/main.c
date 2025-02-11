#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <ctype.h>
#include <string.h> 
#include <stdlib.h>

char* caesarASM(char* message, int key);
void generateRandomString(char *str, int length) {
    char alphabet[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    int alphabetSize = sizeof(alphabet) - 1;

    srand(time(NULL)); 

    for(int i = 0; i < length; i++) {
        int index = rand() % alphabetSize;
        str[i] = alphabet[index];
    }

    str[length] = '\0';
}

char* caesarC(char *text, int key) {
    static char buffer[11]; 
    int i = 0;
    while (text[i]) {
        char ch = text[i];
        if (isalpha(ch)) { 
            char offset = islower(ch) ? 'a' : 'A';
            
            ch = (ch - offset + key) % 26 + offset;
        }
        buffer[i] = ch;
        i++;
    }
    buffer[i] = '\0'; 
    return buffer; 
}

int generateRandomDigit() {
    return rand() % 4+3; 
}

int compareEncryptedMessages(char *msg1, char *msg2) {
    return strcmp(msg1, msg2); 
}

int main() {
    char message[11]; // Size 10 + 1 for the null character
    int key = generateRandomDigit();
    generateRandomString(message, 10);
    printf("Initial Message: %s\n", message);
    printf("key: %d\n", key);

    char* encryptedMessageC = caesarC(message, key);
    printf("Caesar in C: %s\n", encryptedMessageC);

    
    char* encryptedMessageASM = caesarASM(message, key);
    printf("Caesar in ASM: %s\n", encryptedMessageASM);

    if (compareEncryptedMessages(encryptedMessageC, encryptedMessageASM) == 0) {
        printf("Correct.\n");
    } else {
        printf("Incorrect.\n");
    }

    return 0;
}
