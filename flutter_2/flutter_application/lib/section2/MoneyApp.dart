import 'package:flutter/material.dart';
import 'package:flutter_application/section2/MoneyBox.dart';

void main() {
  runApp(MyApp());
}

// Stateless Widgets
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Payment Account",
      theme: ThemeData(
        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          // ···
        ),
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Payment Account",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MoneyBox("Payment", 15000, Colors.green, 50),
            MoneyBox("Payment", 17000, Colors.blue, 50),
            MoneyBox("Payment", 12000, Colors.red, 50),
            MoneyBox("Payment", 16000, Colors.orange, 50)
          ]
        ),
      ),
    );
  }
}


