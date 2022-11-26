import '../model/report.dart';

class ReportService {
  final String origin;

  const ReportService(this.origin);

  Future<List<Report>> myReports() async {
    return [];
  }

  Future<void> sendReport(Report report) async {
    
  }
}
