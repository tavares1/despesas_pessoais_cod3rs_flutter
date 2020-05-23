import 'package:despesas_pessoais/components/chart_bar.dart';
import 'package:despesas_pessoais/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = recentTransactions.where((element) {
        return element.date.day == weekDay.day &&
            element.date.month == weekDay.month &&
            element.date.year == weekDay.year;
      }).fold(0, (previousValue, element) => previousValue + element.value);

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0, (previousValue, element) {
      return previousValue + element['value'];
    });
  }

  Chart(this.recentTransactions);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactions.map((e) {
              String label = e['day'];
              double value = e['value'];
              double percentage = value == 0 ? 0 : value / _weekTotalValue;
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  dayLabel: label,
                  totalValue: value,
                  percentage: percentage,
                ),
              );
            }).toList()),
      ),
    );
  }
}
