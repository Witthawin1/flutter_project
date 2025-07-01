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
      // body: Center(
      //     // Column(
      //     //   mainAxisAlignment: MainAxisAlignment.center,
      //     //   crossAxisAlignment: CrossAxisAlignment.end,
      //     // children: [
      //     //   Text("click"),
      //     //   // Text("$number", style: TextStyle(fontSize: 60)),
      //     //   Text(number.toString(), style: TextStyle(fontSize: 60)),
      //     // ],
      //     child: ListView(
      //     children: getData(10),
      //   ),
      // ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("menu : ${index + 1}"));
        },
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

  List<Widget> getData(int count) {
    List<Widget> data = [];
    data.add(Text(number.toString(), style: TextStyle(fontSize: 60)));
    for (var i = 0; i < count; i++) {
      // data.add(Text("list ${i + 1}" , style: TextStyle(fontSize : 25,)));
      var menu = ListTile(
        title: Text("menu ${i + 1}", style: TextStyle(fontSize: 25)),
        subtitle: Text("subtititle ${i + 1}"),
      );
      data.add(menu);
      data.add(Image(image: NetworkImage("https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D")));
    }
    return data;
  }
}
