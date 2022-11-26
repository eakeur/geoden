import 'package:flutter/material.dart';
import 'package:geoden/src/model/reporter.dart';
import 'package:geoden/src/report/report_controller.dart';

class ReporterForm extends StatelessWidget {
  final TextEditingController _fullName, _cpf, _birthDate;
  final ValueNotifier<bool> _valid;
  final ReportController controller;
  final VoidCallback? onSubmit;

  ReporterForm({
    required this.controller,
    this.onSubmit,
    super.key,
  })  : _fullName = TextEditingController.fromValue(
          TextEditingValue(text: controller.reporter.fullName),
        ),
        _cpf = TextEditingController.fromValue(
          TextEditingValue(text: controller.reporter.cpf),
        ),
        _birthDate = TextEditingController.fromValue(
          TextEditingValue(text: controller.reporter.birthDate),
        ),
        _valid = ValueNotifier(controller.isReporterFormValid);

  void submit() {
    if (!_valid.value) return;

    controller.reporter = controller.reporter.copyWith(
      fullName: _fullName.text,
      cpf: _cpf.text,
      birthDate: _birthDate.text,
    );

    onSubmit?.call();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 60, right: 60, bottom: 25, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Suas informações",
                softWrap: true,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 32, color: Colors.orange[900]),
              ),
              Text(
                "Os dados precisam estar de acordo com o os da Receita Federal.",
                softWrap: true,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
        Form(
          key: controller.reporterForm,
          onChanged: () => _valid.value = controller.isReporterFormValid,
          child: Column(
            children: [
              TextFormField(
                controller: _fullName,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(label: Text("Nome completo")),
              ),
              TextFormField(
                controller: _cpf,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(label: Text("CPF")),
                validator: Reporter.validateCPF,
              ),
              TextFormField(
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(label: Text("E-mail")),
              ),
              TextFormField(
                controller: _birthDate,
                style: const TextStyle(fontSize: 20),
                decoration:
                    const InputDecoration(label: Text("Data de nascimento")),
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 60, right: 60, bottom: 25, top: 25),
          child: Row(
            children: [
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _valid,
                  builder: (context, valid, child) {
                    return ElevatedButton(
                      onPressed: valid ? submit : null,
                      child: const Text("Continuar"),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
