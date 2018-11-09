Pod::Spec.new do |ddyspec|
    ddyspec.name         = 'DDYOrientationTool'
    ddyspec.version      = '1.0.3'
    ddyspec.summary      = '一个屏幕方向切换管理工具'
    ddyspec.homepage     = 'https://github.com/RainOpen/DDYOrientationTool'
    ddyspec.license      = 'MIT'
    ddyspec.authors      = {'Rain' => '634778311@qq.com'}
    ddyspec.platform     = :ios, '8.0'
    ddyspec.source       = {:git => 'https://github.com/RainOpen/DDYOrientationTool.git', :tag => ddyspec.version}
    ddyspec.source_files = 'DDYOrientationTool/DDYOrientationTool/*.{h,m}'
    ddyspec.requires_arc = false
end