typedef char bool;
typedef char *TABLE;

//typedef char *(*DYADIC_OPERATOR)(char *);
typedef char *(*SINGLE_OPERATOR)(char *, TABLE *env);
