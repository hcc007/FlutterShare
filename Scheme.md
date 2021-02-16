####  一、GitHub 上配置一个 html（或者任何本地可以打开的 html 都可以）

github 上  setting 上  GitHub Pages 可以看到 html 的 访问链接
```

<html lang="zh-cn"><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Scheme 跳转</title>
<style>
    h3,
    p {
        text-align: center;
    }
</style></head>


<body>
    <p>tyfapp://</p>
    <h3>
        <a href="tyfapp://">
            打开App(tyfapp://)
        </a>
    </h3>
    <p>tyfapp://homepage</p>
    <h3>
        <a href="tyfapp://homepage">
            打开App首页
        </a>
    </h3>
    <p>tyfapp://userpage</p>
    <h3>
        <a href="tyfapp://userpage?userId=1001">
            打开App跳转到个人详情页面
        </a>
    </h3>

</body></html>
```


#### 二、flutter 端配置
main 中需要配置 router
```
        routes: MyRouter().registerRouter(),
```

外部链接跳转逻辑
```
  /// 使用[String]链接实现
  Future<void> initPlatformStateForStringUniLinks() async {
    String initialLink;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      initialLink = await getInitialLink();
      if (initialLink != null) {
        //  跳转到指定页面
        router.push(context, initialLink);
      }
    } on PlatformException {
      initialLink = 'Failed to get initial link.';
    } on FormatException {
      initialLink = 'Failed to parse the initial link as Uri.';
    }
    // Attach a listener to the links stream
    _sub = getLinksStream().listen((String link) {
      if (!mounted || link == null) return;
      //  跳转到指定页面
      router.push(context, link);
    }, onError: (Object err) {
      if (!mounted) return;
    });
  }


```



#### 三 、Android 端配置
```
         <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
                <action android:name="android.intent.action.VIEW"/>
                <category android:name="android.intent.category.DEFAULT"/>
                <category android:name="android.intent.category.BROWSABLE"/>

                <data
                    android:scheme="tyfapp"/>

            </intent-filter>

```

#### 四、iOS 中配置
ios/Runner/info.plist

在 dict 内增加下面的配置：


```
<key>CFBundleURLTypes</key>

<array>

  <dict>

    <key>CFBundleTypeRole</key>

    <string>Editor</string>

    <key>CFBundleURLName</key>

    <string>Two You</string>

    <key>CFBundleURLSchemes</key>

    <array>

      <string>tyfapp</string>

    </array>

  </dict>

</array>


```