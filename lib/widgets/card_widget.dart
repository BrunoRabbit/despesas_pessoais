import 'package:despesas_pessoais/controllers/global_controller.dart';
import 'package:flutter/material.dart';

import 'package:despesas_pessoais/data/data.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalController controller = Provider.of<GlobalController>(context);
    return Expanded(
      child: ListView.builder(
        itemCount: listTransaction.length,
        itemBuilder: (context, index) {
          controller.newName = listTransaction[index].name;
          controller.newData = listTransaction[index].date.toString();
          controller.newPrice = listTransaction[index].price;

          controller.newData =
              controller.formatData.format(listTransaction[index].date);

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
                onDismissed: (direction) => controller.deleteItem(index),
                key: ValueKey(listTransaction[index].id),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FittedBox(
                        child: Text(
                          'R\$ ${controller.newPrice}',
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
                    controller.newName,
                    style: TextStyle(
                      color: Colors.black87.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    controller.newData,
                    style: TextStyle(
                      color: Colors.black87.withOpacity(0.6),
                      fontSize: 15,
                    ),
                  ),
                  trailing: InkWell(
                    onTap: () {},
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
