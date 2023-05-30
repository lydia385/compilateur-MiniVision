#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ts.h"



///// Data structure 

typedef struct Node {
    char key[100];
    int value;
    struct Node* next;
} Node;


typedef struct HashTable {
    Node* buckets[500];
} HashTable;

HashTable* tab_sym[1000];


/// Funtions : 

int hash_function(char *chaine)
{
    int hash = 0;
    int i=0;
    while(chaine[i] != '\0'){

        hash += chaine[i];
        i=i+1;
    }

    return hash % 500;
}
void insert(HashTable* hashTable, const char* key, int value) {
    int index = hash_function(key);
    Node* newNode = (Node*)malloc(sizeof(Node));
    strcpy(newNode->key, key);
    newNode->value = value;
    newNode->next = NULL;
    if (hashTable->buckets[index] == NULL) {
        hashTable->buckets[index] = newNode;
    } else {
        newNode->next = hashTable->buckets[index];
        hashTable->buckets[index] = newNode;
    }
}


int Search(HashTable* hashTable, const char* key) {
    unsigned int index = hash_function(key);
    Node* currentNode = hashTable->buckets[index];
    while (currentNode != NULL) {
        if (strcmp(currentNode->key, key) == 0) {
            return currentNode->value;
        }
        currentNode = currentNode->next;
    }
    return -1;
}



void Display(HashTable* hashTable) {
    printf("\n/=========Table des symboles =============/\n");
    printf("_____________________________________\n");


    for (int i = 0; i < 500; i++) {
        if (hashTable->buckets[i] == NULL) {
            printf("Element vide\n");
        } else {
            Node* currentNode = hashTable->buckets[i];
            while (currentNode != NULL) {
                printf("(%d, %d) ", currentNode->key, currentNode->value);
                currentNode = currentNode->next;
            }
            printf("\n");
        }
    }
}