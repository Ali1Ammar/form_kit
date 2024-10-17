abstract class BaseFormlyValidator<Value, Localize> {
  const BaseFormlyValidator();
  //what we will do with AppLocalizations
  String translate(Localize localizations);

  bool validateExpression(Value value);

  BaseFormlyValidator<Value, Localize>? validate(Value value) {
    if (validateExpression(value)) {
      return null;
    }
    return this;
  }
}
