import 'package:formly/src/pure/form/base_form.dart';
import 'package:formly/src/pure/validator/base_validator.dart';

abstract class BaseFormlyItem<Value, Localize> {
  final BaseFormly<Localize> form;
  final BaseFormlyValidator<Value, Localize> validator;
  Value get value;
  set value(Value value);

  String? validate() =>
      validator.validate(value)?.translate(form.getLocalization());
  String? validateUi(value) {
    return validate();
  }

  BaseFormlyItem({required this.form, required this.validator});
}
