class GeneralRemainderReport {
  late double totalQuantity;
  late double totalCost;
  late double totalWholesale;
  late double totalRetail;
  final List<GeneralRemainderReportItem> items = [];

  GeneralRemainderReport.fromJson(Map<String, dynamic> json) {
    totalQuantity = json['totalQuantity'] + 0.0;
    totalCost = json['totalCost'] + 0.0;
    totalWholesale = json['totalWholesale'] + 0.0;
    totalRetail = json['totalRetail'] + 0.0;
    if (json['items'] != null) {
      items.addAll((json['items'] as List<dynamic>).map((e) => GeneralRemainderReportItem.fromJson(e)));
    }
  }
}


class GeneralRemainderReportItem {
  late String warehouse;
  late double quantity;
  late double cost;
  late double wholesale;
  late double retail;
  GeneralRemainderReportItem.fromJson(Map<String, dynamic> json) {
    warehouse = json['warehouse'];
    quantity = json['quantity'] + 0.0;
    cost = json['cost'] + 0.0;
    wholesale = json['wholesale'] + 0.0;
    retail = json['retail'] + 0.0;
  }
}
