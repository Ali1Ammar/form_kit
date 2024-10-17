// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:starter/localization/localization.dart';
// // ignore: implementation_imports

// class MyWidget extends HookWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final form = useForm(NameForm());

//     return Form(
//       key: form.key,
//       child: Column(
//         children: [
//           TextFormField(
//             controller: form.name.controller,
//             validator: form.name.validator,
//           ) ,
//           // or
//           RiverText(form.name),
//           // or
//           form.name.build(),

//           TextButton(
//             child: const Text("data"),
//             onPressed: () {
//               if (!form.validate()) {
//                 return;
//               }
//               final result = form.result;
//               result.name;
//               result.phone;....
//             },
//           )
//         ],
//       ),
//     );
//   }
// }

// class BaseFormItem<T> {
//   final T? defaultValue;
//   const BaseFormItem({this.defaultValue});
// }

// class BaseFormTransformer<T> {
//   const BaseFormTransformer();
//   T? transform(T? value) {
//     return value;
//   }
// }

// class BaseFormValidator<T> {
//   const BaseFormValidator();
// }

// class RiverForm {
//   const RiverForm();
// }

// @RiverForm()
// class NameForm {
//   @BaseFormItem<String>()
//   external String name();

//   @BaseFormItem<String>()
//   @BaseFormTransformer<String>()
//   @BaseFormValidator()
//   @BaseFormValidator()
//   external String phone();

//   @BaseFormItem<String>()
//   @BaseFormValidator()
//   @BaseFormValidator()
//   external String password();
// }

// abstract class ValidatorFailure<T> {
//   const ValidatorFailure();
//   String translate(AppLocalizations localizations);

//   bool _validateExpression(T value);

//   ValidatorFailure<T>? validate(T value) {
//     if (mergeList.any((element) => element.validate(value) != null)) {
//       return this;
//     }
//     if (_validateExpression(value)) {
//       return null;
//     }
//     return this;
//   }

//   List<ValidatorFailure<T>> get mergeList => [];
// }

// abstract class FormItem<T> {
//   FormItem({
//     required this.validate,
//   });
//   T get value;
//   set value(T value);
//   final ValidatorFailure<T>? validate;
//   String? Function(T?) validateString(AppLocalizations appLocalizations) {
//     return (_) => validate?.validate(value)?.translate(appLocalizations);
//   }

//   bool validateBool() {
//     return validate?.validate(value) == null;
//   }

//   void dispose();
// }

// // ignore: invalid_use_of_internal_member
// mixin FormController {
//   void init(Ref ref) {
//     ref.onDispose(dispose);
//   }

//   List<FormItem<dynamic>> formItems = [];
//   final ff = StringFormItem.new;

//   StringFormItem stringFormItem({
//     ValidatorFailure<String>? validate,
//     List<TextInputFormatter>? inputFormatters,
//     String value = '',
//   }) {
//     final item = StringFormItem(
//       validate: validate,
//       value: value,
//       inputFormatters: inputFormatters,
//     );
//     formItems.add(item);
//     return item;
//   }

//   ValueNotifierFormItem<T> customFormItem<T>({
//     required T value,
//     ValidatorFailure<T>? validate,
//     VoidCallback? onChange,
//   }) {
//     final item = ValueNotifierFormItem<T>(
//       validate: validate,
//       value: value,
//       onChange: onChange,
//     );
//     formItems.add(item);
//     return item;
//   }

//   ValueNotifierListFormItem<T> customListFormItem<T>({
//     required List<ValueNotifierFormItem<T>> value,
//     required ValueNotifierFormItem<T> Function() generateValue,
//     ValidatorFailure<List<ValueNotifierFormItem<T>>>? validate,
//     VoidCallback? onChange,
//   }) {
//     final item = ValueNotifierListFormItem<T>(
//       validate: validate,
//       value: value,
//       generateValue: generateValue,
//       onChange: onChange,
//     );
//     formItems.add(item);
//     return item;
//   }

//   void dispose() {
//     for (final element in formItems) {
//       element.dispose();
//     }
//   }
// }

// class StringFormItem extends FormItem<String> {
//   StringFormItem({
//     String value = '',
//     super.validate,
//     this.inputFormatters,
//   }) {
//     controller.text = value;
//   }
//   final List<TextInputFormatter>? inputFormatters;

//   TextEditingController controller = TextEditingController();

//   @override
//   String get value => controller.text;

//   @override
//   set value(String value) {
//     controller.text = value;
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//   }

//   String? nullable() {
//     return value.isEmpty ? null : value;
//   }

//   T? transferNullable<T>(T Function(String) transfer) {
//     if (value.isEmpty) return null;
//     return transfer(value);
//   }
// }

// class ValueNotifierFormItem<T> extends FormItem<T> {
//   ValueNotifierFormItem({
//     required T value,
//     this.onChange,
//     super.validate,
//   }) {
//     controller = ValueNotifier<T>(value);
//   }
//   late ValueNotifier<T> controller;
//   final VoidCallback? onChange;

//   @override
//   T get value => controller.value;

//   @override
//   set value(T value) {
//     controller.value = value;
//     onChange?.call();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//   }

//   K? transferNullable<K>(K Function(T) transfer) {
//     if (value == null) return null;
//     return transfer(value);
//   }
// }

// class ValueNotifierListFormItem<T>
//     extends FormItem<List<ValueNotifierFormItem<T>>> {
//   ValueNotifierListFormItem({
//     required List<ValueNotifierFormItem<T>> value,
//     required this.generateValue,
//     this.onChange,
//     super.validate,
//   }) {
//     controller = ValueNotifier<List<ValueNotifierFormItem<T>>>(value);
//   }
//   late ValueNotifier<List<ValueNotifierFormItem<T>>> controller;
//   final VoidCallback? onChange;
//   final ValueNotifierFormItem<T> Function() generateValue;

//   @override
//   void dispose() {
//     controller.dispose();
//   }

//   @override
//   set value(List<ValueNotifierFormItem<T>> value) {
//     controller.value = value;
//     onChange?.call();
//   }

//   void add() {
//     controller.value = [...controller.value, generateValue()];
//     onChange?.call();
//   }

//   void remove(int index) {
//     controller.value = [...controller.value..removeAt(index)];
//     onChange?.call();
//   }

//   void removeLast() {
//     controller.value = [...controller.value..removeLast()];
//     onChange?.call();
//   }

//   @override
//   List<ValueNotifierFormItem<T>> get value => controller.value;
// }
