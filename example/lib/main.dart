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
  MyHomePage({key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    Loader.hide();
    print("Called dispose");

    super.dispose();
  }

  void _onItemTapped(int index) {

  }


  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    print("bottomPadding $bottomPadding");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'Loading...',
            ),
            ElevatedButton(
                child: Text("ShowLoader 1"),
                onPressed: () {
                  //default
                  Loader.show(context,
                      progressIndicator: LinearProgressIndicator());

                  Future.delayed(Duration(seconds: 10), () {
                    Loader.hide();
                  });
                }),
            ElevatedButton(
                child: Text("ShowLoader 2"),
                onPressed: () {
                  Loader.show(context,
                      isBottomBarOverlay: false,
                      progressIndicator: CircularProgressIndicator(
                        backgroundColor: Colors.red,
                      ),
                      themeData: Theme.of(context)
                          .copyWith(accentColor: Colors.green));
                  Future.delayed(Duration(seconds: 3), () {
                    Loader.hide();
                  });
                }),
            ElevatedButton(
                child: Text("ShowLoader 3"),
                onPressed: () {
                  Loader.show(context,
                      isAppbarOverlay: true,
                      isBottomBarOverlay: false,
                      progressIndicator: CircularProgressIndicator(),
                      themeData: Theme.of(context)
                          .copyWith(accentColor: Colors.black38),
                      overlayColor: Color(0x99E8EAF6));
                  Future.delayed(Duration(seconds: 3), () {
                    Loader.hide();
                  });
                }),
            ElevatedButton(
                child: Text("ShowLoader 4"),
                onPressed: () {
                  /*Loader.show(
                      context,progressIndicator: CircularProgressIndicator(),
                      themeData: Theme.of(context).copyWith(accentColor: Colors.black38),
                      overlayColor:Color(0x99E8EAF6)
                  );*/
                  /* Future.delayed(Duration(seconds: 3),(){
                    Loader.hide();
                  });*/

                  Loader.hide();
                }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped
      ),
    );
  }
}
