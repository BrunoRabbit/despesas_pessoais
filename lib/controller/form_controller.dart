import 'dart:math';

import 'package:despesas_pessoais/data/data.dart';
import 'package:despesas_pessoais/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormController extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();
  final DateFormat formatData = DateFormat('dd/MM/yyyy');
  String newName = '';
  double newPrice = 0;
  String newData = '';

  addToList(Transaction transaction) {
    listTransaction.add(transaction);
    notifyListeners();
  }

  void deleteItem(int id) {
    listTransaction.removeAt(id);
    notifyListeners();
  }

  void updateValues(String name, double price, String data) async {
    // name = newName;
    // price = newPrice;
    // data = newData;

    await addToList(
      Transaction(
        id: Random().nextDouble().toString(),
        name: name,
        data: data,
        price: price,
      ),
    );
    // showModalBottomSheet(
    //   isScrollControlled: true,
    //   context: context,
    //   builder: (_) {
    //     return ShowModalWidget(
    //       title: 'Edite sua despesa!',
    //       transaction: listTransaction[index],
    //     );
    //   },
    // );

    // listTransaction.add(listTransaction[index]);
  }

  Future<void> selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      selectedDate = pickedDate;
      notifyListeners();
    });
    // _selectedDate = picked;
    // newData = _formatData.format(_selectedDate);
    // notifyListeners();
  }

  String getDateTime(String dateTime) {
    dateTime = dateTime.replaceAll('/', ' ');
    return dateTime;
  }
}
