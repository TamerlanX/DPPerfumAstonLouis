import 'package:dp_perfum/models/remainder_report.dart';
import 'package:dp_perfum/ui/core/ui_values.dart';
import 'package:dp_perfum/ui/widgets/vertical_data_label.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../services/report_service.dart';
import '../report_ui_controller.dart';
import 'group_caption.dart';

class RemainderReportList extends StatefulWidget {
  final ReportUiController controller;
  const RemainderReportList({Key? key, required this.controller}) : super(key: key);

  @override
  State<RemainderReportList> createState() => _RemainderReportListState();
}

class _RemainderReportListState extends State<RemainderReportList> {
  static const _pageSize = 5;
  static const _style = TextStyle(fontWeight: FontWeight.bold, color: AppColors.appBlue);
  final PagingController<int, RemainderReport> _pagingController = PagingController(firstPageKey: 1);

  _getNextPage(int page) async {
    await Future.delayed(const Duration(milliseconds: 200));
    await ReportService().getRemainderReport(startDate: widget.controller.startDate, endDate: widget.controller.endDate, page: page).then((newItems) {
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

  Widget _getBranch(RemainderReport report) {

    List<Widget> items = [
      GroupCaption(text: report.branchName),
      const SizedBox(height: 10)
    ];

    for (var item in report.items) {
      items.add(Text(item.itemName, textAlign: TextAlign.center, style: _style));
      items.add(const SizedBox(height: 5));

      items.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(child: VerticalDataLabel(label: 'Miqdar', value: item.quantity.toStringAsFixed(2))),
                Expanded(child: VerticalDataLabel(label: 'Maya', value: item.cost.toStringAsFixed(2))),
                Expanded(child: VerticalDataLabel(label: 'Pərakəndə', value: item.retail.toStringAsFixed(2))),
                Expanded(child: VerticalDataLabel(label: 'Topdan', value: item.wholesale.toStringAsFixed(2)))
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 1,
              color: Colors.grey.withOpacity(0.3),
            )
          ],
        ),
      ));
      items.add(const SizedBox(height: 15));
    }

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: items
        )
    );
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
    return PagedListView<int, RemainderReport>(
      padding: EdgeInsets.zero,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<RemainderReport>(
        itemBuilder: (context, item, index) => _getBranch(item),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
