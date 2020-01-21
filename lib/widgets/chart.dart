import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTansactions;
  Chart(this.recentTansactions);

  // get 은 
  List<Map<String, Object>> get groupedTransactionValus {
    return List.generate(7, (index) {
      // 들어온 값이 어느 날 것인가 계산.
      final weekDay = DateTime.now().subtract(Duration(days: index),); // 1 ~ 7 일 을 지금 날짜에서 뺀다.
      //double totlaSum;

      return {'day': DateFormat.E(weekDay), 'amount': 9.99};    // DateFormat.E(weekDay) 로 요일을 부른다.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(children: <Widget>[

      ],),
    );
  }
}
