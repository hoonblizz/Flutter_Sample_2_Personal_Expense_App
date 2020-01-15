import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  // List of <Transaction>
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Pencil',
      amount: 7.45,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction (String txTitle, double txAmount) {
    // 새로운 Transaction 만들고, 추가시켜준다.
    final newTx = Transaction(
      title: txTitle, 
      amount: txAmount, 
      date: DateTime.now(), 
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // 유저 인풋
      NewTransaction(_addNewTransaction),
      // 인풋 결과들 리스트
      TransactionList(_userTransactions),
    ],);
  }
}