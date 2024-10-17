import 'package:flutter/material.dart';

import 'pure_login_form.dart';

class PureLoginPage extends StatefulWidget {
  const PureLoginPage({super.key});

  @override
  State<PureLoginPage> createState() => _PureLoginPageState();
}

class _PureLoginPageState extends State<PureLoginPage> {
  late PureLoginForm form;

  @override
  void initState() {
    form = PureLoginForm();
    super.initState();
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: form.mail.controller,
                validator: form.mail.validateUi,
              ),
              ElevatedButton(
                onPressed: () {
                  if (!form.validate()) {
                    return;
                  }

                  print(form.mail.controller.text);
                },
                child: const Text("data"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
