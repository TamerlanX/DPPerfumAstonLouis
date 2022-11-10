import 'package:dp_perfum/ui/core/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class MonthSelector extends StatefulWidget {

  final Function(DateTime) onChanged;
  const MonthSelector({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<MonthSelector> createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> with UiHelper {

  final _borderColor = const Color(0xFFDCDCDC);
  final _textStyle = const TextStyle(fontSize: 16, color: Colors.black);

  var _selectedDate = DateTime.now();

  String _getMonthName() {
    switch (_selectedDate.month) {
      case 1: return 'Yanvar';
      case 2: return 'Fevral';
      case 3: return 'Mart';
      case 4: return 'Aprel';
      case 5: return 'May';
      case 6: return 'İyun';
      case 7: return 'İyul';
      case 8: return 'Avqust';
      case 9: return 'Sentyabr';
      case 10: return 'Oktyabr';
      case 11: return 'Noyabr';
      case 12: return 'Dekabr';
      default: return 'What??';
    }
  }

  void _chooseDate(BuildContext context) async {
   final res = await DatePicker.showPicker(context,
       locale: LocaleType.az,
       pickerModel: CustomMonthPicker(currentTime: _selectedDate));

   if (res == null) return;
   _selectedDate = res;
   setState(() { });

   widget.onChanged.call(_selectedDate);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _borderColor),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: () => _chooseDate(context),
            child: Row(
              children: [
                Expanded(child: Text(_selectedDate.year.toString(), textAlign: TextAlign.center, style: _textStyle)),
                Container(width: 1, color: _borderColor, height: 50),
                Expanded(child: Text(_getMonthName(), textAlign: TextAlign.center, style: _textStyle))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomMonthPicker extends DatePickerModel {
  CustomMonthPicker({required DateTime currentTime}) :
        super(locale: LocaleType.az,
          minTime: DateTime.now().add(const Duration(days: -30 * 12 * 10)),
          maxTime: DateTime.now(),
          currentTime: currentTime);

  @override
  List<int> layoutProportions() {
    return [1, 1, 0];
  }
}