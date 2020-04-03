//
//  MZFingerPrintVerify.m
//  MZFingerPrintVerify
//
//  Created by Mr.Z on 2020/4/2.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import "MZFingerPrintVerify.h"
#import <UIKit/UIKit.h>
#import <LocalAuthentication/LocalAuthentication.h>

@implementation MZFingerPrintVerify

+ (void)fingerPrintVerifyWithFallBackTitle:(NSString *)fallBackTitle localizedReason:(NSString *)reasonTitle reply:(void(^)(BOOL success, NSError *error, NSString *msg))fingerBlock {
    LAContext *context = [[LAContext alloc] init];
    context.localizedFallbackTitle = fallBackTitle;
    NSError *err = nil;
    BOOL canEvaluatePolicy = [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&err];
    if (canEvaluatePolicy) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:reasonTitle reply:^(BOOL success, NSError *error) {
            NSString *errMsg = [self referenceErrorCode:error.code fallBack:fallBackTitle];
            dispatch_async(dispatch_get_main_queue(), ^{
                fingerBlock(success, error, errMsg);
            });
        }];
    } else {
        NSString *errMsg = [self referenceErrorCode:err.code fallBack:fallBackTitle];
        dispatch_async(dispatch_get_main_queue(), ^{
            fingerBlock(NO, err, errMsg);
        });
    }
}

#pragma mark - 返回错误参考信息
+ (NSString *)referenceErrorCode:(NSInteger)errorCode fallBack:(NSString *)fallBack {
    switch (errorCode) {
        case LAErrorAuthenticationFailed:
            return @"授权失败";
            break;
        case LAErrorUserCancel:
            return @"用户取消验证Touch ID";
            break;
        case LAErrorUserFallback:
            return fallBack;
            break;
        case LAErrorSystemCancel:
            return @"系统取消授权，如其他应用切入";
            break;
        case LAErrorPasscodeNotSet:
            return @"系统未设置密码";
            break;
        case LAErrorTouchIDNotAvailable:
            return @"设备Touch ID不可用，例如未打开";
            break;
        case LAErrorTouchIDNotEnrolled:
            return @"设备Touch ID不可用，用户未录入";
            break;
        case LAErrorTouchIDLockout:
            return @"身份验证未成功，多次使用Touch ID失败";
            break;
        case LAErrorAppCancel:
            return @"认证被取消的应用";
            break;
        case LAErrorInvalidContext:
            return @"授权对象失效";
            break;
        case LAErrorNotInteractive:
            return @"APP未完全启动，调用失败";
            break;
        default:
            return @"验证成功";
            break;
    }
}

@end
