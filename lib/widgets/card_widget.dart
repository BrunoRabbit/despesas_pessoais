import 'package:flutter/material.dart';

import 'package:despesas_pessoais/controller/form_controller.dart';
import 'package:despesas_pessoais/data/data.dart';

class CardWidget extends StatelessWidget {
  final FormController value;

  const CardWidget({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: listTransaction.length,
        itemBuilder: (context, index) {
          value.newName = listTransaction[index].name;
          value.newData = listTransaction[index].data;
          value.newPrice = listTransaction[index].price;

          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
            ),
            child: Card(
              elevation: 5,
              child: Dismissible(
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.only(right: 16),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                onDismissed: (direction) => value.deleteItem(index),
                key: ValueKey(listTransaction[index].id),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FittedBox(
                        child: Text(
                          'R\$ ${value.newPrice}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  iconColor: Colors.blue,
                  title: Text(
                    value.newName,
                    style: TextStyle(
                      color: Colors.black87.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    value.newData.replaceAll(' ', '/'),
                    style: TextStyle(
                      color: Colors.black87.withOpacity(0.6),
                      fontSize: 15,
                    ),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      // value.updateValues(
                      //     value.newName, value.newPrice, value.newData);
                    },
                    child: const Icon(
                      Icons.edit,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
// **
//  * // InkWell(
                      //   onTap: () {},
                      //   // onTap: () => editItem(index),
                      //   child: const Icon(
                      //     Icons.mode_edit_outline_rounded,
                      //     color: Colors.red,
                      //   ),
                      // ),
                      // const SizedBox(
                      //   width: 15,
                      // ),
//  */