import '../contragent_report.dart';

class GeneralContragentReport {
  late double totalInitial;
  late double totalIncome;
  late double totalExpense;
  late double totalFinal;
  final List<ContragentReportItem> items = [];

  GeneralContragentReport.fromJson(Map<String, dynamic> json) {
    totalInitial = json['totalInitial'] + 0.0;
    totalIncome = json['totalIncome'] + 0.0;
    totalExpense = json['totalExpense'] + 0.0;
    totalFinal = json['totalFinal'] + 0.0;
    if (json['items'] != null) {
      items.addAll((json['items'] as List<dynamic>).map((e) => ContragentReportItem.fromJson(e)));
    }
  }
}
