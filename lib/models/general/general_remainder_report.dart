import '../remainder_report.dart';

class GeneralRemainderReport {
  late double totalQuantity;
  late double totalCost;
  late double totalWholesale;
  late double totalRetail;
  final List<RemainderReportItem> items = [];

  GeneralRemainderReport.fromJson(Map<String, dynamic> json) {
    totalQuantity = json['totalQuantity'] + 0.0;
    totalCost = json['totalCost'] + 0.0;
    totalWholesale = json['totalWholesale'] + 0.0;
    totalRetail = json['totalRetail'] + 0.0;
    if (json['items'] != null) {
      items.addAll((json['items'] as List<dynamic>).map((e) => RemainderReportItem.fromJson(e)));
    }
  }
}
