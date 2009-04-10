#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include <stdarg.h>
#include"interpreter.h"

#define CALLSTACK_STRING_LENGTH 10240

char callstack_string[CALLSTACK_STRING_LENGTH];
char *callstack_string_p = callstack_string;
char *oldcallstack_string_p = callstack_string;

char *callstack_malloc(int length)
{
    length ++; 			/* for storing '\0' */
    
    if(callstack_string_p + length > callstack_string + CALLSTACK_STRING_LENGTH)
	callstack_string_p = callstack_string;

    memset(callstack_string_p, 0, length);
    
    callstack_string_p += length;

    return callstack_string_p - length;
}

inline bool ispair(char *exp)
{
    /* it need more codes here in the furture to judge other situation. */
    return (exp[0] == '(') && (strchr(exp, ')') != NULL);
}

char *car(char *exp)
{
    char *p, *stack_string_p, flag = 0;

    p = stack_string_p = callstack_malloc(strlen(exp));
    if(strcmp(exp,"()") == 0)
    {
	/* elisp think it is right and return nil but MIT scheme will report
	 * error!*/
/* 	strcpy(stack_string_p,"()"); */
/* 	return stack_string_p; */
	return NULL;
    }
    exp++;
    do{
	*p = *exp;
	if(*exp == '(')
	    flag ++;
	if(*exp == ')')
	    flag --;
	exp++;
	p ++;
    }while(!((flag == 0) && ((*exp == ' ') || (*(exp + 1) == '\0'))));

    return stack_string_p;
}
char *cdr(char *exp)
{
    char *p, *stack_string_p, flag = 0;
    p = stack_string_p = callstack_malloc(strlen(exp));
    if(strcmp(exp,"()") == 0)
    {
	/* elisp think it is right and return nil but MIT scheme will report
	 * error!*/
/* 	strcpy(stack_string_p,"()"); */
/* 	return stack_string_p; */
	return NULL;
    }

    *p++ = '(';
    exp++;
    do{
	if(*exp == '(')
	    flag ++;
	if(*exp == ')')
	    flag --;
	exp++;
    }while(!((flag == 0) && ((*exp == ' ') || (*(exp + 1) == '\0'))));
    
    if(*(exp + 1) == '\0')
	*p++ = *exp;
    else
	for(exp++;*exp != '\0';exp++,p++)
	    *p = *exp;

    return stack_string_p;
}

char *insert(char *exp, char* element)
{
    char *stack_string_p;
    int length = strlen(exp), t;
    
//    stack_string_p = callstack_malloc(length + strlen(element) + 1);
    stack_string_p = malloc(length + strlen(element) + 2);
    strcpy(stack_string_p, exp);

    
    free(exp);
    if(strcmp(stack_string_p,"()"))
	*(stack_string_p + length - 1) = ' ';
    else
	*(stack_string_p + length - 1) = '\0';
    strcat(stack_string_p, element);
    strcat(stack_string_p,")");
    return stack_string_p;
}
/* It need a argument indicate the number of variable arguments
 * for C language.*/
char *list(int n, ...)
{
    char *e, *stack_string_p;
    int i,l;
    va_list arg_ptr;
    va_start(arg_ptr, n);

    l = 0;
    for(i = 0;i < n; i++)
    {
	e = va_arg(arg_ptr, char *);
	l+=strlen(e);
	l++;
    }
    
    va_start(arg_ptr, n);
    stack_string_p = callstack_malloc(l+2);
    
    strcpy(stack_string_p,"(");
    e = va_arg(arg_ptr, char *);
    strcat(stack_string_p, e);
    for(i = 0;i < n - 2; i++)
    {
	strcat(stack_string_p, " ");
	e = va_arg(arg_ptr, char *);
	strcat(stack_string_p, e);
    }
    if(n >= 2)
    {
	e = va_arg(arg_ptr, char *);
	if(strcmp(e,"()"))
	{
	    strcat(stack_string_p, " ");
	    strcat(stack_string_p, e);
	}
    }
    
    strcat(stack_string_p, ")");

    va_end(arg_ptr);
    return stack_string_p;
}

