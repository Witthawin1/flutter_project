import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Stateless Widgets
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyApp",
      theme: ThemeData(primarySwatch: Colors.orange),

      // home: Scaffold(
      //   appBar: AppBar(title: Text("Hello Flutter")),
      //   body: Center(child: Text("Hello Everyone 2",
      //     style: TextStyle(fontSize: 30 , color: Colors.purple),
      //   )),
      // ),

      // home: Scaffold(
      //   appBar: AppBar(title: Text("Hello Flutter")),
      //   body: Center(
      //     child: Image(image: NetworkImage("https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg")),
      //   ),
      // ),

      // home: Scaffold(
      //   appBar: AppBar(title: Text("Hello Flutter")),
      //   body : Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround ,
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //    children: [
      //      Text("Column 1"),
      //      Text("Column 2"),
      //      Text("Column 3")
      //    ],)
      // )
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0; // state

  @override
  Widget build(BuildContext context) {
    List<Widget> data = [];
    for (var i = 1; i < 5; i++) {
      data.add(Text("list : $i"));
    }
    data.add(Text("click"));
    data.add(Text(number.toString(), style: TextStyle(fontSize: 60)));

    return Scaffold(
      appBar: AppBar(title: Text("Hello Flutter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          // children: [
          //   Text("click"),
          //   // Text("$number", style: TextStyle(fontSize: 60)),
          //   Text(number.toString(), style: TextStyle(fontSize: 60)),
          // ],
          children: data,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //   setState(() {
        //     number++;
        //   });
        //   if (number == 10) {
        //        setState(() {
        //       number = number + 5;
        //   });
        //   }
        // // },child: Text("add"),),
        // },
        onPressed: () {
          addNumber();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void addNumber() {
    setState(() {
      number++;
    });
  }
}
