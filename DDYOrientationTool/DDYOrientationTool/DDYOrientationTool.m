#import "DDYOrientationTool.h"
#import <CoreMotion/CoreMotion.h>
#import <libkern/OSAtomic.h>

static NSInteger const kMaxAccelerometer = 3; // 最大检测次数
static int32_t currentAccelerometer = 0; // 当前检测次数

@interface DDYOrientationTool ()

@property (nonatomic, assign) UIInterfaceOrientationMask orientationMask;

@property (nonatomic, strong) CMMotionManager *motionManager;

@property (nonatomic, assign) DDYOrientationType allowOrientation;

@property (nonatomic, assign) DDYAutorotateType autorotateType;

@property (nonatomic, assign) DDYOrientationType currentOrientation;

@end

@implementation DDYOrientationTool

- (CMMotionManager *)motionManager {
    if (!_motionManager) {
        _motionManager = [[CMMotionManager alloc] init];
    }
    return _motionManager;
}

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (void)setAllowOrientation:(DDYOrientationType)allowOrientation autorotateType:(DDYAutorotateType)autorotateType {
    currentAccelerometer = 0;
    [[DDYOrientationTool sharedInstance].motionManager stopAccelerometerUpdates];
    [DDYOrientationTool sharedInstance].autorotateType = autorotateType;
    [DDYOrientationTool sharedInstance].allowOrientation = allowOrientation;
    [[DDYOrientationTool sharedInstance] handleAutorotateTypeNot];
    if (autorotateType == DDYAutorotateTypeAccelerometer) {
        [[DDYOrientationTool sharedInstance] handleAutorotateTypeAccelerometer];
    }
}

- (void)handleAutorotateTypeNot {
    if ([DDYOrientationTool sharedInstance].allowOrientation & DDYOrientationTypePortrait) {
        [DDYOrientationTool sharedInstance].currentOrientation = DDYOrientationTypePortrait;
    } else if ([DDYOrientationTool sharedInstance].allowOrientation & DDYOrientationTypeLandscapeLeft) {
        [DDYOrientationTool sharedInstance].currentOrientation = DDYOrientationTypeLandscapeLeft;
    } else if ([DDYOrientationTool sharedInstance].allowOrientation & DDYOrientationTypeLandscapeRight) {
        [DDYOrientationTool sharedInstance].currentOrientation = DDYOrientationTypeLandscapeRight;
    } else {
        [DDYOrientationTool sharedInstance].currentOrientation = DDYOrientationTypePortrait;
    }
    [[DDYOrientationTool sharedInstance] changeToNewOrientation];
}

- (void)handleAutorotateTypeAccelerometer {
    if ([DDYOrientationTool sharedInstance].motionManager.isDeviceMotionAvailable) {
        [[DDYOrientationTool sharedInstance].motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
            CMAcceleration acceleration = accelerometerData.acceleration;
            if (acceleration.x >= M_PI_4) { // home键在左边
                [DDYOrientationTool sharedInstance].currentOrientation = DDYOrientationTypeLandscapeLeft;
            } else if (acceleration.x <= -M_PI_4) { // home键在右边
                [DDYOrientationTool sharedInstance].currentOrientation = DDYOrientationTypeLandscapeRight;
            } else if (acceleration.y <= -M_PI_4) {
                [DDYOrientationTool sharedInstance].currentOrientation = DDYOrientationTypePortrait;
            } else if (acceleration.y >= M_PI_4) {
                [DDYOrientationTool sharedInstance].currentOrientation = DDYOrientationTypePortrait;
            } 
            OSAtomicIncrement32(&currentAccelerometer);
            if (currentAccelerometer > kMaxAccelerometer) { // 检测几次以后稳定后不再检测
                [[DDYOrientationTool sharedInstance] changeToNewOrientation];
                currentAccelerometer = 0;
            }
        }];
    }
}

- (void)changeToNewOrientation:(UIDeviceOrientation)newOrientation {
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = newOrientation;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

- (void)changeToNewOrientation {
    UIDeviceOrientation newOrientation = UIDeviceOrientationPortrait;
    if ([DDYOrientationTool sharedInstance].currentOrientation & DDYOrientationTypeLandscapeRight) {
        newOrientation = UIDeviceOrientationLandscapeLeft;
    } else if ([DDYOrientationTool sharedInstance].currentOrientation & DDYOrientationTypeLandscapeLeft) {
        newOrientation = UIDeviceOrientationLandscapeRight;
    } else {
        newOrientation = UIDeviceOrientationPortrait;
    }
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = newOrientation;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

+ (DDYAutorotateType)getAutorotateType {
    return [DDYOrientationTool sharedInstance].autorotateType;
}

+ (DDYOrientationType)getAllowOrientation {
    return [DDYOrientationTool sharedInstance].allowOrientation;
}

+ (DDYOrientationType)getCurrentOrientation {    
    return [DDYOrientationTool sharedInstance].currentOrientation;
}

@end
