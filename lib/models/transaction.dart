import 'package:flutter/foundation.dart'; // @required 쓰기 위한것

class Transaction {
  String id;
  String title;
  double amount;
  DateTime date;

  // Constructor
  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}
