#include "../mpc/mpc.h"

#include <editline/readline.h>
#include <editline/history.h>

typedef struct {
  char type;
  double d_val;
  long l_val;
} value_t;

int main(int argc, char** argv) {

  mpc_parser_t* number     = mpc_new("number");
  mpc_parser_t* expression = mpc_new("expression");
  mpc_parser_t* product    = mpc_new("product");
  mpc_parser_t* value      = mpc_new("value");
  mpc_parser_t* top        = mpc_new("top");

  char* lang = " \
     number     : /[0-9]+/                           ; \
     expression : <product> (('+' | '-') <product>)* ; \
     product    : <value> (('*' | '%') <value>)*     ; \
     value      : <number> | '(' <expression> ')'    ; \
     top        : /^/ <expression> /$/               ; \
  ";

  mpca_lang(MPCA_LANG_DEFAULT,lang, number, expression, product, value, top);

  return 0;
}
