import 'package:dp_perfum/models/cash_report_item.dart';
import 'package:dp_perfum/models/general/general_report_model.dart';
import 'package:dp_perfum/services/base_http_service.dart';
import 'package:dp_perfum/utils/app_date_utils.dart';

class ReportService extends BaseHttpService {
  Future<GeneralReportModel> getGeneralReport() async {
    final json = await post('common_report', null);
    return GeneralReportModel.fromJson(json);
  }

  Future<List<CashReportItem>> getCashReport({ required DateTime startDate, required DateTime endDate, int page = 1 }) async {
    final params = { 'startDate': startDate.toDateString(), 'endDate': endDate.toDateString(), 'page': page.toString() };
    final json = await get('cash_report', params: params);
    return (json as List<dynamic>).map((e) => CashReportItem.fromJson(e)).toList();
  }
}