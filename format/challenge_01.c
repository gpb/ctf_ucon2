/*
* uCon Security Conference II - Recife / Pernambuco / Brazil - Feb 2009
*        Challenge 01 - Format - Difficulty level 02
*        Author: Marcos Alvares   <marcos.alvares gmail>
*                Gustavo Pimentel <gusbit gmail>
*/

#include <stdio.h>
#include <stdlib.h>
#include <strings.h>

#define OK    0
#define ERRO -1

void __print_sw_title (char *sw_name);

int main (int argc, char *argv[]) {
  if (argc != 2) {
    __print_sw_title(argv[0]);
    return ERRO;
  }

  int overwrite_param = 0;

  printf(argv[1]);

  if (overwrite_param > 0) {
//     This space is reserved to grant privileges to a successful attack
    printf("\n +-+ Bang ! +-+ \n");
  } else {
    printf("\nShut your fucking face, uncle fucka! \n");
  }

  return OK;
}

void __print_sw_title (char *sw_name) {
  printf(" ----------- [%s] ----------- \n", sw_name);
  printf(" ::. Usage: %s <parameters>\n\n", sw_name);
}
