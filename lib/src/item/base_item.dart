import 'package:formly/src/form/base_form.dart';
import 'package:formly/src/validator/base_validator.dart';

abstract class BaseFormlyItem<Value, Localize> {
  final BaseFormly<Localize> form;
  final BaseFormlyValidator<Value, Localize> validator;
  Value get value;
  set value(Value value);

  String? validate() => validator.translate(form.getLocalization());
  String? validateUi(dynamic) => validator.translate(form.getLocalization());

  BaseFormlyItem({required this.form, required this.validator});
}
