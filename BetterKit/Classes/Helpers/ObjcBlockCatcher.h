//
//  ObjcBlockCatcher.h
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

#import <Foundation/Foundation.h>

@interface ObjcBlockCatcher : NSObject

+ (NSException *_Nullable)attemptBlock:(void (^ _Nullable)(void)) block;

@end
