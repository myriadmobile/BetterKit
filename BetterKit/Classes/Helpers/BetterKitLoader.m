//
//  BetterKitLoader.m
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

#import "BetterKitLoader.h"

@implementation BetterKitLoader

+ (void)load {
    [super load];
    
    SEL selector = NSSelectorFromString(@"loadExtension");
    if ([UIViewController respondsToSelector:selector])
    {
        [UIViewController performSelector:selector];
    }
}

@end
