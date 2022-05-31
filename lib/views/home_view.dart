import 'package:despesas_pessoais/controllers/global_controller.dart';
import 'package:despesas_pessoais/data/data.dart';
import 'package:despesas_pessoais/views/form_view.dart';
import 'package:despesas_pessoais/widgets/card_widget.dart';
import 'package:despesas_pessoais/widgets/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Consumer<GlobalController>(
        builder: (context, value, child) {
          return Column(
            children: [
              ChartWidget(
                value.recentTransaction,
              ),
              listTransaction.isNotEmpty
                  ? const CardWidget()
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
                    ),
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (_) {
              return const FormView(
                title: 'Insira sua nova despesa!',
                isEditableText: false,
              );
            },
          );
        },
      ),
    );
  }
}
