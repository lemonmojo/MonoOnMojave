#import <Cocoa/Cocoa.h>
#include <mono/jit/jit.h>

int main(int argc, const char * argv[]) {
    // Comment out to get rid of the strangeness
    mono_jit_init("Test");
    
    return NSApplicationMain(argc, argv);
}
