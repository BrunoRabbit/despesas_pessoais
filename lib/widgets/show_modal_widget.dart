// import 'package:despesas_pessoais/data/data.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:despesas_pessoais/controller/home_controller.dart';
// import 'package:despesas_pessoais/model/transaction.dart';

// class ShowModalWidget extends StatelessWidget {
//   const ShowModalWidget({Key? key}) : super(key: key);

  

//   // String name = '';
//   // double price = 0;
//   // String date = '';

//   // loadItem(Transaction transaction, BuildContext context) {
//   //   final _readValue = context.read<HomeController>();
//   //   final index = listTransaction.indexOf(transaction);

//   //   name = listTransaction[index].name;
//   //   price = listTransaction[index].price;
//   //   date = listTransaction[index].data;

//   //   name = _readValue.nameController.text;
//   //   price = double.parse(_readValue.priceController.text);
//   //   date = _readValue.getDateTime(_readValue.date);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // final _watchValue = context.watch<HomeController>();
//     // final _readValue = context.read<HomeController>();

//     // loadItem(transaction!, context);

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Container(
//         padding: MediaQuery.of(context).viewInsets,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             const SizedBox(height: 10),
//             const Divider(thickness: 2),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _readValue.nameController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Titulo',
//               ),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _readValue.priceController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Valor (R\$)',
//               ),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 Text('Data selecionada: ${_watchValue.date}'),
//                 const Spacer(),
//                 TextButton(
//                   onPressed: () => _readValue.selectDate(context),
//                   child: const Text('Selecionar data'),
//                 ),
//               ],
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // final name = _readValue.nameController.text;
//                   // final price = double.parse(_readValue.priceController.text);
//                   // final data = _readValue.getDateTime(_readValue.date);

//                   addToList!(name, price, date);

//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('Nova transação'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
