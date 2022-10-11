import 'package:dp_perfum/models/cash_report_item.dart';
import 'package:dp_perfum/models/contragent_report.dart';
import 'package:dp_perfum/models/general/general_report_model.dart';
import 'package:dp_perfum/models/remainder_report.dart';
import 'package:dp_perfum/models/selling_report.dart';
import 'package:dp_perfum/services/base_http_service.dart';
import 'package:dp_perfum/utils/app_date_utils.dart';

class ReportService extends BaseHttpService {
  Future<GeneralReportModel> getGeneralReport() async {
    final json = await get('common_report');
    return GeneralReportModel.fromJson(json);
  }

  Future<List<CashReportItem>> getCashReport({ required DateTime startDate, required DateTime endDate, int page = 1 }) async {
    final params = { 'startDate': startDate.toDateString(), 'endDate': endDate.toDateString(), 'page': page.toString() };
    final json = await get('cash_report', params: params);
    return (json as List<dynamic>).map((e) => CashReportItem.fromJson(e)).toList();
  }

  Future<List<SellingReport>> getSellingReport({ required DateTime startDate, required DateTime endDate, int page = 1 }) async {
    final params = { 'startDate': startDate.toDateString(), 'endDate': endDate.toDateString(), 'page': page.toString() };
    final json = await get('selling_report', params: params);
    return (json as List<dynamic>).map((e) => SellingReport.fromJson(e)).toList();
  }

  Future<List<RemainderReport>> getRemainderReport({ required DateTime startDate, required DateTime endDate, int page = 1 }) async {
    final params = { 'startDate': startDate.toDateString(), 'endDate': endDate.toDateString(), 'page': page.toString() };
    final json = await get('reminder_report', params: params);
    return (json as List<dynamic>).map((e) => RemainderReport.fromJson(e)).toList();
  }

  Future<List<ContragentReport>> getContragentReport({ required DateTime startDate, required DateTime endDate, int page = 1 }) async {
    final params = { 'startDate': startDate.toDateString(), 'endDate': endDate.toDateString(), 'page': page.toString() };
    final json = await get('customer_report', params: params);
    return (json as List<dynamic>).map((e) => ContragentReport.fromJson(e)).toList();
  }
}