inline char *cadr(char *exp)
{
    return car(cdr(exp));
}
inline char *caddr(char *exp)
{
    return car(cdr(cdr(exp)));
}
inline char *cadddr(char *exp)
{
    return car(cdr(cdr(cdr(exp))));
}

bool tag_check(char *e, char *sym)
{
    if(ispair(e))
    {
	return (strcmp(car(e), sym) == 0);
    }
       
    return 0;
}
char prim_tag[10] = "primitive";

inline bool isprimitive(char *e)
{
    return tag_check(e, prim_tag);
}

inline char *make_primitive(char* procedure)
{
    return list(2, prim_tag, procedure);
}

inline char *get_scheme_procedure(char *prim)
{
    return cadr(prim);
}

char compound_tag[9] = "compound";
inline char *make_compound(char *parameters, char *body, TABLE env)
{
    return list(4, compound_tag, parameters, body, env);
}
inline bool iscompound(char *exp)
{
    return tag_check(exp, compound_tag);
}
inline char *parameters(char *compound)
{
    return cadr(compound);
}
inline char *body(char *compound)
{
    return caddr(compound);
}
inline char *env(char *compound)
{
    return cadddr(compound);
}

char *map(SINGLE_OPERATOR operator, char *operands,TABLE *env)
{

    char *e1,*e2, *stack_string_p;
    stack_string_p = callstack_malloc(strlen(operands));
    
    strcat(stack_string_p,"(");
    
    e1 = car(operands);

    if(strcmp(e1,"()") == 0)
    {
	return e1;
    }

    strcat(stack_string_p, operator(e1, env));
    e2 = cdr(operands);
    while(strcmp(e2, "()"))
    {
	e1 = car(e2);
	e2 = cdr(e2);
	strcat(stack_string_p," ");
	strcat(stack_string_p, operator(e1, env));
    }

    strcat(stack_string_p,")");
    
    return stack_string_p;
}
char *_apply(char *procedure, char *e1, char *e2)
{
    char *stack_string_p;

    if(strcmp(procedure, "+") == 0)
    {
	int i,j;
	
	i = strlen(e1);
	j = strlen(e2);
	
	stack_string_p = callstack_malloc(i > j ? i+1:j+1);

	sprintf(stack_string_p, "%d",
	    atoi(e1) + atoi(e2));
    
	return stack_string_p;
    }
    if(strcmp(procedure, "-") == 0)
    {
	int i,j;
	
	i = strlen(e1);
	j = strlen(e2);
	
	stack_string_p = callstack_malloc(i > j ? i+1:j+1);

	sprintf(stack_string_p, "%d",
	    atoi(e1) - atoi(e2));
    
	return stack_string_p;
    }
    if(strcmp(procedure, "*") == 0)
    {
	int i,j;
	
	i = strlen(e1);
	j = strlen(e2);
	
	stack_string_p = callstack_malloc(i+j);

	sprintf(stack_string_p, "%d",
	    atoi(e1) * atoi(e2));
    
	return stack_string_p;
    }
    if(strcmp(procedure, "/") == 0)
    {
	int i,j;
	
	i = strlen(e1);
	j = strlen(e2);
	
	stack_string_p = callstack_malloc(i > j ? i:j);

	sprintf(stack_string_p, "%d",
	    atoi(e1) / atoi(e2));
    
	return stack_string_p;
    }

    if(strcmp(procedure, ">") == 0)
    {
	stack_string_p = callstack_malloc(2);
	if(atoi(e1) > atoi(e2))
	    sprintf(stack_string_p, "#t");
	else
	    sprintf(stack_string_p, "#f");

	return stack_string_p;
    }
    if(strcmp(procedure, "<") == 0)
    {
	stack_string_p = callstack_malloc(2);
	if(atoi(e1) < atoi(e2))
	    sprintf(stack_string_p, "#t");
	else
	    sprintf(stack_string_p, "#f");

	return stack_string_p;
    }

}
void make_bindings(char *names, char *values, TABLE *table)
{
    char *name, *value;
    while(strcmp(names,"()"))
    {
	name = car(names);
	value = car(values);
	table_put(table, name, value);
	names = cdr(names);
	values = cdr(values);
    }
}

