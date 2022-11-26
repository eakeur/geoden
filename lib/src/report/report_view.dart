import 'package:flutter/material.dart';
import 'package:geoden/src/core/themes.dart';
import 'package:geoden/src/report/report_controller.dart';
import 'package:geoden/src/report/widgets/location_form.dart';
import 'package:geoden/src/report/widgets/reporter_form.dart';

class ReportView extends StatefulWidget {
  final ReportController controller;

  static const routeName = "/report";

  const ReportView({required this.controller, super.key});

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  final pages = PageController();

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
        body: PageView(
          controller: pages,
          children: [
            ReporterForm(
              controller: widget.controller,
              onSubmit: next,
            ),
            LocationForm(
              onBack: previous,
              onSubmit: next,
            ),
          ],
        ),
      ),
    );
  }
}
