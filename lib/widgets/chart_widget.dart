import 'package:flutter/material.dart';

import 'package:despesas_pessoais/models/transaction.dart';
import 'package:despesas_pessoais/widgets/chart_bar_widget.dart';
import 'package:intl/intl.dart';

class ChartWidget extends StatefulWidget {
  final List<Transaction> recentTransaction;

  const ChartWidget(
    this.recentTransaction, {
    Key? key,
  }) : super(key: key);

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  List<Map<String, dynamic>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < widget.recentTransaction.length; i++) {
        bool sameDay = widget.recentTransaction[i].date.day == weekDay.day;
        bool sameMonth =
            widget.recentTransaction[i].date.month == weekDay.month;
        bool sameYear = widget.recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += widget.recentTransaction[i].price;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'price': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, e) {
      return sum + e['price'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBarWidget(
                label: e['day'],
                value: e['price'],
                percentage:
                    _weekTotalValue == 0 ? 0 : (e['price']) / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