TABLE *extend_env_with_new_frame(char *names, char *values, TABLE env)
{
    TABLE new_frame[1], *frame;
    new_frame[0] = make_table();
    make_bindings(names, values, new_frame);
    frame = malloc(sizeof(char *));
    *frame = malloc(strlen(*new_frame) + strlen(env) + 4);
    if(strcmp(env,"()"))
	strcpy(*frame,list(2, *new_frame, car(env)));
    else
	strcpy(*frame,list(2, *new_frame, env));
//    strcpy(*frame,insert(*new_frame, env));
    return frame;
}

char *apply(char *operator, char *operands)
{
    if(isprimitive(operator))
    {
	char *procedure, *e1, *e2, *e3;
	procedure = get_scheme_procedure(operator);
	e1 = car(operands);
	e2 = cdr(operands);
	if(strcmp(e2,"()") == 0)
	{
	    return e1;
	}
	while(strcmp(e2, "()"))
	{
	    e3 = car(e2);
	    e1 = _apply(procedure, e1, e3);
	    e2 = cdr(e2);
	}
	return e1;
    }
    if(iscompound(operator))
	return eval(body(operator), 
		    extend_env_with_new_frame(
			parameters(operator),
			operands,
			env(operator)));

    printf("operator not a procedure: %s\n",operands);
    exit(0);
    
}

/* inline bool issum(char *e) */
/* { */
/*     return tag_check(e, "plus*"); */
/* } */
    
bool isnumber(char *e)
{
    for(;*e != '\0';e++)
	if(!isdigit(*e))
	    return 0;
    return 1;
}
inline bool isdefine(char *e)
{
    return tag_check(e, "define*");
}

bool issymbol(char *e)
{
    for(;*e != '\0';e++)
	if((!isalpha(*e)) && (*e != '*'))
	    return 0;
    return 1;
}

inline bool isapplication(char *e)
{
    return ispair(e);
}
inline bool islambda(char *e)
{
    return tag_check(e, "lambda*");
}

TABLE make_table(void)
{
    char *p;
//    p = callstack_malloc(2);
    p = malloc(3);
    strcpy(p, "()");
    return p;
}
TABLE environment[1];

TABLE table_get(TABLE t, char *key)
{
    char *element, *p;

    p = t;
    while(strcmp(p,"()"))
    {
	element = car(p);
	if(strcmp(car(element), key) == 0)
	{
	    return element;
	}
	p = cdr(p);
    }
    return NULL;
    
}

void table_put(TABLE *t, char *key, char *value)
{
    char *p;

    p = callstack_malloc(strlen(key) + strlen(value) + 3);
    strcpy(p,"(");
    strcat(p,key);
    strcat(p," ");
    strcat(p,value);
    strcat(p,")");
    *t = insert(*t,p);
}
char *binding_value(TABLE binding)
{
    return cadr(binding);
}

/* char *eval_sum(char *exp) */
/* { */
/*     char *stack_string_p; */
	
/*     stack_string_p = callstack_malloc(strlen(exp)); */
    
/*     sprintf(stack_string_p, "%d", */
/* 	    atoi(eval(cadr(exp))) + atoi(eval(caddr(exp)))); */
    
/*     return stack_string_p; */
/* } */
char *lookup(char *name, TABLE env)
{
    TABLE binding;
    if(strcmp(env,"()") == 0)
    {
	printf("unbound variable:%s\n", name);
	exit(0);
    }

    binding = table_get(car(env), name);
    if(binding == NULL)
    {
	return lookup(name, cdr(env));
    }else
    {
	return binding_value(binding);
    }
}
char *eval_define(char *exp, TABLE *env)
{
    char *name = cadr(exp);
    char *defined_to_be = caddr(exp);
    char *stack_string_p, *carp, *cdrp, *t[1];
    carp = car(*env);
    cdrp = cadr(*env);
    t[0] = malloc(strlen(carp) + 1);
    strcpy(t[0], carp);
    
    table_put(t, name, eval(defined_to_be, env));
    free(env[0]);
    if(cdrp)
    {
	env[0] = malloc(strlen(t[0]) + strlen(cdrp) + 4);
	strcpy(env[0],list(2, t[0], cdrp));
    }else
    {
	env[0] = malloc(strlen(t[0]) + 3);
	strcpy(env[0],list(2, t[0], "()"));
    }
    
    stack_string_p = callstack_malloc(10);
    
    sprintf(stack_string_p, "undefined");
    return stack_string_p;
}
/* inline bool isgreater(char *exp) */
/* { */
/*     return tag_check(exp, "greater*"); */
/* } */
inline bool isif(char *exp)
{
    return tag_check(exp, "if*");
}
/* char *eval_greater(char *exp) */
/* { */
/*     char *stack_string_p = callstack_malloc(2); */
    
