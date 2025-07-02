import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ExchangeRate.dart';

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
  // Change this to hold the Future itself
  Future<ExchangeRate?>? _exchangeRateFuture;

  @override
  void initState() {
    super.initState();
    // Assign the Future returned by getExChangeRate to _exchangeRateFuture
    _exchangeRateFuture = getExChangeRate();
  }

  Future<ExchangeRate?> getExChangeRate() async {
    var url =
        'https://api.exchangeratesapi.io/v1/latest?symbols=USD,THB&access_key=2651626a9fe7db40bf296a12834b3467';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    print("response");
    print(response.body);
    // You can still store it in _dataFromApi if you need it elsewhere,
    // but _exchangeRateFuture is what FutureBuilder needs.
    // _dataFromApi = exchangeRateFromJson(response.body); // You can keep this line or remove it if not strictly needed
    return exchangeRateFromJson(response.body); // Directly return the parsed data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Money Exchange",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary, // Added AppBar color for better look
      ),
      body: FutureBuilder<ExchangeRate?>( // Specify the type for clarity
        future: _exchangeRateFuture, // *** This is the core fix ***
        builder: (BuildContext context, AsyncSnapshot<ExchangeRate?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data != null) {
              var result = snapshot.data!;
              print("test");
              print(result);
              return ListView(
                children: [
                  ListTile(title: Text("Base Currency: ${result.base ?? 'N/A'}")),
                  ListTile(title: Text("Date: ${result.date ?? 'N/A'}")),
                  ListTile(title: Text("THB Rate: ${result.rates?["THB"]?.toStringAsFixed(2) ?? 'N/A'}")),
                  ListTile(title: Text("USD Rate: ${result.rates?["USD"]?.toStringAsFixed(2) ?? 'N/A'}")),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Center(child: Text('No data available.'));
            }
          }
          return Center(child: LinearProgressIndicator()); // Show loading while waiting
        },
      ),
    );
  }
}