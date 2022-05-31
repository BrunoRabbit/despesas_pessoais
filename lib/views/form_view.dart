import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:despesas_pessoais/controllers/global_controller.dart';

class FormView extends StatefulWidget {
  final String? title;
  final bool isEditableText;
  final int? index;

  const FormView({
    Key? key,
    required this.title,
    required this.isEditableText,
    this.index,
  }) : super(key: key);

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
    final _formController = Provider.of<GlobalController>(context);

    _formController.newData =
        _formController.formatData.format(_formController.selectedDate);

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title!,
                  style: const TextStyle(
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
                      if (widget.isEditableText == false) {
                        if (_formKey.currentState!.validate()) {
                          _formController.addToList(
                            _nameController.text,
                            double.parse(_priceController.text),
                            _formController.selectedDate,
                          );
                          Navigator.of(context).pop();
                        }
                      } else {
                        if (_formKey.currentState!.validate()) {
                          _formController.editItem(
                            _nameController.text,
                            widget.index!,
                            double.parse(_priceController.text),
                            _formController.selectedDate,
                          );
                          Navigator.of(context).pop();
                        }
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
    );
  }
}
