class ProfitLossReportItem {
  late final String itemName;
  late final double amount;

  ProfitLossReportItem.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    amount = json['amount'] + 0.0;
  }
}

class ProfitLossReportGroup {
  late final double totalAmount;
  late final List<ProfitLossReportItem> items = [];

  ProfitLossReportGroup.fromJson(Map<String, dynamic> json) {
    totalAmount = json['totalAmount'] + 0.0;
    if (json['items'] != null) {
      items.addAll((json['items'] as List<dynamic>).map((e) => ProfitLossReportItem.fromJson(e)));
    }
  }
}

class ProfitLossReport {
  late final ProfitLossReportGroup incomeStats;
  late final ProfitLossReportGroup expanseStats;

  double get profitLossRatio => incomeStats.totalAmount - expanseStats.totalAmount;

  ProfitLossReport.fromJson(Map<String, dynamic> json) {
    incomeStats = ProfitLossReportGroup.fromJson(json['incomeStats']);
    expanseStats = ProfitLossReportGroup.fromJson(json['expanseStats']);
  }

  static ProfitLossReport dumb() {
    return ProfitLossReport.fromJson({
      "incomeStats": {
        "items": [
          {
            "itemName": "Gömrük xərcləri",
            "amount": 12.49
          },
          {
            "itemName": "Təmir rikinti",
            "amount": 30.47
          }
        ],
        "totalAmount": 100
      },
      "expanseStats": {
        "items": [
          {
            "itemName": "Gömrük xərcləri",
            "amount": 12.49
          },
          {
            "itemName": "Təmir rikinti",
            "amount": 30.47
          }
        ],
        "totalAmount": 100
      }
    });
  }
}