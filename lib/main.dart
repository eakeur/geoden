import 'package:flutter/material.dart';
import 'package:geoden/src/report/report_controller.dart';
import 'package:geoden/src/report/report_service.dart';

import 'src/app.dart';

void main() async {
  final reportController = ReportController(const ReportService(""));

  runApp(MyApp(reportController: reportController));
}
