#import "AppDelegate+DDYOrientation.h"
#import "DDYOrientationTool.h"

@implementation AppDelegate (DDYOrientation)

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    if ([DDYOrientationTool getAutorotateType] == DDYAutorotateTypeNot) {
        if ([DDYOrientationTool getCurrentOrientation] == DDYOrientationTypePortrait) {
            return UIInterfaceOrientationMaskPortrait;
        } else if ([DDYOrientationTool getCurrentOrientation] == DDYOrientationTypeLandscapeLeft) {
            return UIInterfaceOrientationMaskLandscapeLeft;
        } else if ([DDYOrientationTool getCurrentOrientation] == DDYOrientationTypeLandscapeRight) {
            return UIInterfaceOrientationMaskLandscapeRight;
        }
    } else {
        if ([DDYOrientationTool getAllowOrientation] == DDYOrientationTypePortrait) {
            return UIInterfaceOrientationMaskPortrait;
        } else if ([DDYOrientationTool getAllowOrientation] == DDYOrientationTypeLandscapeLeft) {
            return UIInterfaceOrientationMaskLandscapeLeft;
        } else if ([DDYOrientationTool getAllowOrientation] == DDYOrientationTypeLandscapeRight) {
            return UIInterfaceOrientationMaskLandscapeRight;
        } else if ([DDYOrientationTool getAllowOrientation] == DDYOrientationTypeLandscape) {
            return UIInterfaceOrientationMaskLandscape;
        } else if ([DDYOrientationTool getAllowOrientation] == DDYOrientationTypeAll) {
            return UIInterfaceOrientationMaskAll;
        }
    }
    return UIInterfaceOrientationMaskPortrait;
}

@end
