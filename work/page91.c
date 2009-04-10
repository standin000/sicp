#include <stdio.h>
typedef int function(int);
void *cons(int x, int y)
{
  int dispatch(int m)
    {
      switch(m)
	{
	case 0:
/* 	  printf("%d\n", x); */
	  return x;
	case 1:
/* 	  printf("%d\n", y); */
	  return y;
	default:
	  printf("Error");
	  return 0;
	}
    }
  return dispatch;
}

int car(function z)
{
  printf("%d\n", z(0));
}
void main(void)
{
  car(cons(1,2));
}
