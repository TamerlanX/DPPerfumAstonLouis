import 'package:dp_perfum/models/cash_report_item.dart';

class GeneralCashReport {
  late double totalInitial;
  late double totalIncome;
  late double totalExpense;
  late double totalFinal;
  final List<CashReportItem> items = [];

  GeneralCashReport.fromJson(Map<String, dynamic> json) {
    totalInitial = json['totalInitial'] + 0.0;
    totalIncome = json['totalIncome'] + 0.0;
    totalExpense = json['totalExpense'] + 0.0;
    totalFinal = json['totalFinal'] + 0.0;
    if (json['items'] != null) {
      items.addAll((json['items'] as List<dynamic>).map((e) => CashReportItem.fromJson(e)));
    }
  }
}