import 'package:dp_perfum/ui/core/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppScaffold extends StatelessWidget {

  final Widget? body;
  final Widget? floatingActionButton;
  final Drawer? drawer;
  final String title;
  final String? subTitle;
  final EdgeInsets contentPadding;
  final bool showBack;
  final bool resizeToAvoidBottomInset;
  final Widget? actionButton;

  const AppScaffold({Key? key,
    required this.title,
    this.subTitle,
    this.body,
    this.floatingActionButton,
    this.drawer,
    this.showBack = true,
    this.resizeToAvoidBottomInset = true,
    this.contentPadding = const EdgeInsets.only(left: 15, top: 10, right: 15),
    this.actionButton
  }) : super(key: key);

  Widget _getTop(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      color: Colors.transparent,
      child: SafeArea(
        bottom: false,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              if (drawer != null)
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton(icon: const Icon(Icons.menu, color: Colors.white), onPressed: () {
                    Scaffold.of(context).openDrawer();
                  }),
                ),
              if (showBack)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.white)),
                ),
              Expanded(child: Text(title, style: const TextStyle(fontSize: 25, color: Colors.white))),
              if (actionButton != null)
                actionButton!,
              if (actionButton != null)
                const SizedBox(width: 10)
            ],
          ),
          if (subTitle != null) Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(subTitle!, style: const TextStyle(fontSize: 14, color: Colors.white)),
          )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    const radius = 20.0;

    return Container(height: 150, decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              AppColors.appBlue,
              AppColors.appBlueLight
            ]
        )),
      child: Scaffold(
        drawer: drawer,
        floatingActionButton: floatingActionButton,
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: Builder(
            builder: (scaffoldContext) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _getTop(scaffoldContext),
                  if (body != null) Expanded(child: Container(
                      padding: contentPadding,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(radius), topRight: Radius.circular(radius))
                      ),
                      child: SafeArea(top: false,
                          child: ClipRRect(
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(radius), topRight: Radius.circular(radius)),
                              child: body!))))
                ],
              );
            }
        ),
      ),
    );
  }
}