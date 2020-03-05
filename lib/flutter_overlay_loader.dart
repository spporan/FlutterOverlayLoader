import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  static OverlayEntry _currentLoader;
  Loader._(this._progressIndicator,this._themeData);
  final Widget _progressIndicator;
  final ThemeData _themeData;
  static  OverlayState _overlayState;

  static void show(BuildContext context,{ Widget progressIndicator,ThemeData themeData,Color overlayColor}) {
    _overlayState= Overlay.of(context);
    if(_currentLoader==null){
      _currentLoader = new OverlayEntry(
          builder: (context) => Stack(
            children: <Widget>[
              SafeArea(child: Container(
                color: overlayColor??Color(0x99ffffff),
              ),),
              Center(
                  child: Loader._( progressIndicator,themeData,)
              ),
            ],
          ));
      try{
        WidgetsBinding.instance.addPostFrameCallback((_) => _overlayState.insertAll([_currentLoader]));
      }catch(e){
        print(e.toString());

      }

    }
  }

  static void hide() {
    if(_currentLoader!=null){
     try{
       _currentLoader.remove();
     }catch(e){
       print(e.toString());
     }
     finally{
       _currentLoader=null;
     }

   }

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Theme(data: _themeData??Theme.of(context).copyWith(accentColor: Colors.blue), child: _progressIndicator?? CircularProgressIndicator()),
    );
  }
}