#include <stdio.h>
#include <stdlib.h>
/**********************************************************/
/* Author: Elroy Kanye                                    */
/* Created on: 08 November 2021                           */
/*                                                        */
/* Program :                                              */
/*      Generate the required packages for the project    */
/**********************************************************/

void setup_dirs() {
    const char *directories[][5] = {
        {"api", "controller", "dto"},
        {"business", "service", "service/impl", "mapper"},
        {"config",  "global"},
        {"data", "entity", "repository"},
        {"exception", "advices"}
    };

    for (int i = 0; i < 5; i++) {
        printf("%s\n", directories[i][0]);
    }
}
int main(void) {
    setup_dirs();


}