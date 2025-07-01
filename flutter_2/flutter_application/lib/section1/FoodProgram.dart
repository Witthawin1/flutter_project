import 'package:flutter/material.dart';
import 'FoodMenu.dart';

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
  List<FoodMenu> menu = [
    FoodMenu("Shrimp", 500, 'asset/images/shrimp.png'),
    FoodMenu("Kaprao", 80, 'asset/images/kaprao.png'),
    FoodMenu("Somtam", 60, 'asset/images/somtam.png'),
    FoodMenu("PatThai", 70, 'asset/images/phadthai.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello Flutter")),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          FoodMenu food = menu[index];
          return ListTile(
            leading: Image.asset(food.img),
            title: Text(food.name, style: TextStyle(fontSize: 30)),
            subtitle: Text('price : ${food.price}'),
            onTap: () {
              print("you choose menu : ${food.name}");
            },
          );
        },
      ),
    );
  }
}
