import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:despesas_pessoais/components/transaction_list.dart';
import 'package:despesas_pessoais/models/Transactions.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: 't1',
        title: "Novo Tênis de Corrida",
        value: 310.40,
        date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Conta de luz', value: 220.30, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[TransactionList(transactions: _transactions), TransactionForm())
  }
}
