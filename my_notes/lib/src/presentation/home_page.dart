import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Notes"),
        ),
        body: Column(
            children: [
              Text("Content")
            ],
          ),
        ),
    );
  }
}