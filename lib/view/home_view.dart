import 'package:despesas_pessoais/controller/form_controller.dart';
import 'package:despesas_pessoais/data/data.dart';
import 'package:despesas_pessoais/routes/app_routes.dart';
import 'package:despesas_pessoais/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        children: [
          Card(
            elevation: 6,
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  child: const Text('data'),
                  color: Colors.red,
                )
              ],
            ),
          ),
          Consumer<FormController>(
            builder: (context, value, child) {
              return listTransaction.isNotEmpty
                  ? CardWidget(value: value)
                  : Column(
                      children: const [
                        Text(
                          'Nenhum item encontrado!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.search_off,
                          size: 58,
                        ),
                      ],
                    );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(
            RoutesPath.formPage,
          );
          // showModalBottomSheet(
          //   isScrollControlled: true,
          //   context: context,
          //   builder: (_) {
          //     return ShowModalWidget(
          //       title: 'Sua nova despesa!',
          //       addToList: addToList,
          //     );
          //   },
          // );
        },
      ),
    );
  }
}
