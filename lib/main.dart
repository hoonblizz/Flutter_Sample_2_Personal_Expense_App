import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Homepage text'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Chart 컨테이너
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart place'),
                elevation: 5,
                color: Colors.blue,
              ),
            ),
            UserTransactions()
          ],
        ));
  }
}
