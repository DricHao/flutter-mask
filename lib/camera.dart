import 'dart:ui';

import 'package:flutter/material.dart';

class CameraContainer extends StatefulWidget {
  const CameraContainer({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => Camera();
}

class Camera extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          padding: const EdgeInsets.all(40),
          child: Column(
            children: const <Widget>[
              Image(
                  width: 300,
                  height: 300,
                  semanticLabel: '开始检测',
                  fit: BoxFit.fitWidth,
                  image: AssetImage('images/camera.png')
              ),
              Text(
                '开始检测',
                style: TextStyle(
                  fontSize: 16
                ),
              )
            ],
          )
        ),
      ),
    );
  }

}
