import 'package:flutter/material.dart';
import 'SecondScreen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("First Screen"),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("I am first page"),
            new RaisedButton(
                child: new Text("Launch Second Page"),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new SecondScreen()));
                }),
            new RaisedButton(
                child: new Text("Go Back"),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),

//        child: new RaisedButton(
//            child: new Text("Launch Second Screen"),
//            onPressed: () {
//              Navigator.push(context, new MaterialPageRoute(builder: (context) => new SecondScreen()));
//            }
//        ),
      ),
    );
  }
}
