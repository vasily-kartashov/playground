#include "../mpc/mpc.h"

#include <editline/readline.h>
#include <editline/history.h>

#define ONOP(a,o,c) if (strcmp((a),(o)) == 0) { return (c);}

long eval(mpc_ast_t* t) {

  if (strstr(t->tag, "num")) {
    return atoi(t->contents);
  }
  char* op = t->children[2]->contents;
  long x = eval(t->children[1]);
  long y = eval(t->children[3]);

  ONOP(op, "+", x + y);
  ONOP(op, "-", x - y);
  ONOP(op, "*", x * y);
  ONOP(op, "/", x / y);
  ONOP(op, "%", x % y);

  return 0;
}

int main(int argc, char** argv) {

  mpc_parser_t* Number     = mpc_new("num");
  mpc_parser_t* Operator   = mpc_new("op");
  mpc_parser_t* Expression = mpc_new("exp");
  
  mpca_lang(MPCA_LANG_DEFAULT,
    "                                            \
      num  : /-?[0-9]+(\\.[0-9]+)?/ ;            \
      op   : '+' | '-' | '*' | '/' | '%' ;       \
      exp  : <num> | '(' <exp> <op> <exp> ')' ;  \
    ",
    Number, Operator, Expression);
  
  puts("Lispy Version 0.0.0.0.2");
  puts("Press Ctrl+c to Exit\n");
  
  while (1) {
  
    char* input = readline("lispy> ");
    add_history(input);
    
    mpc_result_t r;
    if (mpc_parse("<stdin>", input, Expression, &r)) {
      long result = eval(r.output);
      printf("%li\n", result);
      mpc_ast_delete(r.output);
    } else {
      mpc_err_print(r.error);
      mpc_err_delete(r.error);
    }
    
    free(input);
  }
  
  mpc_cleanup(4, Number, Operator, Expression);
  return 0;
}  
