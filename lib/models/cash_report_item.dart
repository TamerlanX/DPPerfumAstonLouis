class CashReportItem {
  late String itemName;
  late double initialAmount;
  late double income;
  late double expense;
  late double finalAmount;

  CashReportItem.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    initialAmount = json['initialAmount'] + 0.0;
    income = json['income'] + 0.0;
    expense = json['expense'] + 0.0;
    finalAmount = json['finalAmount'] + 0.0;
  }
}