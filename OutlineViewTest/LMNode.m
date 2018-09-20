#import "LMNode.h"

@implementation LMNode

+ (instancetype)makeExampleTree
{
    LMNode* rootNode = [[LMNode alloc] init];
    
    for (int i = 0; i < 5; i++) {
        LMNode* parentNode = [rootNode addChildWithTitle:[NSString stringWithFormat:@"Parent %i", i]];
        
        for (int j = 0; j < 3; j++) {
            [parentNode addChildWithTitle:[NSString stringWithFormat:@"Child %i", i]];
        }
    }
    
    return rootNode;
}

- (instancetype)init
{
    self = [self initWithTitle:@""];
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    
    if (self) {
        self.title = title;
    }
    
    return self;
}

- (instancetype)addChildWithTitle:(NSString*)title
{
    LMNode* node = [[LMNode alloc] initWithTitle:title];
    [self.mutableChildNodes addObject:node];
    
    return node;
}

- (NSArray<LMNode*>*)children
{
    return (NSArray<LMNode*>*)self.childNodes;
}

@end
