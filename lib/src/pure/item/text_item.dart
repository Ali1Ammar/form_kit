import 'package:flutter/material.dart';
import 'package:formly/src/pure/item/base_item.dart';

class TextItem<Localize> extends BaseFormlyItem<String, Localize> {
  late TextEditingController controller;

  @override
  String get value => controller.text;
  @override
  set value(String value) => controller.text = value;

  void dispose() => controller.dispose();
  TextItem(
      {TextEditingController? controller,
      String? value,
      required super.validator,
      required super.form})
      : controller = controller ?? TextEditingController(text: value);
}
