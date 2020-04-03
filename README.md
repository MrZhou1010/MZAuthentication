# MZFingerPrintVerify
指纹验证

/**
 * 调用系统指纹/面容验证
 * @param fallBackTitle 指纹/面容错误后出现的可选标题
 * @param reasonTitle 指纹/面容验证框上面的文字提示
 * @param fingerBlock 指纹/面容验证成功与否的回调(success 验证是否成功 error 验证的错误信息 msg 参考信息)
 *
 */
+ (void)fingerPrintVerifyWithFallBackTitle:(NSString *)fallBackTitle localizedReason:(NSString *)reasonTitle reply:(void(^)(BOOL success, NSError *error, NSString *msg))fingerBlock
