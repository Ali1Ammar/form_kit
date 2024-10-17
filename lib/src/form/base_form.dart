import 'package:flutter/widgets.dart';

abstract class BaseFormly<Localize> {
  late Localize Function() getLocalization;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  bool validate() {
    return key.currentState!.validate();
  }

  void dispose();
}
