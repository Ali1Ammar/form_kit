import 'package:formly/formly.dart';

import 'localize.dart';

class RequiredValidator extends RequiredStringValidator<Localize> {
  const RequiredValidator();
  @override
  String translate(String localizations) {
    return "Error";
  }
}
