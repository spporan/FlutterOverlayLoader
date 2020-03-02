import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
              'Downloading..........',
            ),
            RaisedButton(
                child: Text("Click"),
                onPressed: (){
                  print("Click");


                }),
            RaisedButton(
                child: Text("ShowLoader"),
                onPressed: (){
                  Loader.show(context,progressIndicator:CircularProgressIndicator(backgroundColor: Colors.green,),themeData: Theme.of(context).copyWith(accentColor: Colors.black54));
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