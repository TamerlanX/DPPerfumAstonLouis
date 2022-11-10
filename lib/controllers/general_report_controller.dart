import 'package:dp_perfum/controllers/base_controller.dart';
import 'package:dp_perfum/models/general/general_report_model.dart';
import 'package:dp_perfum/services/report_service.dart';

class GeneralReportController extends BaseController {
  GeneralReportModel? report;

  getReport({ required DateTime startDate, required DateTime endDate }) async {
    setProgress();
    await ReportService().getGeneralReport(startDate: startDate, endDate: endDate)
        .then((value) => report = value)
        .whenComplete(() => stopProgress())
        .catchError(showException);
  }
}