import 'package:flutter/material.dart';

void main(){
  var app = MaterialApp(
    title: "My app",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
      ),
      body: Text("Hello Every one"),
    )
  );

  runApp(app);
}