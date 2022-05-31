import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Transaction extends Equatable {
  String id;
  String name;
  DateTime date;
  double price;

  Transaction({
    required this.id,
    required this.name,
    required this.date,
    required this.price,
  });

  @override
  List<Object?> get props => [id];
}
