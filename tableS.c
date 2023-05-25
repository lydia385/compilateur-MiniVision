#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define HASH_TABLE_SIZE 100

// Structure pour une entrée dans la table des symboles
typedef struct SymbolEntry {
    char* name;
    int value;
    struct SymbolEntry* next;
} SymbolEntry;

// Structure pour la table de hachage
typedef struct HashTable {
    SymbolEntry* entries[HASH_TABLE_SIZE];
} HashTable;

// Fonction pour calculer le hachage d'une chaîne de caractères
unsigned int hash(char* str) {
    unsigned int hashval = 0;
    for (int i = 0; i < strlen(str); i++) {
        hashval += str[i];
        hashval *= 31;
    }
    return hashval % HASH_TABLE_SIZE;
}

// Fonction pour ajouter une entrée à la table des symboles
void add_entry(HashTable* table, char* name, int value) {
    // Calculer l'index dans la table de hachage
    unsigned int index = hash(name);
    
    // Créer une nouvelle entrée
    SymbolEntry* new_entry = malloc(sizeof(SymbolEntry));
    new_entry->name = strdup(name);
    new_entry->value = value;
    
    // Ajouter la nouvelle entrée au début de la liste chaînée à cet index
    new_entry->next = table->entries[index];
    table->entries[index] = new_entry;
}

// Fonction pour chercher une entrée dans la table des symboles
SymbolEntry* find_entry(HashTable* table, char* name) {
    // Calculer l'index dans la table de hachage
    unsigned int index = hash(name);
    
    // Parcourir la liste chaînée à cet index et chercher une entrée avec le nom donné
    SymbolEntry* entry = table->entries[index];
    while (entry != NULL) {
        if (strcmp(entry->name, name) == 0) {
            return entry;
        }
        entry = entry->next;
    }
    return NULL; // Entrée non trouvée
}

// Fonction pour afficher la table des symboles
void print_table(HashTable* table) {
    for (int i = 0; i < HASH_TABLE_SIZE; i++) {
        SymbolEntry* entry = table->entries[i];
        while (entry != NULL) {
            printf("%s = %d\n", entry->name, entry->value);
            entry = entry->next;
        }
    }
}

int main() {
    // Créer une nouvelle table des symboles
    HashTable table;
    for (int i = 0; i < HASH_TABLE_SIZE; i++) {
        table.entries[i] = NULL;
    }
    
    // Ajouter quelques entrées à la table des symboles
    add_entry(&table, "x", 1);
    add_entry(&table, "y", 2);
    add_entry(&table, "z", 3);
    
    // Afficher la table des symboles
    print_table(&table);
    
    // Chercher une entrée dans la table des symboles
    SymbolEntry* entry = find_entry(&table, "y");
    if (entry != NULL) {
        printf("y = %d\n", entry->value);
    } else {
        printf("y n'est pas dans la table des symboles.\n");
    }
}
