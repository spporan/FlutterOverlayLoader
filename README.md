
# flutter_overlay_loader

A new Flutter package for developer who want to show overlay loader or progressbar for completing future task.

Overlay loader without overlaying Appbar
<p align="center">
<img src="https://github.com/spporan/FlutterOverlayLoader/blob/master/screenshots/Screenshot_20210320_173253.jpg" alt="drawing" width="230px" hspace="30"/>  <img src="https://github.com/spporan/FlutterOverlayLoader/blob/master/screenshots/Screenshot_20210320_173304.jpg" alt="drawing" width="230px"/> 
</p>

Overlay Loader without overlaying BottomAppBar and also overlaying AppBar
<p align="center">
<img src="https://github.com/spporan/FlutterOverlayLoader/blob/master/screenshots/Screenshot_20210320_173311.jpg" alt="drawing" width="230px" hspace="30"/> 
</p>

## Getting Started

##  Installing

```yaml
dependencies:
  flutter_overlay_loader: ^0.1.0-nullsafety
```

###  Import

```dart
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
```

##  How To Use
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
                      isAppbarOverlay: true,
                      isBottomBarOverlay: false,
                      progressIndicator: CircularProgressIndicator(),
                      themeData: Theme.of(context)
                          .copyWith(accentColor: Colors.black38),
                      overlayColor: Color(0x99E8EAF6));

```

Finally dispose call hide method on dispose method :

```dart
@override
  void dispose() {
  Loader.hide();

    super.dispose();
  }
```

