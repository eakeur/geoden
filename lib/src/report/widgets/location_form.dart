import 'package:flutter/material.dart';

class LocationForm extends StatelessWidget {
  final VoidCallback onBack, onSubmit;

  const LocationForm({
    required this.onSubmit,
    required this.onBack,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const Spacer(),
          Padding(
            padding:
                const EdgeInsets.only(left: 60, right: 60, bottom: 25, top: 25),
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: onBack,
                    child: const Text("Voltar"),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onSubmit,
                    child: const Text("Continuar"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
