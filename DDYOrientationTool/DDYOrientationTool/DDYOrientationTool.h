#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DDYOrientationType) {
    DDYOrientationTypePortrait          = 1 << 0,   // 正竖屏
    DDYOrientationTypeLandscapeLeft     = 1 << 1,   // 左横屏
    DDYOrientationTypeLandscapeRight    = 1 << 2,   // 右横屏
    DDYOrientationTypeLandscape         = (DDYOrientationTypeLandscapeLeft | DDYOrientationTypeLandscapeRight), // 横屏
    DDYOrientationTypeAll               = (DDYOrientationTypeLandscape | DDYOrientationTypePortrait),  // 所有(除倒竖屏外)
};

typedef NS_ENUM(NSUInteger, DDYAutorotateType) {
    DDYAutorotateTypeNot = 0,       // 不旋转
    DDYAutorotateTypeSystem,        // 根据系统，如果系统关闭自动旋转则不旋转
    DDYAutorotateTypeAccelerometer, // 根据加速计
};

@interface DDYOrientationTool : NSObject
/** 设置允许的方向和旋转的模式 */
+ (void)setAllowOrientation:(DDYOrientationType)allowOrientation autorotateType:(DDYAutorotateType)autorotateType;
/** 旋转的模式 */
+ (DDYAutorotateType)getAutorotateType;
/** 允许的方向 */
+ (DDYOrientationType)getAllowOrientation;
/** 当前的方向 */
+ (DDYOrientationType)getCurrentOrientation;

@end

/** 严禁在 DDYAutorotateTypeAccelerometer 模式下监听 UIDeviceOrientationDidChangeNotification 以免引起死循环造成crash */
/** 暂不支持倒屏 */
