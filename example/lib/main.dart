import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Overlay Loader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Overlay Loader example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Loading...',
            ),
            RaisedButton(
                child: Text("ShowLoader 1"),
                onPressed: (){
                  //default
                  Loader.show(context);

                  Future.delayed(Duration(seconds: 3),(){

                    Loader.hide();
                  });



                }),
            RaisedButton(
                child: Text("ShowLoader 2"),
                onPressed: (){
                  Loader.show(context,progressIndicator: CircularProgressIndicator(backgroundColor: Colors.greenAccent,),themeData: Theme.of(context).copyWith(accentColor: Colors.green));
                  Future.delayed(Duration(seconds: 3),(){
                    Loader.hide();
                  });



                }),
            RaisedButton(
                child: Text("ShowLoader 3"),
                onPressed: (){
                  Loader.show(
                      context,progressIndicator: CircularProgressIndicator(backgroundColor: Colors.green,),
                      themeData: Theme.of(context).copyWith(accentColor: Colors.black38),
                    overlayColor:Color(0x99E8EAF6)
                  );
                  Future.delayed(Duration(seconds: 3),(){
                    Loader.hide();
                  });



                }),

          ],
        ),
      ),

    );
  }
}




