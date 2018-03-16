//
//  ObjcBlockCatcher.h
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

#import <Foundation/Foundation.h>

@interface ObjcBlockCatcher : NSObject

+ (BOOL)objc_trySafe:(void(^ _Nullable)(void))block error:(__autoreleasing NSError *_Nullable*_Nullable)error;

@end
