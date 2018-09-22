#import "AppDelegate.h"

#import <OutlineViewTest/OutlineViewTest.h>

@interface AppDelegate ()

@property (strong) LMOutlineViewTest* outlineViewTest;

@end

@implementation AppDelegate

- (void)applicationWillFinishLaunching:(NSNotification*)notification
{
    // TODO: Why is this not called when NSApplicationLoad is called
}

- (void)applicationDidFinishLaunching:(NSNotification*)aNotification
{
    self.outlineViewTest = [[LMOutlineViewTest alloc] init];
}

@end
