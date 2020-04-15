# MZAuthentication
身份认证(指纹、面容)

/**
 * 调用系统指纹/面容验证
 * @param fallBackTitle 指纹/面容错误后出现的可选标题
 * @param reasonTitle 指纹/面容验证框上面的文字提示
 * @param callBlock 指纹/面容验证成功与否的回调(success 验证是否成功 error 验证的错误信息 msg 参考信息)
 *
 */
+ (void)authenticationWithFallBackTitle:(NSString *)fallBackTitle localizedReason:(NSString *)reasonTitle reply:(void(^)(BOOL success, NSError *error, NSString *msg))callBlock


[MZAuthentication authenticationWithFallBackTitle:@"验证登录密码" localizedReason:@"通过Home健验证已有手机指纹" reply:^(BOOL success, NSError *error, NSString *msg) {
        NSlog(@"%@", msg);
    }];
