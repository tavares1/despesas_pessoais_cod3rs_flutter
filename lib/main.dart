import './models/Transactions.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {

  final _transactions = [
    Transaction(
      id: 't1',
      title: "Novo Tênis de Corrida",
      value: 310.40,
      date: DateTime.now()
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 220.30,
      date: DateTime.now()
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        Container(
          child: Card(
            color: Colors.blue,
            child: Text('Gráfico'),
            elevation: 5,
          ),
        ),
        Card(
          child: Text('Lista de Gastos'),
        )
      ],)
    );
  }
}