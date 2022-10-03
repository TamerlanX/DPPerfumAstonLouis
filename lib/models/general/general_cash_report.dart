class GeneralCashReport {
  late double totalInitial;
  late double totalIncome;
  late double totalExpense;
  late double totalFinal;
  final List<GeneralCashReportItem> items = [];

  GeneralCashReport.fromJson(Map<String, dynamic> json) {
    totalInitial = json['totalInitial'] + 0.0;
    totalIncome = json['totalIncome'] + 0.0;
    totalExpense = json['totalExpense'] + 0.0;
    totalFinal = json['totalFinal'] + 0.0;
    if (json['items'] != null) {
      items.addAll((json['items'] as List<dynamic>).map((e) => GeneralCashReportItem.fromJson(e)));
    }
  }
}

class GeneralCashReportItem {
  late String itemName;
  late double initialAmount;
  late double income;
  late double expense;
  late double finalAmount;

  GeneralCashReportItem.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    initialAmount = json['initialAmount'] + 0.0;
    income = json['income'] + 0.0;
    expense = json['expense'] + 0.0;
    finalAmount = json['finalAmount'] + 0.0;
  }
}