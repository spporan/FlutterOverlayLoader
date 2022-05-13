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
  MyHomePage({key,  this.title = "Loader"}) : super(key: key);

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

  void _onItemTapped(int index) {}

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    print("bottomPadding $bottomPadding");
    return WillPopScope(child:  Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        toolbarHeight: 100,
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
                child: Text("Show Loader 1"),
                onPressed: () {
                  print("Loader is being shown before ${Loader.isShown}");

                  ///Show default loader here
                  Loader.show(context,
                      progressIndicator: LinearProgressIndicator());

                  print("Loader is being shown after ${Loader.isShown}");

                  ///loader hide after 10 seconds
                  Future.delayed(Duration(seconds: 10), () {
                    Loader.hide();
                    print("Loader is being shown after hide ${Loader.isShown}");
                  });

                }),
            ElevatedButton(
                child: Text("Show Loader 2"),
                onPressed: () {
                  print("Loader is being shown before ${Loader.isShown}");

                  ///Show loader 2 here
                  Loader.show(context,
                      isSafeAreaOverlay: false,
                      isBottomBarOverlay: false,
                      overlayFromBottom: 80,
                      overlayColor: Colors.black26,
                      progressIndicator: CircularProgressIndicator(
                        backgroundColor: Colors.red,
                      ),
                      themeData: Theme.of(context)
                          .copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green))
                  );

                  print("Loader is being shown after ${Loader.isShown}");

                  ///loader hide after 3 seconds
                  Future.delayed(Duration(seconds: 3), () {
                    Loader.hide();

                    print("Loader is being shown after hide ${Loader.isShown}");
                  });

                }),
            ElevatedButton(
                child: Text("Show Loader 3"),
                onPressed: () {
                  ///Show loader 3 here
                  Loader.show(context,
                      isAppbarOverlay: false,
                      overlayFromTop: 100,
                      progressIndicator: CircularProgressIndicator(),
                      themeData: Theme.of(context)
                          .copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black38)),
                      overlayColor: Color(0x99E8EAF6));

                  ///loader hide after 3 seconds
                  Future.delayed(Duration(seconds: 3), () {
                    Loader.hide();
                  });

                }),

            ElevatedButton(
                child: Text("Show Loader 4"),
                onPressed: () {
                  ///Show loader 4 here
                  Loader.show(context,
                      isSafeAreaOverlay: false,
                      progressIndicator: CircularProgressIndicator(),
                      isBottomBarOverlay: false,
                      overlayFromBottom: 80,
                      themeData: Theme.of(context)
                          .copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black38)),
                      overlayColor: Color(0x99E8EAF6)
                  );

                  ///loader hide after 3 seconds
                  Future.delayed(Duration(seconds: 3), () {
                    Loader.hide();
                  });

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
        onTap: _onItemTapped,
        iconSize: 50,
      ),
    ), onWillPop:() async => !Loader.isShown);
  }
}
