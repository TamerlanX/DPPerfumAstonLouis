import 'package:dp_perfum/services/http_error.dart';
import 'package:dp_perfum/ui/core/ui_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/route_manager.dart';

class UiHelper
{
  static SnackbarController? _snackController;

  hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  showErrorSnack(String message) {

    _snackController = Get.snackbar('Xəta', message,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(milliseconds: 3000),
        backgroundColor: AppColors.colorError,
        colorText: Colors.white,
        titleText: const Text('Xəta',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10)
    );
  }

  showException(dynamic e) {

    String message = '';

    if (e is HttpError) {
      message = e.message;
    }
    else {
      message = e.toString();
    }

    showErrorSnack(message);
  }

  void showLoading() {
    hideKeyboard();
    if (Get.isSnackbarOpen && _snackController != null) {
      _snackController?.close(withAnimations: false);
      _snackController = null;
    }

    Get.dialog(
        WillPopScope(
          onWillPop: () async { return false; },
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(0),
            child: Container(
              //color: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const SpinKitDualRing(
                  color: Colors.white,
                  //duration: Duration(milliseconds: 700),
                  lineWidth: 3,
                  size: 50.0,
                )
            ),
          ),
        ),
        barrierDismissible: false);
  }

  void hideLoading() {
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();
    Get.back();
  }

  Future showSimpleBottomDialog(BuildContext context, String title, Widget? child) async {

    final lblTitle = Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(color: Colors.grey[200],
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)));


    await showModalBottomSheet(context: context, shape: const RoundedRectangleBorder(borderRadius:
    BorderRadius.only(topRight: Radius.circular(20),
        topLeft: Radius.circular(20))),
        builder: (c) => SafeArea(child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            lblTitle,
            SingleChildScrollView(child: child),
          ],
        )));
  }
}