import 'package:formly/src/pure/validator/base_validator.dart';

abstract class RequiredStringValidator<Localize>
    extends BaseFormlyValidator<String, Localize> {
  const RequiredStringValidator();
  @override
  bool validateExpression(String? value) {
    return value != null && value.isNotEmpty;
  }
}
