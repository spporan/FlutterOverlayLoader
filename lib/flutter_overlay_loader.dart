import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  static OverlayEntry currentLoader;
  Loader._({this.progressIndicator,this.themeData});
  final ProgressIndicator progressIndicator;
  final ThemeData themeData;


  static void show(BuildContext context,{ ProgressIndicator progressIndicator,ThemeData themeData,Color overlayColor}) {
    currentLoader = new OverlayEntry(
        builder: (context) => Stack(
          children: <Widget>[
            SafeArea(child: Container(
              color: overlayColor??Color(0x99ffffff),
            ),),
            Center(
                child: Loader._(progressIndicator: progressIndicator,themeData: themeData,)
            ),
          ],
        ));
    Overlay.of(context).insert(currentLoader);
  }

  static void hide() {
    currentLoader?.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Theme(data: themeData??Theme.of(context).copyWith(accentColor: Colors.blue), child: progressIndicator?? CircularProgressIndicator()),
    );
  }
}