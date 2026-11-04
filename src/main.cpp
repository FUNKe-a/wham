#include <iostream>
#include "parser.tab.hpp"

int main(int argc, char** argv) {
    std::cout << "Starting my compiler..." << std::endl;
    
    return yyparse(); 
}
