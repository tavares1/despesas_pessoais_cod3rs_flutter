import 'package:despesas_pessoais/components/chart.dart';
import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:despesas_pessoais/components/transaction_list.dart';
import 'package:despesas_pessoais/models/transactions.dart';

import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHomePage(),
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.yellow,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              button: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't0',
        title: "Conta antiga",
        value: 400.00,
        date: DateTime.now().subtract(Duration(days: 33))),
    Transaction(
        id: 't1',
        title: "Novo Tênis de Corrida",
        value: 310.40,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 220.30,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de forno',
      value: 100.00,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 50.00,
      date: DateTime.now().subtract(Duration(days: 4)),
    )
  ];

  List<Transaction> get _recentTransactions {
    return _transactions
        .where((element) =>
            element.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: 't${this._transactions.length}',
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Chart(_recentTransactions),
          Column(children: <Widget>[
            TransactionList(_transactions),
          ])
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
