import 'package:flutter/material.dart';
import 'package:geoden/src/core/themes.dart';
import 'package:geoden/src/report/report_controller.dart';
import 'package:geoden/src/report/widgets/location_form.dart';
import 'package:geoden/src/report/widgets/reporter_form.dart';
import 'package:provider/provider.dart';

class ReportView extends StatefulWidget {
  final ReportController controller;

  static const routeName = "/report";

  const ReportView({required this.controller, super.key});

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  final pages = PageController();

  ReportController get reports => widget.controller;

  void next() {
    pages.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void previous() {
    pages.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void submit() {
    final formState = reports.reporterForm.currentState;
    if (formState == null || !formState.validate()) return;
    formState.save();
    next();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: fireThemeData(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Form(
                key: widget.controller.reporterForm,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pages,
                  children: [
                    ReporterForm(controller: widget.controller),
                    LocationForm(controller: widget.controller),
                  ],
                ),
              ),
            ),
            ChangeNotifierProvider(
              create: (ctx) => pages,
              builder: (context, _) {
                return Consumer<PageController>(
                  builder: (context, pages, _) {
                    final actual = pages.page ?? 0.0;
                    final initial = actual == 0.0;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (!initial)
                          IconButton(
                            onPressed: previous,
                            icon: const Icon(Icons.arrow_back),
                          ),
                        if (!initial) const Text("Voltar"),
                        const Spacer(),
                        const Text("Continuar"),
                        IconButton(
                          onPressed: submit,
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
