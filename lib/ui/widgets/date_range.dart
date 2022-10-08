import 'package:dp_perfum/ui/core/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:dp_perfum/utils/app_date_utils.dart';

class DateRange extends StatefulWidget {

  final DateTime? startDate;
  final DateTime? endDate;
  final Function(DateTime?, DateTime?) onDateChange;

  const DateRange({ this.startDate, this.endDate, required this.onDateChange });

  @override
  _DateRangeState createState() => _DateRangeState();
}

class _DateRangeState extends State<DateRange> with UiHelper {

  DateTime? _startDate;
  DateTime? _endDate;

  final _borderColor = const Color(0xFFDCDCDC);
  final _textStyle = const TextStyle(fontSize: 16, color: Colors.black);

  Widget _getButton(BuildContext context, String text, BorderRadius clipRadius, { required Function() onTap }) {

    return Material(
      child: InkWell(onTap: onTap,
          customBorder: RoundedRectangleBorder(borderRadius: clipRadius),
          child: Ink(
              decoration: BoxDecoration(borderRadius: clipRadius, color: Colors.white),
              height: 50,
              child: Center(child: Text(text, textAlign: TextAlign.center, style: _textStyle)))),
    );
  }

  _selectDate(BuildContext context, int index) async {

    final futureDate = DateTime.now().add(const Duration(days: 365));

    final initialDate = (index == 0 ? _startDate : _endDate) ?? DateTime.now();
    final firstDate = index == 0 ? DateTime.now().add(const Duration(days: -120 * 30)) : (_startDate ?? DateTime.now().add(const Duration(days: -120 * 30)));
    final lastDate = index == 0 ? (_endDate ?? futureDate) : futureDate;

    var date = await showDatePicker(context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);
    if (date == null) return;

    if ((index == 0 && _endDate != null) || (index == 1 && _startDate != null)) {

      const maxRange = 60;
      final range = date.difference(index == 0 ? _endDate! : _startDate!).inDays.abs();
      if (range >  maxRange + 1) {
        showErrorSnack('Maks 60 günlük interval seçilə bilər');
        return;
      }
    }

    if (index == 0) {
      _startDate = date;
    } else {
      _endDate = date;
    }

    setState(() {});

    widget.onDateChange.call(_startDate, _endDate);
  }

  @override
  void initState() {
    super.initState();

    _startDate = widget.startDate;
    _endDate = widget.endDate;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Expanded(child: _getButton(context, _startDate?.toDateString() ?? '',
                const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)), onTap: () => _selectDate(context, 0))),
            Container(width: 1, color: _borderColor, height: 50),
            Expanded(child: _getButton(context, _endDate?.toDateString() ?? '',
                const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)), onTap: () => _selectDate(context, 1)))
          ],
        ),
      ),
    );
  }
}