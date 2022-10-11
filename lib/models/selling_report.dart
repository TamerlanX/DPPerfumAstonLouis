class SellingReport {
  late String branchName;
  final List<SellingReportGroup> groups = [];

  SellingReport.fromJson(Map<String, dynamic> json) {
    branchName = json['branchName'];
    if (json['groups'] != null) {
      groups.addAll((json['groups'] as List<dynamic>).map((e) => SellingReportGroup.fromJson(e)));
    }
  }
}

class SellingReportGroup {
  late String groupName;
  final List<SellingReportItem> items = [];

  SellingReportGroup.fromJson(Map<String, dynamic> json) {
    groupName = json['groupName'];
    if (json['items'] != null) {
      items.addAll((json['items'] as List<dynamic>).map((e) => SellingReportItem.fromJson(e)));
    }
  }
}

class SellingReportItem {
  late String itemName;
  late String unitName;
  late double quantity;
  late double cashFlow;
  late double profit;

  SellingReportItem.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    unitName = json['unitName'] ?? '';
    quantity = json['quantity'] + 0.0;
    cashFlow = json['cashFlow'] + 0.0;
    profit = json['profit'] + 0.0;
  }
}