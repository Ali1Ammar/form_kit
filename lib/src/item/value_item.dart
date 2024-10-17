import 'package:flutter/material.dart';
import 'package:formly/src/item/base_item.dart';

class ValueItem<Value, Localize> extends BaseFormlyItem<Value, Localize> {
  late ValueNotifier<Value> controller;
  @override
  Value get value => controller.value;
  @override
  set value(Value value) => controller.value = value;

  void dispose() => controller.dispose();
  ValueItem(
      {ValueNotifier<Value>? controller,
      required Value value,
      required super.validator,
      required super.form})
      : controller = controller ?? ValueNotifier<Value>(value);
}
