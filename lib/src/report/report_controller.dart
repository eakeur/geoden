import 'package:flutter/material.dart';
import 'package:geoden/src/model/location.dart';
import 'package:geoden/src/model/report.dart';
import 'package:geoden/src/model/reporter.dart';

import 'report_service.dart';

class ReportController {
  final ReportService _reportService;

  final GlobalKey<FormState> reporterForm, locationForm;

  late Report _report;

  ReportController(this._reportService)
      : _report = const Report(
          reporter: Reporter(
            birthDate: "",
            cpf: "",
            fullName: "",
            email: "",
          ),
          location: Location(
            city: "",
            state: "",
            region: "",
          ),
        ),
        reporterForm = GlobalKey<FormState>(),
        locationForm = GlobalKey<FormState>();

  bool get isReporterFormValid =>
      reporterForm.currentState != null &&
      reporterForm.currentState!.validate();

  bool get isLocationFormValid =>
      locationForm.currentState != null &&
      locationForm.currentState!.validate();

  Report get report => _report;
  set report(Report rep) {
    if (rep == _report) return;
    _report = rep;
  }

  Reporter get reporter => _report.reporter;
  set reporter(Reporter rep) {
    if (rep == _report.reporter) return;
    report = _report.copyWith(reporter: rep);
  }

  Location get location => _report.location;
  set location(Location loc) {
    if (loc == _report.location) return;
    report = _report.copyWith(location: loc);
  }

  Future<void> send() async {
    return _reportService.sendReport(_report);
  }
}
