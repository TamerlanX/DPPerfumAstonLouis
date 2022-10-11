class ContragentReport {
  late String groupName;
  final List<ContragentReportItem> items = [];

  ContragentReport.fromJson(Map<String, dynamic> json) {
    groupName = json['groupName'];

    if (json['items'] != null) {
      items.addAll((json['items'] as List<dynamic>).map((e) => ContragentReportItem.fromJson(e)));
    }
  }
}

class ContragentReportItem {
  late String contragentName;
  late double initialDebt;
  late double increasedDebt;
  late double decreasedDebt;
  late double finalDebt;

  ContragentReportItem.fromJson(Map<String, dynamic> json) {
    contragentName = json['contragentName'];
    initialDebt = json['initialDebt'] + 0.0;
    increasedDebt = json['increasedDebt'] + 0.0;
    decreasedDebt = json['decreasedDebt'] + 0.0;
    finalDebt = json['finalDebt'] + 0.0;
  }
}