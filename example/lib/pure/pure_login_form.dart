import 'package:formly/src/form/base_form.dart';
import 'package:formly/src/item/text_item.dart';

import '../validator/localize.dart';
import '../validator/required_validator.dart';

class PureLoginForm extends BaseFormly<Localize> {
  late final TextItem mail =
      TextItem(validator: const RequiredValidator(), form: this);

  late final TextItem phone =
      TextItem(validator: const RequiredValidator(), form: this);

  @override
  void dispose() {
    mail.dispose();
  }
}
