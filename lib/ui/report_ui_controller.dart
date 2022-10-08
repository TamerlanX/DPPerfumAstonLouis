class ReportUiController {

  Function()? _onChanged;
  DateTime _startDate = DateTime.now().add(const Duration(days: -30));
  DateTime _endDate = DateTime.now();

  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;

  set startDate(DateTime st) {
    _startDate = st;
    _onChanged?.call();
  }

  set endDate(DateTime ed) {
    _endDate = ed;
    _onChanged?.call();
  }

  void onChanged(Function() callBack) {
    _onChanged = callBack;
  }
}