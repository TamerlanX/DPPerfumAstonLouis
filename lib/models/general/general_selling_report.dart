import 'package:dp_perfum/models/selling_report.dart';

class GeneralSellingReport {
  late double totalQuantity;
  late double totalCashFlow;
  late double totalProfit;
  final List<SellingReportItem> items = [];

  GeneralSellingReport.fromJson(Map<String, dynamic> json) {
    totalQuantity = json['totalQuantity'] + 0.0;
    totalCashFlow = json['totalCashFlow'] + 0.0;
    totalProfit = json['totalProfit'] + 0.0;
    if (json['items'] != null) {
      items.addAll((json['items'] as List<dynamic>).map((e) => SellingReportItem.fromJson(e)));
    }
  }
}
