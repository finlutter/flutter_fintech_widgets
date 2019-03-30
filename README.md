## 环境配置

#### 下载
[Flutter SDK Archive  - Flutter](https://flutter.io/docs/development/tools/sdk/archive#macos)

#### 环境变量

```
vi ~/.bash_profile

export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

export FLUTTER_HOME=/Users/tianshaojie/development/flutter
export PATH=$PATH:$FLUTTER_HOME/bin

## 检查
flutter doctor

## 升级
flutter upgrade

## AS3.0+，安装Flutter和Dart插件:
* Flutter插件： 支持Flutter开发工作流 (运行、调试、热重载等).
* Dart插件： 提供代码分析 (输入代码时进行验证、代码补全等).
```



## 移动端跨平台开发演进：
####  OEM Widgets：Android、iOS，提供Framework，与系统通信，绘制界面
`java/objectc -> framework -> canvas`
####  WebView：PhoneGap，基于浏览器，提供一套js框架，转接调用Framework
`js -> webview -> framework -> canvas`
####  RN：通过Bridege桥接器访问原生组件
`JS -> Bridge -> framework -> canvas`
####  Flutter：直接操作Canvas
```
Dart -> Skia -> canvas

每个APP内都有自己的一套UI组件，跨平台；包略大，初始化6.7MB
```

