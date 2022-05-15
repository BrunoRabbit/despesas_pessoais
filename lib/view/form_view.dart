import 'dart:async';
import 'dart:math';
import 'package:despesas_pessoais/controller/form_controller.dart';
import 'package:despesas_pessoais/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formController = Provider.of<FormController>(context);

    _formController.newData =
        _formController.formatData.format(_formController.selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: MediaQuery.of(context).viewInsets,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Insira sua nova despesa!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 2),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Titulo',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nome não pode ser vazio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Valor (R\$)',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Preço não pode ser vazio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        // ignore: unnecessary_null_comparison
                        _formController.selectedDate == null
                            ? 'Nenhuma data selecionada!'
                            : 'Data selecionada: ${_formController.newData}',
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => _formController.selectDate(context),
                        child: const Text('Selecionar data'),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formController.addToList(
                            Transaction(
                              id: Random().nextDouble().toString(),
                              name: _nameController.text,
                              price: double.parse(_priceController.text),
                              data: _formController.newData,
                            ),
                          );
                          Timer(const Duration(milliseconds: 500), () {
                            Navigator.of(context).pop();
                          });
                        }
                      },
                      child: const Text('Nova transação'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
