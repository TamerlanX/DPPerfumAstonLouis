import 'package:dp_perfum/models/selling_report.dart';
import 'package:dp_perfum/services/report_service.dart';
import 'package:dp_perfum/ui/core/ui_values.dart';
import 'package:dp_perfum/ui/report_ui_controller.dart';
import 'package:dp_perfum/ui/widgets/group_caption.dart';
import 'package:dp_perfum/ui/widgets/report_label.dart';
import 'package:dp_perfum/ui/widgets/vertical_data_label.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SellingReportList extends StatefulWidget {

  final ReportUiController controller;
  const SellingReportList({Key? key, required this.controller}) : super(key: key);

  @override
  State<SellingReportList> createState() => _SellingReportListState();
}

class _SellingReportListState extends State<SellingReportList> {

  static const _pageSize = 5;
  final PagingController<int, SellingReport> _pagingController = PagingController(firstPageKey: 1);

  _getNextPage(int page) async {
    await Future.delayed(const Duration(milliseconds: 200));
    await ReportService().getSellingReport(startDate: widget.controller.startDate, endDate: widget.controller.endDate, page: page).then((newItems) {
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

  Widget _getBranch(SellingReport report) {
    
    List<Widget> items = [
      GroupCaption(text: report.branchName),
      const SizedBox(height: 10)
    ];
    
    for (var group in report.groups) { 
      items.add(Text(group.groupName, textAlign: TextAlign.center, style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.appBlue
      )));

      items.add(const SizedBox(height: 5));
      
      for (var item in group.items) { 
        items.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('${item.itemName} (${item.unitName})'),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(child: VerticalDataLabel(label: 'Miqdar', value: item.quantity.toStringAsFixed(2))),
                  Expanded(child: VerticalDataLabel(label: 'Dövriyyə', value: item.cashFlow.toStringAsFixed(2))),
                  Expanded(child: VerticalDataLabel(label: 'Mənfəət', value: item.profit.toStringAsFixed(2)))
                ],
              )
            ],
          ),
        ));
        items.add(Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 1,
          color: Colors.grey.withOpacity(0.3),
        ));
      }

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
    return PagedListView<int, SellingReport>(
      padding: EdgeInsets.zero,
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<SellingReport>(
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
