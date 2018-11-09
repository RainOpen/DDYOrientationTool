#import "ViewController.h"
#import "DDYOrientationTool.h"
#import "Masonry.h"

#ifndef DDYTopH
#define DDYTopH (self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height)
#endif

#ifndef DDYScreenW
#define DDYScreenW [UIScreen mainScreen].bounds.size.width
#endif

#ifndef DDYScreenH
#define DDYScreenH [UIScreen mainScreen].bounds.size.height
#endif

@interface ViewController ()

@property (nonatomic, strong) UIButton *button01;

@property (nonatomic, strong) UIButton *button02;

@property (nonatomic, strong) UIButton *button03;

@property (nonatomic, strong) UIButton *button04;

@property (nonatomic, strong) UIButton *button05;

@property (nonatomic, strong) UIButton *button11;

@property (nonatomic, strong) UIButton *button12;

@property (nonatomic, strong) UIButton *button13;

@property (nonatomic, strong) UIButton *button14;

@property (nonatomic, strong) UIButton *button15;

@property (nonatomic, strong) UIButton *button21;

@property (nonatomic, strong) UIButton *button22;

@property (nonatomic, strong) UIButton *button23;

@property (nonatomic, strong) UIButton *button24;

@property (nonatomic, strong) UIButton *button25;


@end

@implementation ViewController

- (UIButton *)btnY:(CGFloat)y tag:(NSUInteger)tag title:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor lightGrayColor]];
//    [button setFrame:CGRectMake(10, DDYTopH + y, DDYScreenW-20, 30)];
    [button setTag:tag];
    [button addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    return button;
}

- (UIButton *)button01 {
    if (!_button01) {
        _button01 = [self btnY: 50 tag:101 title:@"固定--正竖屏"];
    }
    return _button01;
}

- (UIButton *)button02 {
    if (!_button02) {
        _button02 = [self btnY:100 tag:102 title:@"固定--左横屏"];
    }
    return _button02;
}

- (UIButton *)button03 {
    if (!_button03) {
        _button03 = [self btnY:150 tag:103 title:@"固定--右横屏"];
    }
    return _button03;
}

- (UIButton *)button04 {
    if (!_button04) {
        _button04 = [self btnY:150 tag:104 title:@"固定--横屏"];
    }
    return _button04;
}

- (UIButton *)button05 {
    if (!_button05) {
        _button05 = [self btnY:150 tag:105 title:@"固定--所有"];
    }
    return _button05;
}

- (UIButton *)button11 {
    if (!_button11) {
        _button11 = [self btnY: 50 tag:111 title:@"系统--正竖屏"];
    }
    return _button11;
}

- (UIButton *)button12 {
    if (!_button12) {
        _button12 = [self btnY:100 tag:112 title:@"系统--左横屏"];
    }
    return _button12;
}

- (UIButton *)button13 {
    if (!_button13) {
        _button13 = [self btnY:150 tag:113 title:@"系统--右横屏"];
    }
    return _button13;
}

- (UIButton *)button14 {
    if (!_button14) {
        _button14 = [self btnY:150 tag:114 title:@"系统--横屏"];
    }
    return _button14;
}

- (UIButton *)button15 {
    if (!_button15) {
        _button15 = [self btnY:150 tag:115 title:@"系统--所有"];
    }
    return _button15;
}

- (UIButton *)button21 {
    if (!_button21) {
        _button21 = [self btnY: 50 tag:121 title:@"加速计--正竖屏"];
    }
    return _button21;
}

- (UIButton *)button22 {
    if (!_button22) {
        _button22 = [self btnY:100 tag:122 title:@"加速计--左横屏"];
    }
    return _button22;
}

- (UIButton *)button23 {
    if (!_button23) {
        _button23 = [self btnY:150 tag:123 title:@"加速计--右横屏"];
    }
    return _button23;
}

- (UIButton *)button24 {
    if (!_button24) {
        _button24 = [self btnY:150 tag:124 title:@"加速计--横屏"];
    }
    return _button24;
}

- (UIButton *)button25 {
    if (!_button25) {
        _button25 = [self btnY:150 tag:125 title:@"加速计--所有"];
    }
    return _button25;
}

