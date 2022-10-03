class GeneralSellingReport {
  late double totalQuantity;
  late double totalCashFlow;
  late double totalProfit;
  final List<GeneralSellingReportItem> items = [];

  GeneralSellingReport.fromJson(Map<String, dynamic> json) {
    totalQuantity = json['totalQuantity'] + 0.0;
    totalCashFlow = json['totalCashFlow'] + 0.0;
    totalProfit = json['totalProfit'] + 0.0;
    if (json['items'] != null) {
      items.addAll((json['items'] as List<dynamic>).map((e) => GeneralSellingReportItem.fromJson(e)));
    }
  }
}


class GeneralSellingReportItem {
  late String itemName;
  late double quantity;
  late double cashFlow;
  late double profit;

  GeneralSellingReportItem.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    quantity = json['quantity'] + 0.0;
    cashFlow = json['cashFlow'] + 0.0;
    profit = json['profit'] + 0.0;
  }
}
