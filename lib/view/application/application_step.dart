import 'package:flutter/material.dart';
import 'package:turp/widget/turp_button.dart';

abstract class ApplicationStep extends StatefulWidget {
  final String title;

  const ApplicationStep({Key? key, required this.title}) : super(key: key);

  @override
  State<ApplicationStep> createState() => ApplicationStepState();
}

class ApplicationStepState<T extends ApplicationStep> extends State<T> {
  final _formKey = GlobalKey<FormState>();

  late final List<Widget> fields;

  void setFields(List<Widget> fields) => this.fields = fields;

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
              ...fields,
              SizedBox(
                width: double.infinity,
                child: TurpButton.primary(
                  label: "Save",
                  onPressed: () async {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      //
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