/*     if(atoi(eval(cadr(exp))) > atoi(eval(caddr(exp)))) */
/*     { */
/* 	sprintf(stack_string_p, "#t"); */
/*     }else */
/*     { */
/* 	sprintf(stack_string_p, "#f"); */
/*     } */
    
/*     return stack_string_p; */
/* } */
char *eval_if(char *exp, TABLE *env)
{
    char *predicate = cadr(exp);
    char *consequent = caddr(exp);
    char *alternative = cadddr(exp);
    char *test = eval(predicate, env);

    if(strcmp(test, "#t") == 0)
	return eval(consequent, env);

    if(strcmp(test, "#f") == 0)
       return eval(alternative, env);

    printf("predicate not a conditional:%s\n", predicate);
    exit(0);
}
char *eval_lambda(char *exp, TABLE *env)
{
    char *args = cadr(exp);
    char *body = caddr(exp);
    return make_compound(args, body, *env);
}

char *eval(char *exp, TABLE *env)
{
    if(isnumber(exp))
	return exp;

/*     if(issum(exp)) */
/* 	return eval_sum(exp); */
    
    if(issymbol(exp))
	return lookup(exp, *env);
    
    if(isdefine(exp))
	return eval_define(exp, env);

/*     if(isgreater(exp)) */
/* 	return eval_greater(exp); */
    
    if(isif(exp))
	return eval_if(exp, env);

    if(islambda(exp))
	return eval_lambda(exp, env);

    if(isapplication(exp))
	return apply(eval(car(exp), env),map(eval, cdr(exp), env));
        
    printf("unknown expression:%s\n", exp);
    exit(0);
}

