![Build Passing](https://img.shields.io/badge/Build-passing-green) [![Pub Version](https://img.shields.io/pub/v/flutter_overlay_loader?logo=flutter&logoColor=blue)](https://pub.dev/packages/flutter_overlay_loader) ![Pub Likes](https://img.shields.io/pub/likes/flutter_overlay_loader?logo=flutter&logoColor=blue) ![Pub Points](https://img.shields.io/pub/points/flutter_overlay_loader?logo=flutter&logoColor=blue) ![Pub Popularity](https://img.shields.io/pub/popularity/flutter_overlay_loader?logo=flutter&logoColor=blue) [![GitHub forks](https://img.shields.io/github/forks/spporan/FlutterOverlayLoader)](https://github.com/spporan/FlutterOverlayLoader/network) [![GitHub stars](https://img.shields.io/github/stars/spporan/FlutterOverlayLoader)](https://github.com/spporan/FlutterOverlayLoader/stargazers) [![GitHub issues](https://img.shields.io/github/issues/spporan/FlutterOverlayLoader)](https://github.com/spporan/FlutterOverlayLoader/issues) [![GitHub followers](https://img.shields.io/github/followers/spporan?style=social)](https://github.com/spporan) [![Twitter](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Fmobile.twitter.com%2Fmdshahparan520)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2Fspporan%2FFlutterOverlayLoader%2F) [![GitHub license](https://img.shields.io/github/license/spporan/FlutterOverlayLoader)](https://github.com/spporan/FlutterOverlayLoader/blob/master/LICENSE)

# flutter_overlay_loader

A simple Flutter package for managing loader when
fetching remote data or any long running async task. Flutter overlay loader is easy to use.
You can show loader using only write two lines of code.

Overlay loader without overlaying Appbar
<p align="center">
<img src="https://user-images.githubusercontent.com/21147796/111874514-e9405b80-89bf-11eb-9508-3ad1b66ac3ef.jpg" alt="drawing" width="230px" hspace="30"/>  <img src="https://user-images.githubusercontent.com/21147796/111874551-0f65fb80-89c0-11eb-851e-92c88872ac16.jpg" alt="drawing" width="230px"/> 
</p>

Overlay Loader without overlaying BottomAppBar and also overlaying AppBar
<p align="center">
<img src="https://user-images.githubusercontent.com/21147796/111874514-e9405b80-89bf-11eb-9508-3ad1b66ac3ef.jpg" alt="drawing" width="230px" hspace="30"/> 
</p>

## Getting Started

## Installing

```yaml
dependencies:
  flutter_overlay_loader: ^1.0.5
```

### Import

```dart
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
```

## How To Use

When start network call then call this line of code..

```dart
Loader.show(context,progressIndicator:LinearProgressIndicator());
```

After finished network call then call :

```dart
Loader.hide();
```

You can customize this loader..

```dart
Loader.show(context,
  isSafeAreaOverlay: false,
  isBottomBarOverlay: false,
  overlayFromBottom: 80,
  overlayColor: Colors.black26,
  progressIndicator: CircularProgressIndicator(backgroundColor: Colors.red),
  themeData: Theme.of(context)
    .copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green))
);
```

You can also check loader is showing or not using the property : ```Loader.isShown``` and you can
prevent back pressed like this snippet:

```dart
WillPopScope(
  child: //TODO , 
  onWillPop:()async => !Loader.isShown
)
```

Finally dispose call hide method on dispose method :

```dart
@override
void dispose() {
  Loader.hide();

  super.dispose();
}
```


