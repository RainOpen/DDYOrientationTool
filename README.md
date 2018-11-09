# DDYOrientationTool


一个屏幕方向切换管理工具

> # 集成

* CocoaPods方式 

  1.pod 'DDYOrientationTool', '~> 1.0.3' 
 
  2.#import <DDYOrientationTool.h>

  [使用方案](https://github.com/starainDou/DDYOrientationTool)

* 文件夹拖入工程方式
  
  1.下载工程解压后将'DDYOrientationTool'文件夹拖到工程中

  2.#import "DDYOrientationTool.h"

然后可以分辨将例子中的分类写成自己实际项目中的对应类的分类(AppDelegate/NavigationController/TabbarController)或者直接写到对应类中。

> # 使用

```
[DDYOrientationTool setAllowOrientation:DDYOrientationType autorotateType:DDYAutorotateType];
```

> # 注意

* 严禁在 DDYAutorotateTypeAccelerometer 模式下监听 UIDeviceOrientationDidChangeNotification 以免引起死循环造成crash 
* 暂不支持倒屏 
* 可能存在未知bug，请酌情使用