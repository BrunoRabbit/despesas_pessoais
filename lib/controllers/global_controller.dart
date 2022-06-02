import 'dart:math';

import 'package:despesas_pessoais/data/data.dart';
import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GlobalController extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();
  final DateFormat formatData = DateFormat('dd/MM/yyyy');
  String newName = '';
  double newPrice = 0;
  String newData = '';
  Transaction? transaction;

  void editItem(
    String editedName,
    int index,
    double editedPrice,
    DateTime editedDate,
  ) {
    listTransaction[index].name = editedName;
    listTransaction[index].price = editedPrice;
    listTransaction[index].date = editedDate;
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 7),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      selectedDate = pickedDate;
      notifyListeners();
    });
  }

  addToList(String name, double price, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      name: name,
      date: date,
      price: price,
    );
    listTransaction.add(newTransaction);
    notifyListeners();
  }

  void deleteItem(int id) {
    listTransaction.removeAt(id);
    notifyListeners();
  }

  List<Transaction> get recentTransaction {
    return listTransaction.where((e) {
      return e.date.isAfter(
        DateTime.now().subtract(const Duration(
          days: 7,
        )),
      );
    }).toList();
  }
}
