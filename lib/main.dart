import 'package:flutter/material.dart';
import 'weather.dart';
import 'camera.dart';
import 'center.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
}

class _HomePage extends State <MyApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightBlue,
      ),

      home: _currentIndex == 0 ? Scaffold(
        appBar: AppBar(
          title: const Text('口罩识别'),
          foregroundColor: Colors.white,
        ),
        body: SizedBox(
          height: 800,
          child: Column(
            children: const <Widget> [
              SizedBox(
                height: 200,
                child: WeatherContainer(),
              ),
              SizedBox(
                height: 500,
                child: CameraContainer()
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.grey),
                activeIcon: Icon(Icons.home, color: Colors.lightBlue),
                label: '首页'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, color: Colors.grey),
                activeIcon: Icon(Icons.person, color: Colors.lightBlue),
                label: '我的'
            )
          ],
        ),
      ) : Scaffold(
            appBar: AppBar(
              title: const Text('个人中心'),
              foregroundColor: Colors.white,
            ),
            body: Container(
              child: CenterContainer(),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.grey),
                    activeIcon: Icon(Icons.home, color: Colors.lightBlue),
                    label: '首页'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline, color: Colors.grey),
                    activeIcon: Icon(Icons.person, color: Colors.lightBlue),
                    label: '我的'
                )
              ],
            ),

      )

    );
  }
}


