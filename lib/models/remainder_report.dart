class RemainderReport {
  late String branchName;
  final List<RemainderReportItem> items = [];

  RemainderReport.fromJson(Map<String, dynamic> json) {
    branchName = json['branchName'];

    if (json['items'] != null) {
      items.addAll((json['items'] as List<dynamic>).map((e) => RemainderReportItem.fromJson(e)));
    }
  }
}

class RemainderReportItem {
  late String itemName;
  late double quantity;
  late double cost;
  late double wholesale;
  late double retail;
  RemainderReportItem.fromJson(Map<String, dynamic> json) {
    itemName = json['warehouse'] ?? json['itemName'];
    quantity = json['quantity'] + 0.0;
    cost = json['cost'] + 0.0;
    wholesale = json['wholesale'] + 0.0;
    retail = json['retail'] + 0.0;
  }
}