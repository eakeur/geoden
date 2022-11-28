import 'package:flutter/material.dart';
import 'package:geoden/src/model/location.dart';
import 'package:geoden/src/report/report_controller.dart';

class LocationForm extends StatelessWidget {
  final ReportController controller;

  const LocationForm({required this.controller, super.key});

  Location get location => controller.location;

  void submit(Location l) {
    controller.location = l;
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
                      ?.copyWith(fontSize: 28, color: Colors.orange[900]),
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
            initialValue: location.city,
            style: const TextStyle(fontSize: 20),
            onSaved: (c) => submit(location.copyWith(city: c)),
            validator: (s) => s!.length <= 3 ? "ai caraio" : null,
            decoration: const InputDecoration(
              label: Text("Cidade"),
            ),
          ),
        ],
      ),
    );
  }
}
