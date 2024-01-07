import 'package:flutter/material.dart';
import 'package:turp/model/turp_user.dart';
import 'package:turp/service/auth.dart';
import 'package:turp/widget/turp_button.dart';

abstract class ApplicationStep extends StatefulWidget {
  final String title;

  const ApplicationStep({Key? key, required this.title}) : super(key: key);

  @override
  State<ApplicationStep> createState() => ApplicationStepState();
}

class ApplicationStepState<T extends ApplicationStep> extends State<T> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  late final List<Widget> _fields;
  TurpUser user = TurpUser();

  void setFields(List<Widget> fields) => this._fields = fields;

  Future getUserData() async => user = await _auth.getUser();
  Future saveUserData() async => await _auth.addOrUpdateUser(user);

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(children: [
              ..._fields,
              SizedBox(
                width: double.infinity,
                child: TurpButton.primary(
                  label: "Save",
                  onPressed: () async {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      await saveUserData();
                    }
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
