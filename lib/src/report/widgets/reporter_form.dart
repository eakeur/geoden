import 'package:flutter/material.dart';
import 'package:geoden/src/model/reporter.dart';
import 'package:geoden/src/report/report_controller.dart';

class ReporterForm extends StatelessWidget {
  final ReportController controller;

  const ReporterForm({
    required this.controller,
    super.key,
  });

  Reporter get reporter => controller.reporter;

  void submit(Reporter r) {
    controller.reporter = r;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 45,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SUAS INFORMAÇÕES",
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
                      ?.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          TextFormField(
            initialValue: reporter.fullName,
            style: const TextStyle(fontSize: 20),
            onSaved: (n) => submit(reporter.copyWith(fullName: n)),
            decoration: const InputDecoration(
              label: Text("Nome completo"),
            ),
          ),
          TextFormField(
            initialValue: reporter.cpf,
            style: const TextStyle(fontSize: 20),
            onSaved: (cpf) => submit(reporter.copyWith(cpf: cpf)),
            decoration: const InputDecoration(
              label: Text("CPF"),
            ),
            validator: Reporter.validateCPF,
          ),
          TextFormField(
            initialValue: reporter.email,
            style: const TextStyle(fontSize: 20),
            onSaved: (e) => submit(reporter.copyWith(email: e)),
            decoration: const InputDecoration(
              label: Text("E-mail"),
            ),
          ),
          TextFormField(
            initialValue: reporter.birthDate,
            style: const TextStyle(fontSize: 20),
            onSaved: (b) => submit(reporter.copyWith(birthDate: b)),
            decoration: const InputDecoration(
              label: Text("Data de nascimento"),
            ),
          ),
        ],
      ),
    );
  }
}