- (UIBarButtonItem *)rightBar {
    return [[UIBarButtonItem alloc] initWithTitle:@"Alert" style:UIBarButtonItemStylePlain target:self action:@selector(handleRight)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.button01];
    [self.view addSubview:self.button02];
    [self.view addSubview:self.button03];
    
    [self.view addSubview:self.button04];
    [self.view addSubview:self.button05];
    [self.view addSubview:self.button11];
    
    [self.view addSubview:self.button12];
    [self.view addSubview:self.button13];
    [self.view addSubview:self.button14];
    
    [self.view addSubview:self.button15];
    [self.view addSubview:self.button21];
    [self.view addSubview:self.button22];
    
    [self.view addSubview:self.button23];
    [self.view addSubview:self.button24];
    [self.view addSubview:self.button25];
    
    [self.navigationItem setRightBarButtonItem:[self rightBar]];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // 第一行
    [self.button01 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(10);
        make.top.mas_equalTo(self.mas_topLayoutGuide).offset(10);
        make.height.mas_equalTo(30);
    }];
    [self.button02 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.button01.mas_right).offset(10);
        make.top.mas_equalTo(self.button01.mas_top);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(self.button01.mas_width);
    }];
    [self.button03 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.button02.mas_right).offset(10);
        make.top.mas_equalTo(self.button02.mas_top);
        make.height.mas_equalTo(30);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.width.mas_equalTo(self.button02.mas_width);
    }];
    // 第二行
    [self.button04 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(10);
        make.top.mas_equalTo(self.button03.mas_bottom).offset(10);
        make.height.mas_equalTo(30);
    }];
    [self.button05 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.button04.mas_right).offset(10);
        make.top.mas_equalTo(self.button04.mas_top);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(self.button04.mas_width);
    }];
    [self.button11 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.button05.mas_right).offset(10);
        make.top.mas_equalTo(self.button05.mas_top);
        make.height.mas_equalTo(30);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.width.mas_equalTo(self.button05.mas_width);
    }];
    // 第三行
    [self.button12 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(10);
        make.top.mas_equalTo(self.button11.mas_bottom).offset(10);
        make.height.mas_equalTo(30);
    }];
    [self.button13 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.button12.mas_right).offset(10);
        make.top.mas_equalTo(self.button12.mas_top);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(self.button12.mas_width);
    }];
    [self.button14 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.button13.mas_right).offset(10);
        make.top.mas_equalTo(self.button13.mas_top);
        make.height.mas_equalTo(30);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.width.mas_equalTo(self.button13.mas_width);
    }];
    // 第四行
    [self.button15 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(10);
        make.top.mas_equalTo(self.button14.mas_bottom).offset(10);
        make.height.mas_equalTo(30);
    }];
    [self.button21 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.button15.mas_right).offset(10);
        make.top.mas_equalTo(self.button15.mas_top);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(self.button15.mas_width);
    }];
    [self.button22 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.button21.mas_right).offset(10);
        make.top.mas_equalTo(self.button21.mas_top);
        make.height.mas_equalTo(30);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.width.mas_equalTo(self.button21.mas_width);
    }];
    // 第五行
    [self.button23 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(10);
        make.top.mas_equalTo(self.button22.mas_bottom).offset(10);
        make.height.mas_equalTo(30);
    }];
    [self.button24 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.button23.mas_right).offset(10);
        make.top.mas_equalTo(self.button23.mas_top);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(self.button23.mas_width);
    }];
    [self.button25 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.button24.mas_right).offset(10);
        make.top.mas_equalTo(self.button24.mas_top);
        make.height.mas_equalTo(30);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.width.mas_equalTo(self.button24.mas_width);
    }];
}

- (void)handleRight {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"title1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"title1 %@", action);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"title" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"title2 %@", action);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"cancel1" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancel1 %@", action);
    }]];
    [self presentViewController:alert animated:YES completion:^{    }];
}

- (void)handleBtn:(UIButton *)sender {
    if (sender.tag == 101) {
        [DDYOrientationTool setAllowOrientation:DDYOrientationTypePortrait autorotateType:DDYAutorotateTypeNot];
    } else if (sender.tag == 102) {
        [DDYOrientationTool setAllowOrientation:DDYOrientationTypeLandscapeLeft autorotateType:DDYAutorotateTypeNot];
    } else if (sender.tag == 103) {
        [DDYOrientationTool setAllowOrientation:DDYOrientationTypeLandscapeRight autorotateType:DDYAutorotateTypeNot];
    } else if (sender.tag == 104) {
        [DDYOrientationTool setAllowOrientation:DDYOrientationTypeLandscape autorotateType:DDYAutorotateTypeNot];
    } else if (sender.tag == 105) {
        [DDYOrientationTool setAllowOrientation:DDYOrientationTypeAll autorotateType:DDYAutorotateTypeNot];
    } else if (sender.tag == 111) {
        [DDYOrientationTool setAllowOrientation:DDYOrientationTypePortrait autorotateType:DDYAutorotateTypeSystem];
    } else if (sender.tag == 112) {
        [DDYOrientationTool setAllowOrientation:DDYOrientationTypeLandscapeLeft autorotateType:DDYAutorotateTypeSystem];
    } else if (sender.tag == 113) {
        [DDYOrientationTool setAllowOrientation:DDYOrientationTypeLandscapeRight autorotateType:DDYAutorotateTypeSystem];
    } else if (sender.tag == 114) {
        [DDYOrientationTool setAllowOrientation:DDYOrientationTypeLandscape autorotateType:DDYAutorotateTypeSystem];
    } else if (sender.tag == 115) {
        [DDYOrientationTool setAllowOrientation:DDYOrientationTypeAll autorotateType:DDYAutorotateTypeSystem];
    } else if (sender.tag == 121) {
         [DDYOrientationTool setAllowOrientation:DDYOrientationTypePortrait autorotateType:DDYAutorotateTypeAccelerometer];
    } else if (sender.tag == 122) {
        [DDYOrientationTool setAllowOrientation:DDYOrientationTypeLandscapeLeft autorotateType:DDYAutorotateTypeAccelerometer];
    } else if (sender.tag == 123) {
        [DDYOrientationTool setAllowOrientation:DDYOrientationTypeLandscapeRight autorotateType:DDYAutorotateTypeAccelerometer];
    } else if (sender.tag == 124) {
        [DDYOrientationTool setAllowOrientation:DDYOrientationTypeLandscape autorotateType:DDYAutorotateTypeAccelerometer];
    } else if (sender.tag == 125) {
        [DDYOrientationTool setAllowOrientation:DDYOrientationTypeAll autorotateType:DDYAutorotateTypeAccelerometer];
    }
}

@end
