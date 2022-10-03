class GeneralContragentReport {
  late double totalInitial;
  late double totalIncome;
  late double totalExpense;
  late double totalFinal;
  final List<GeneralContragentReportItem> items = [];

  GeneralContragentReport.fromJson(Map<String, dynamic> json) {
    totalInitial = json['totalInitial'] + 0.0;
    totalIncome = json['totalIncome'] + 0.0;
    totalExpense = json['totalExpense'] + 0.0;
    totalFinal = json['totalFinal'] + 0.0;
    if (json['items'] != null) {
      items.addAll((json['items'] as List<dynamic>).map((e) => GeneralContragentReportItem.fromJson(e)));
    }
  }
}


class GeneralContragentReportItem {
  late String contragentName;
  late double initialDebt;
  late double increasedDebt;
  late double decreasedDebt;
  late double finalDebt;

  GeneralContragentReportItem.fromJson(Map<String, dynamic> json) {
    contragentName = json['contragentName'];
    initialDebt = json['initialDebt'] + 0.0;
    increasedDebt = json['increasedDebt'] + 0.0;
    decreasedDebt = json['decreasedDebt'] + 0.0;
    finalDebt = json['finalDebt'] + 0.0;
  }
}
