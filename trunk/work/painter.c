#include <unistd.h>
#include <stdio.h>
#include <X11/Xlib.h>
#define WINDOW_SIZE 500
#include <guile/gh.h>

#define _COMMAND_ 0

Display *theDisplay;

Window theWindow;

Screen *theScreen;

GC theGC;


SCM draw_line(SCM vector1, SCM vector2)
{
    int oldx, oldy, newx, newy;
    
    SCM_ASSERT(SCM_ECONSP(vector1), vector1, SCM_ARG1, "draw-line");
    SCM_ASSERT(SCM_ECONSP(vector2), vector2, SCM_ARG2, "draw-line");


    oldx = (SCM_INUM(SCM_CAR(vector1)));
    oldy = (SCM_INUM(SCM_CDR(vector1)));

    newx = (SCM_INUM(SCM_CAR(vector2)));
    newy = (SCM_INUM(SCM_CDR(vector2)));
    printf("%d,%d,%d,%d\n", oldx, oldy, newx, newy);
    
    XDrawLine(theDisplay, theWindow, theGC, 
                           oldx, oldy, newx, newy);

    return SCM_UNSPECIFIED;        
}

void register_procs(void)
{
    gh_new_procedure("draw-line", draw_line, 2, 0, 0);
}

void read_config_file(char *config_name)
{
    FILE *file;
    
    char inputLine[1024];
    /* hack: assume each line less than 1024 chars */
    char *p;

    file = fopen(config_name, "r");
    //  file = fopen("test.script", "r");
    
    if (file == NULL) return;
    
    /* spin through the file */
    
    while (1) {
	
        p = fgets(inputLine, sizeof(inputLine), file);
	
        if (p == NULL) return;
	
        gh_eval_str(p);
	
    }
    
    fclose(file);
    
}

void inner_main(int argc, char **argv)
{
    register_procs();


#if _COMMAND_
    gh_repl(argc, argv);
#else    
#if 0
    read_config_file(argv[1]);
#else
    gh_eval_file("init.scm");
    gh_eval_file(argv[1]);
#endif
#endif
    /* now get on with the main business of the program . . . */
    sleep(10);
    
}


int main(int argc, char *argv[])
{
    theDisplay = XOpenDisplay(NULL);
    
    XSynchronize(theDisplay, True);
    
    theScreen = DefaultScreenOfDisplay(theDisplay);
    
    theWindow = XCreateSimpleWindow(theDisplay, RootWindowOfScreen(theScreen), 
                                    0, 0, 
                                    WINDOW_SIZE, WINDOW_SIZE, 0, 
                                    BlackPixelOfScreen(theScreen), 
                                    WhitePixelOfScreen(theScreen));
    
    theGC = XCreateGC(theDisplay, theWindow, 0L, NULL);
    
    XSetForeground(theDisplay, theGC, BlackPixelOfScreen(theScreen));
    XMapWindow(theDisplay,theWindow);

    
    gh_enter(argc, argv, inner_main);
    
    return(0);
    /* never reached */
    /* sleep so effects can be visible */
    sleep(20);
    
    return 0;
    
}
