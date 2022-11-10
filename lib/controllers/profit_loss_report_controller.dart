import 'package:dp_perfum/controllers/base_controller.dart';
import 'package:dp_perfum/models/profit_loss_report.dart';
import 'package:dp_perfum/services/report_service.dart';

class ProfitLossReportController extends BaseController {
  ProfitLossReport? report;

  getReport({ required DateTime date }) async {
    setProgress();
    await ReportService().getProfitLossReport(date: date)
        .then((value) => report = value)
        .whenComplete(() => stopProgress())
        .catchError(showException);
  }
}