import 'package:dp_perfum/models/general/general_report_model.dart';
import 'package:dp_perfum/services/base_http_service.dart';

class ReportService extends BaseHttpService {
  Future<GeneralReportModel> getGeneralReport() async {
    final json = await post('common_report', null);
    return GeneralReportModel.fromJson(json);
  }
}