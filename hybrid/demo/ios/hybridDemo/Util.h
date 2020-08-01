//
//  Uitl.h
//  hybridDemo
//
//  Created by lvao on 2020/4/19.
//  Copyright © 2020 chifuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Util : NSObject
+(NSDictionary *)dictionaryWithJsonString: (NSString*)jsonStr;
+(UIViewController*)getCurrentVC;
@end

NS_ASSUME_NONNULL_END
