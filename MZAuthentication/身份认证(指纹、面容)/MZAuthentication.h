//
//  MZAuthentication.h
//  MZAuthentication
//
//  Created by Mr.Z on 2020/4/2.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZAuthentication : NSObject

/// 调用系统指纹/面容验证
/// @param fallBackTitle 指纹/面容错误后出现的可选标题
/// @param reasonTitle 指纹/面容验证框上面的文字提示
/// @param callBlock 指纹/面容验证成功与否的回调(success验证是否成功 error验证的错误信息 msg参考信息)
+ (void)authenticationWithFallBackTitle:(NSString *)fallBackTitle localizedReason:(NSString *)reasonTitle reply:(void(^)(BOOL success, NSError *error, NSString *msg))callBlock;

@end

NS_ASSUME_NONNULL_END
