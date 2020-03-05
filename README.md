
# flutter_overlay_loader

A new Flutter package for developer who want to show overlay loader or progressbar for completing future task.

## Getting Started

##  Installing

```yaml
dependencies:
  flutter_overlay_loader: ^0.0.2
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
Loader.show(context,progressIndicator: CircularProgressIndicator(backgroundColor: Colors.red,),themeData: Theme.of(context).copyWith(accentColor: Colors.green));

```

Finally dispose call hide method on dispose method :

```dart
@override
  void dispose() {
  Loader.hide();

    super.dispose();
  }
```

