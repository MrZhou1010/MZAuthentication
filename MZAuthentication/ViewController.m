//
//  ViewController.m
//  MZAuthentication
//
//  Created by Mr.Z on 2020/4/2.
//  Copyright © 2020 Mr.Z. All rights reserved.
//

#import "ViewController.h"
#import "MZAuthentication.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *referenceBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.referenceBtn];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(170.0, 300.0, 70.0, 70.0);
        _imageView.image = [UIImage imageNamed:@"icon_finger"];
    }
    return _imageView;
}

- (UIButton *)referenceBtn {
    if (!_referenceBtn) {
        _referenceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _referenceBtn.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.5];
        _referenceBtn.frame = CGRectMake(100.0, 450.0, 220.0, 40.0);
        _referenceBtn.layer.cornerRadius = 5.0;
        [_referenceBtn setTitle:@"点击验证指纹" forState:UIControlStateNormal];
        [_referenceBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _referenceBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_referenceBtn addTarget:self action:@selector(referenceBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _referenceBtn;
}

- (void)referenceBtnAction:(UIButton *)btn {
    [MZAuthentication authenticationWithFallBackTitle:@"验证登录密码" localizedReason:@"通过Home健验证已有手机指纹" reply:^(BOOL success, NSError *error, NSString *msg) {
        [self.referenceBtn setTitle:msg forState:UIControlStateNormal];
    }];
}

@end
