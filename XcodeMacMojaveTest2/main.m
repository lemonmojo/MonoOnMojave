#import <Cocoa/Cocoa.h>
#include <mono/jit/jit.h>

int main(int argc, const char * argv[]) {
    mono_jit_init("Test");
    
    return NSApplicationMain(argc, argv);
}
