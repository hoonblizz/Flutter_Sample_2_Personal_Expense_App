import 'package:flutter/material.dart';
import 'package:flutter_sample_personal_expense_app/widgets/chart_bar.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTansactions;
  Chart(this.recentTansactions);

  // get 은
  List<Map<String, Object>> get groupedTransactionValus {
    return List.generate(7, (index) {
      // 들어온 값이 어느 날 것인가 계산.
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      ); // 1 ~ 7 일 을 지금 날짜에서 뺀다.
      var totlaSum = 0.0;

      for (var i = 0; i < recentTansactions.length; i++) {
        if (recentTansactions[i].date.day == weekDay.day &&
            recentTansactions[i].date.month == weekDay.month &&
            recentTansactions[i].date.year == weekDay.year) {
          totlaSum += recentTansactions[i].amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totlaSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totlaSum,
      }; // DateFormat.E(weekDay) 로 요일을 부른다.
    });
  }

  double get totalSpending {
    return groupedTransactionValus.fold(0.0, (sum, el) {
      return sum + el['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValus.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'],
                data['amount'],
                (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
