INCLUDEFILE :=  -I/usr/X11R6/include
LIBFILE :=  -g -lX11 -L/usr/X11R6/lib -lguile -lguile-ltdl -lqthreads -lpthread -lcrypt -lm

all: painter
clean:
	rm painter

painter:painter.c
	gcc -o painter painter.c $(INCLUDEFILE) $(LIBFILE) 