//
//  ObjcBlockCatcher.m
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

#import "ObjcBlockCatcher.h"

@implementation ObjcBlockCatcher

+ (BOOL)objc_trySafe:(void(^ _Nullable)(void))block error:(__autoreleasing NSError *_Nullable*_Nullable)error {
    @try {
        if (block != nil) {
            block();
        }
        return YES;
    }
    @catch (NSException *exception) {
        *error = [[NSError alloc] initWithDomain:exception.name code:0 userInfo:exception.userInfo];
        return NO;
    }
}

@end
