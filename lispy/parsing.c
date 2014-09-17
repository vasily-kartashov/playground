#include "../mpc/mpc.h"

#include <editline/readline.h>
#include <editline/history.h>

int main(int argc, char** argv) {

  mpc_parser_t* Number     = mpc_new("num");
  mpc_parser_t* Operator   = mpc_new("op");
  mpc_parser_t* Expression = mpc_new("exp");
  mpc_parser_t* Language   = mpc_new("lang");
  
  /* Define them with the following Language */
  mpca_lang(MPCA_LANG_DEFAULT,
    "                                            \
      num  : /-?[0-9]+(\\.[0-9]+)?/ ;            \
      op   : '+' | '-' | '*' | '/' | '%' ;       \
      exp  : <num> | '(' <exp> <op> <exp> ')' ;  \
      lang : /^/ <exp> <op> <exp> /$/ ;  \
    ",
    Number, Operator, Expression, Language);
  
  puts("Lispy Version 0.0.0.0.2");
  puts("Press Ctrl+c to Exit\n");
  
  while (1) {
  
    char* input = readline("lispy> ");
    add_history(input);
    
    /* Attempt to parse the user input */
    mpc_result_t r;
    if (mpc_parse("<stdin>", input, Language, &r)) {
      /* On success print and delete the AST */
      mpc_ast_print(r.output);
      mpc_ast_delete(r.output);
    } else {
      /* Otherwise print and delete the Error */
      mpc_err_print(r.error);
      mpc_err_delete(r.error);
    }
    
    free(input);
  }
  
  /* Undefine and delete our parsers */
  mpc_cleanup(4, Number, Operator, Expression, Language);
  
  return 0;
}  
