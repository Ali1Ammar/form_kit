import 'package:formly/src/validator/base_required_validator.dart';

import 'localize.dart';

class RequiredValidator extends RequiredStringValidator<Localize> {
  const RequiredValidator();
  @override
  String translate(String localizations) {
    throw "Error";
  }
}
