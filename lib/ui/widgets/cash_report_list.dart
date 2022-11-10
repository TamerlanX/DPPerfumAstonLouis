import 'package:dp_perfum/models/cash_report_item.dart';
import 'package:dp_perfum/services/report_service.dart';
import 'package:dp_perfum/ui/core/ui_values.dart';
import 'package:dp_perfum/ui/report_ui_controller.dart';
import 'package:dp_perfum/ui/widgets/app_button.dart';
import 'package:dp_perfum/ui/widgets/retry_data_indicator.dart';
import 'package:dp_perfum/ui/widgets/text_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ionicons/ionicons.dart';

class CashReportList extends StatefulWidget {

  final ReportUiController controller;
  const CashReportList({Key? key, required this.controller}) : super(key: key);

  @override
  State<CashReportList> createState() => _CashReportListState();
}

class _CashReportListState extends State<CashReportList> {

  static const _pageSize = 20;
  final PagingController<int, CashReportItem> _pagingController = PagingController(firstPageKey: 1);

  _getNextPage(int page) async {
    await Future.delayed(const Duration(milliseconds: 200));
    await ReportService().getCashReport(startDate: widget.controller.startDate, endDate: widget.controller.endDate, page: page).then((newItems) {
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = page + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    }).catchError((e) {
      _pagingController.error = e.message;
    });
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _getNextPage(pageKey);
    });

    widget.controller.onChanged(() {
      _pagingController.refresh();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, CashReportItem>(
      padding: EdgeInsets.zero,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<CashReportItem>(
        itemBuilder: (context, item, index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5
              )
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(item.itemName, textAlign: TextAlign.center, style: const TextStyle(
                color: AppColors.appBlue,
                fontWeight: FontWeight.bold
              )),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: TextWithIcon(
                    icon: Ionicons.time_outline,
                    text: item.initialAmount.toStringAsFixed(2),
                    iconColor: AppColors.colorHintOnWhite,
                  )),
                  Expanded(child: TextWithIcon(
                    icon: Ionicons.arrow_up_outline,
                    text: item.income.toStringAsFixed(2),
                    iconColor: AppColors.colorSuccess,
                  )),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  //const SizedBox(width: 35),
                  Expanded(child: TextWithIcon(
                    icon: Ionicons.arrow_down_outline,
                    text: item.expense.toStringAsFixed(2),
                    iconColor: AppColors.colorError,
                  )),
                  Expanded(child: TextWithIcon(
                    icon: Ionicons.pie_chart_outline,
                    text: item.finalAmount.toStringAsFixed(2),
                  )),
                ],
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
        firstPageErrorIndicatorBuilder: (c) => RetryDataIndicator(_pagingController)
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
