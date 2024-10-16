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

1. two password match
2. phone transformer
3. dropdown
4. checklist
5. option list
6. multi select (array)
7. validation
8. ease pass data to other layer
9. maybe toJson
10. integrate with hook
11. ease dispose
12. default value
13. password obsecure
14. complex validator for report multi error in password
15. maybe step too
16. type safety first

step:

1. try to generate a class using macros depends on fields
