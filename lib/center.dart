import 'package:flutter/material.dart';

class CenterContainer extends StatefulWidget {
  const CenterContainer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CenterItems();


}

class Centerheader extends StatefulWidget {
  const Centerheader({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CenterItems();

}

class _CenterItems extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        body: Center(
          child: Column(
            children:  <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 60),
                height: 200,
                width: double.infinity,
                color: Colors.lightBlue,
                child: Icon(Icons.account_circle, color: Colors.white, size: 80,),
              ),
              CenterBody(),
            ],
          ),
        ),
      );
  }
}

class CenterBody extends StatefulWidget {
  const CenterBody({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CenterBody();
}

class _CenterBody extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget> [
          Row(

            children: const <Widget> [
              Icon(Icons.assignment, size: 25, color: Colors.black54,),
              Text(
                '检测记录',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              )
            ],
          ),
          Container(
            height: 0.5,
            margin: EdgeInsets.only(top: 15, bottom: 15),
            color: Colors.black38,
          ),
          Row(
            children: const <Widget> [
              Icon(Icons.settings, size: 25, color: Colors.black54,),
              Text(
                '设置',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              )
            ],
          ),
          Container(
            height: 0.5,
            margin: EdgeInsets.only(top: 15, bottom: 15),
            color: Colors.black38,
          ),
        ],
      ),
    );
  }

}
