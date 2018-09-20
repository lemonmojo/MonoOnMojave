#import <Cocoa/Cocoa.h>

@interface LMNode : NSTreeNode

+ (instancetype)makeExampleTree;

@property (copy) NSString* title;
@property (readonly) NSArray<LMNode*>* children;

- (instancetype)init;
- (instancetype)initWithTitle:(NSString*)title;

- (instancetype)addChildWithTitle:(NSString*)title;

@end
