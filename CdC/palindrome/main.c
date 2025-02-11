#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <ctype.h>
#include <string.h> 
#include <stdlib.h>

int isPalindromeASM(char* message); 


char *palindromes[] = {
    "bib", "Bob", "dad", "deed", "did", "eve", "ewe", "eye", "kayak", "maam",
    "madam", "mem", "mesem", "mim", "minim", "mum", "murdrum", "radar",
    "redder", "refer", "repaper", "retter", "rever", "reviver", "rotator",
    "rotor", "tat", "tebbet", "teet", "tenet", "terret", "tit", "toot", "tot",
    "tst", "tut", "tyt", "civic", "skibidi", "toilet", "okokokokokokaaa", "inf1600", "kiettt", "okayy", "sunshine", "meow", "according",
    "account", "across", "act", "action", "activity", "actually", "add", "address", "administration", "admit", "adult", "affect", "after", "again", "against", "age", "agency", "agent", "ago", "agree", "agreement", "ahead", "air", "all", "allow", "almost", "alone", "along", "already", "also", "although", "always", "American", "among", "amount", "analysis", "and", "animal", "another", "answer", "any", "anyone", "anything", "appear", "apply", "approach", "area", "argue", "arm", "around", "arrive", "art", "article", "artist", "as", "ask", "assume", "at", "attack", "attention", "attorney", "audience", "author", "authority", "available", "avoid", "away", "baby"
};


void selectRandomPalindrome(char *str) {
    int palindromeCount = sizeof(palindromes) / sizeof(palindromes[0]); 
    srand(time(NULL)); 

    int index = rand() % palindromeCount; 
    strcpy(str, palindromes[index]); 
}

int isPalindromeC(char *text) {
    int start = 0;
    int end = strlen(text) - 1;

    while (start < end) {
        if (text[start] != text[end]) {
            return 0;
        }
        start++;
        end--;
    }
    return 1; 
}

int main() {
    char message[20]; 
    selectRandomPalindrome(message); 
    printf("Selected Palindrome: %s\n", message);

    int resultC = isPalindromeC(message);
    printf("Palindrome check in C: %s\n", resultC ? "True" : "False");

    int resultASM = isPalindromeASM(message);
    printf("Palindrome check in ASM: %s\n", resultASM ? "True" : "False");


    if (resultC == resultASM) {
        printf("Both implementations agree on the result.\n");
    } else {
        printf("There is a discrepancy between the results.\n");
    }

    return 0;
}
