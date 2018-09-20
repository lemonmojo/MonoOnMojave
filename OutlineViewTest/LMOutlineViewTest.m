#import "LMOutlineViewTest.h"
#import "LMNode.h"

static NSString* const CELL_IDENTIFIER = @"LMCellIdentifier";

@interface LMOutlineViewTest()

@property (strong) NSWindow* window;
@property (strong) LMNode* rootNode;

@end

@implementation LMOutlineViewTest

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.rootNode = [LMNode makeExampleTree];
        
        NSWindowStyleMask windowStyle = NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable | NSWindowStyleMaskTitled;
        self.window = [[NSWindow alloc] initWithContentRect:NSMakeRect(100, 100, 500, 300) styleMask:windowStyle backing:NSBackingStoreBuffered defer:NO];
        
        NSView* outlineView = [self makeOutlineViewWithFrame:self.window.contentView.bounds];
        
        [self.window.contentView addSubview:outlineView];
        
        [self.window makeKeyAndOrderFront:self];
    }
    
    return self;
}

- (NSView*)makeOutlineViewWithFrame:(NSRect)frame
{
    NSOutlineView* outlineView = [[NSOutlineView alloc] initWithFrame:frame];
    
    NSTableColumn* column = [[NSTableColumn alloc] initWithIdentifier:@"Values"];
    [outlineView addTableColumn:column];
    outlineView.outlineTableColumn = column;
    
    outlineView.delegate = self;
    outlineView.dataSource = self;
    
    NSScrollView* scrollView = [[NSScrollView alloc] initWithFrame:frame];
    scrollView.autoresizingMask = NSViewMinXMargin | NSViewMaxXMargin | NSViewMinYMargin | NSViewMaxYMargin | NSViewWidthSizable | NSViewHeightSizable;
    
    scrollView.documentView = outlineView;
    
    return scrollView;
}

- (LMNode*)nodeOrRootNode:(NSObject*)item
{
    LMNode* node = (LMNode*)(!item ? self.rootNode : item);
    
    return node;
}

- (NSView*)outlineView:(NSOutlineView*)outlineView viewForTableColumn:(NSTableColumn*)tableColumn item:(id)item
{
    NSTextField* view = [outlineView makeViewWithIdentifier:CELL_IDENTIFIER owner:self];
    
    if (!view) {
        view = [[NSTextField alloc] init];
        view.identifier = CELL_IDENTIFIER;
        view.bordered = NO;
        view.selectable = NO;
        view.editable = NO;
        view.drawsBackground = NO;
    }
    
    LMNode* node = [self nodeOrRootNode:item];
    
    view.stringValue = node.title;
    
    return view;
}

- (NSInteger)outlineView:(NSOutlineView*)outlineView numberOfChildrenOfItem:(id)item
{
    LMNode* node = [self nodeOrRootNode:item];
    
    return node.children.count;
}

- (id)outlineView:(NSOutlineView*)outlineView child:(NSInteger)index ofItem:(id)item
{
    LMNode* node = [self nodeOrRootNode:item];
    
    return node.children[index];
}

- (BOOL)outlineView:(NSOutlineView*)outlineView isItemExpandable:(id)item
{
    LMNode* node = [self nodeOrRootNode:item];
    
    return !node.isLeaf;
}

@end
