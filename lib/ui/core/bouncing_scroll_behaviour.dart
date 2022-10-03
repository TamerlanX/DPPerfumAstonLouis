import 'package:flutter/material.dart';

class BouncingScrollBehaviour extends ScrollBehavior {

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}