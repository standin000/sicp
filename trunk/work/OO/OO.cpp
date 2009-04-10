//C++ is a language which support object-based & object-oriented programming,
//but we usually emphasize object-oriented, but in fact they can be separated.
//Some language just support object-based programming. So I try to use C++'s
//object-based mechanism to implement object-oriented mechanism, in another
//word, implement another inheritance mechanism with simple class.
using namespace std;
#include <iostream>

class make_instance;
typedef void *(*VOIDFUNC_TYPE)(make_instance *object, char *message, va_list arg_ptr);

class make_instance{
private:
public:
  VOIDFUNC_TYPE handler;
  make_instance(void)
  {
    handler = NULL;
  }
  void set_handler(VOIDFUNC_TYPE handler_proc)
  {
    handler = handler_proc;
  }
  void* dealer(make_instance *object, char *message, va_list arg_ptr)
  {
    if(strcmp(message, "SET_HANDLER") == 0)
      {
	VOIDFUNC_TYPE handler_proc;
	handler_proc = va_arg(arg_ptr, VOIDFUNC_TYPE);
	set_handler(handler_proc);
      }
    else
	return handler(object, message, arg_ptr);
  }
};
// In order to get a uniform ask, I have to
// 1. use va_list type variable as pass parameter between ask and
// class's method
// 2. use make_instance type variable to call dealer method, or I
// may use a base class which has dealer method and all other class
// inherit from it,but I want to implement inheritance mechanism
// so I do not use this method.
void *ask(make_instance *object, char *message, ...)
{
  va_list arg_ptr;
  void *handler;
  va_start(arg_ptr, message);
  handler = object->dealer(object, message, arg_ptr);
  va_end(arg_ptr);
  return handler;
}
class root{
public:
  make_instance instance;
  static void *root_dealer(make_instance *self, char *message, va_list arg_ptr)
  {
    if(strcmp(message, "TYPE") == 0)
	return (void *)"root";
    else if(strcmp(message, "IS-A") == 0)
      {
	char *type;
	type = va_arg(arg_ptr, char *);
	if(strcmp(type, (char *)ask(self, "TYPE")) == 0)
	  return (void *)1;
	else
	  return (void *)0;
      }else
	return NULL;
  }
  root()
  {
    ask(&instance, "SET_HANDLER", root_dealer);
  }
};
class named_object{
public:
  make_instance instance;
  static void *named_object_dealer(make_instance *self,
				   char *message, va_list arg_ptr)
  {
    // This system default method is virtual function, it will
    // always use its method no matter which type instance is pointed.
    // It also can use a virtual table to determine whether use
    // base class's method.
    if(strcmp(message, "TYPE") == 0)
	return (void *)"named_object";
    else if(strcmp(message, "NAME") == 0)
	// It use a trick that the address of make_instance type
	// variables of object and its is the same. Maybe there
	// exists a better mean.
	return (void *)((named_object*)self)->name;
    else
      // It can also use ((named_object*)self)->root_part.instance
      // as self parameter, it meeans it delegate its superclass
      // to handle this message.
      return ((named_object*)self)->root_part.instance.dealer
	(self, message, arg_ptr);
  }
  named_object(char *s)
  {
    strcpy(name,s); 
    ask(&instance, "SET_HANDLER", named_object_dealer);
  }
private:
  char name[255];
  root root_part;
};
int main(int i)
{
  root root_part;
  cout<<(char *)ask(&root_part.instance, "TYPE")<<endl;
  if(ask(&root_part.instance, "IS-A", "root"))
    cout<<"OK"<<endl;
  named_object named_part("First");
  cout<<(char *)ask(&named_part.instance, "TYPE")<<endl;
  cout<<(char *)ask(&named_part.instance, "NAME")<<endl;
  if(ask(&named_part.instance, "IS-A", "named_object"))
    cout<<"OK"<<endl;
  return 1;
}
