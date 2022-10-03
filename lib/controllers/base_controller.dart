import 'package:dp_perfum/ui/core/ui_helper.dart';
import 'package:get/get.dart';

abstract class BaseController extends UiHelper {
  var inProgress = false.obs;

  setProgress() {
    inProgress.value = true;
  }

  stopProgress() {
    inProgress.value = false;
  }
}