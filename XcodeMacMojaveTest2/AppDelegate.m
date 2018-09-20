#import "AppDelegate.h"

#import <OutlineViewTest/OutlineViewTest.h>

@interface AppDelegate ()

@property (strong) LMOutlineViewTest* outlineViewTest;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification*)aNotification
{
    self.outlineViewTest = [[LMOutlineViewTest alloc] init];
}

@end
