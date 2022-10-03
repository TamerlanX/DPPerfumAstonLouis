import 'general_remainder_report.dart';
import 'general_cash_report.dart';
import 'general_selling_report.dart';
import 'general_contragent_report.dart';

class GeneralReportModel {
  late final GeneralCashReport cashReport;
  late final GeneralContragentReport contragentReport;
  late final GeneralSellingReport sellingReport;
  late final GeneralRemainderReport remainderReport;

  GeneralReportModel.fromJson(Map<String, dynamic> json) {
    cashReport = GeneralCashReport.fromJson(json['cashReport']);
    contragentReport = GeneralContragentReport.fromJson(json['contragentReport']);
    sellingReport = GeneralSellingReport.fromJson(json['sellingReport']);
    remainderReport = GeneralRemainderReport.fromJson(json['remainderReport']);
  }
}