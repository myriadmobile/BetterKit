//
//  ObjcBlockCatcher.m
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

#import "ObjcBlockCatcher.h"

@implementation ObjcBlockCatcher

+ (NSException *_Nullable)attemptBlock:(void (^ _Nullable)(void)) block {
    @try {
        if (block != nil) {
            block();
        }
    }
    @catch (NSException *exception) {
        return exception;
    }
    
    return nil;
}

@end
