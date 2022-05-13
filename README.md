# flutter_overlay_loader

A new Flutter package for developer who want to show overlay loader or progressbar for completing
future task.

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
  flutter_overlay_loader: ^1.0.4
```

### Import

```dart
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
```

## How To Use

When start network call then call this line of code..

```dart
Loader.show(context,progressIndicator:LinearProgressIndicator
(
));
```

After finished network call then call :

```dart
Loader.hide();
```

You can customize this loader..

```dart
Loader.show(context,isSafeAreaOverlay: false
,
isAppbarOverlay: true
,
isBottomBarOverlay: false
,
progressIndicator: CircularProgressIndicator
(
),themeData: Theme.of(context).
copyWith
(
accentColor: Colors.black38),
overlayColor: Color
(0x99E8EAF6)
);

```

You can also check loader is showing or not using the property : ```Loader.isShown``` and you can
prevent back pressed like this snippet:

```dart
    WillPopScope
(
child: //TODO , 
onWillPop:(
)
async => !
Loader.isShown)
```

Finally dispose call hide method on dispose method :

```dart
@override
void dispose() {
  Loader.hide();

  super.dispose();
}
```

