# lets build form package (draft) (wip)

**user will write somethings like this**

```dart
// should use marcos
@RiverForm()
class NameForm {
  @StringItem<String>() // this may be optional and take it from datatype
  external String name();

  @PhoneTransformer<String>()
  @PasswordValidator()
  @PhoneValidator()
  external String phone();

  @PasswordValidator()
  external String password();

  @EqualField(#password) // password and confirmPassword should be equal
  external String confirmPassword();
}
```

then he should use it like this

```dart
class MyWidget extends HookWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final form = useForm(NameForm());

    return Form(
      key: form.key,
      child: Column(
        children: [
          TextFormField(
            controller: form.name.controller,
            validator: form.name.validator,
          ),
          RiverText(form.name),
          form.name.build(),
          TextButton(
            child: const Text("data"),
            onPressed: () {
              if (!form.validate()) {
                return;
              }
              final result = form.result;
              result.name;
              result.phone;....
            },
          )
        ],
      ),
    );
  }
}
```

usecase:

Phase 1:

1. type safety first ✓
2. dropdown ✓
3. checklist ✓
4. option list ✓
5. validation ✓

6. ease dispose ✓
7. default value ✓

Phase 2:

1. two password match
2. multi select (array)
3. ease pass data to other layer
4. password obsecure
5. complex validator for report multi error in password
6. maybe step too
7. integrate with hook
8. phone transformer

Phase 3:

1. marcos or code generation
2. toJson or model
3. ease widget builder
