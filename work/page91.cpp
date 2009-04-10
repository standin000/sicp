#include <iostream> 
using namespace std;
class PAIR{
 private:
  int x, y;
 public:
  PAIR(int a,int b)
  {
    x = a;
    y = b;
  }
  int get_x(void)
  {
    return x;
  }
  int get_y(void)
  {
    return y;
  }
};

PAIR cons(int x, int y)
{
  PAIR pair=PAIR(x,y);
  return pair;
}
int car(PAIR pair)
{
  return pair.get_x();
}
int cdr(PAIR pair)
{
  return pair.get_y();
}

int main(void)
{
  PAIR pair = cons(1,2);
  cout<<"car:"<<car(pair)<<"\n";
  cout<<"cdr:"<<cdr(pair)<<"\n";
  return 1;
}