int main(int argc,char *argv[])
{
/*     if(ispair("(ab)")) */
/* 	printf("OK\n"); */
/*     printf("%s\n",car("()")); */
/*     printf("%s\n",car("(d b)")); */
/*     printf("%s\n",car("(c (b c))")); */
/*     printf("%s\n",cdr("()")); */
/*     printf("%s\n",cadr("(primitive +)")); */
/*      printf("%s\n",cdr("(c (b c))")); */
/*      printf("%s\n",caddr("(if* (greater* y* 6) (plus* y* 2) 15)")); */
/*      printf("%s\n",car("((plus* 5 6))")); */
/*      printf("%s\n",caddr("(plus* 24 (plus* 5 6))")); */
/*      printf("%s\n", eval("(plus* 24 (plus* 5 6))")); */
/*      printf("%s\n", eval("(plus* 15 (plus* 24 (plus* 5 6)))")); */
/*     TABLE t, *environment, *p; */
/*     strcpy(t.key,"1"); */
/*     strcpy(t.value,"a"); */
/*     table_put(environment, t); */
/*     strcpy(t.key,"2"); */
/*     strcpy(t.value,"b"); */
/*     table_put(environment, t); */
/*     strcpy(t.key,"3"); */
/*     strcpy(t.value,"c"); */
/*     table_put(environment, t); */
/*     p = table_get(environment,"3"); */
/*     if(p != NULL) */
/* 	printf("%s,%s\n",p->key,p->value); */
/*     p = table_get(environment,"2"); */
/*     if(p != NULL) */
/* 	printf("%s,%s\n",p->key,p->value); */
/*     p = table_get(environment,"1"); */
/*     if(p != NULL) */
/* 	printf("%s,%s\n",p->key,p->value); */
/*     environment[0] = make_table(); */
/*     table_put(environment, "plus*", make_primitive("+")); */
/*     table_put(environment, "greater*", make_primitive(">")); */
/*     table_put(environment, "true*", "#t"); */
    TABLE *GE;FILE *f;
    
    GE = extend_env_with_new_frame(
	list(8, "plus*", "sub*", "mul*", "div*", 
	     "greater*", "less*", "true*","false*"),
	list(8, make_primitive("+"),make_primitive("-"),make_primitive("*"),
	     make_primitive("/"),make_primitive(">"), make_primitive("<"),
	     "#t","#f"),
	"()");
/*     printf("%s\n", *GE); */
/*     printf("%s\n", eval("(mul* 4 5)", GE)); */
//    printf("%s\n", eval("(define* z* (plus* 4 5))", GE));
/*     printf("%s\n", *GE); */
//    printf("%s\n", eval("(if* (greater* z* 6) 10 15)", GE));
    
    if(argc == 2)
    {
	char line[255],p = 0;
	
	f = fopen(argv[1],"r");
//	f = fopen("input.txt","r");
	while(!feof(f))
	{
	    line[p++] = fgetc(f);
	    if((p > 1) && ((line[p - 1] == '\n') || (line[p - 1] == EOF)))
	    {
		line[p - 1] = '\0';
		printf("%s\n", eval(line, GE));
		p = 0;
	    }
	}
	fclose(f);
    }else
	printf("You should give me a input file!\n");
	
/*     printf("%s\n", eval("(define* twice* (lambda* (x*) (plus* x* x*)))", GE)); */
/*     printf("%s\n", *GE); */
/*     printf("%s\n", eval("(twice* 9)", GE)); */

/*     printf("%s\n", eval("(define* z* (plus* 4 5))", GE)); */
/*     printf("%s\n", eval("(if* (greater* z* 6) 10 15)",GE)); */
/*     printf("%s\n", eval("(greater* z* 6)",GE)); */

/*     printf("%s\n", lookup("true*", *GE)); */

/*     AE = extend_env_with_new_frame( */
/* 	list(1, "a"), */
/* 	list(1, "3"), */
/* 	*GE); */
/* /\*     printf("%s\n", *AE); *\/ */
/*     printf("%s\n", lookup("a", *AE)); */
/*     printf("%s\n", lookup("true*", *AE)); */


/*    printf("%s\n", apply(make_primitive("+"),"(1 4 6 8)")); */
/*     printf("%s\n", eval("(plus* 9 7 8)")); */
/*     printf("%s\n", eval("(define* z* 9)")); */
/*     printf("%s\n", eval("(if* (greater* z* 6) (plus* z* 2) 15)")); */
/*     printf("%s\n", eval("(if* true* 10 15)")); */

/*     printf("%s\n", map(eval,"((plus* 1 2) 2 (plus* 4 6))")); */
    
    
/*     printf("%s\n", eval("(define* x* (plus* 4 5))")); */
/*     printf("%s\n", eval("(define* y* 9)")); */
/*     printf("%s\n", eval("(plus* y* 2)")); */
/*     printf("%s\n", eval("(greater* y* 6)")); */
/*     printf("%s\n", eval("(if* (greater* 9 6) 14 20)")); */

/*     printf("%s\n", list(2, "a","b")); */
/*     printf("%s\n", list(3, "(a)","b","(c)")); */
/*     printf("%s\n", list(1, "a")); */
/*     printf("%s\n", insert("()","a")); */
/*     printf("%s\n", insert("()","(a)")); */
/*     printf("%s\n", insert("()","(a v)")); */
/*     printf("%s\n", insert("((a c))","(a v)")); */
/*     printf("%s\n", insert("((a c) (d g))","(a v)")); */


/*     table_put(environment,"1","a"); */
/*     printf("%s\n", environment[0]); */
/*     table_put(environment,"2","b"); */
/*     printf("%s\n", environment[0]); */
/*     table_put(environment,"3","c"); */
/*     printf("%s\n", environment[0]); */
/*     printf("%s\n", table_get(environment,"2")); */
/*     printf("%s\n", table_get(environment,"1")); */
/*     printf("%s\n", table_get(environment,"3")); */
}
