import 'package:flutter/material.dart';
import 'package:turp/service/validator.dart';
import 'package:turp/view/application/application_step.dart';
import 'package:turp/widget/turp_dropdown_button.dart';
import 'package:turp/widget/turp_text_form_field.dart';

class Step1 extends ApplicationStep {
  const Step1({Key? key}) : super(key: key, title: "General Information");

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends ApplicationStepState<Step1> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController fathersNameController = TextEditingController();
  TextEditingController mothersNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  late String gender;

  @override
  void initState() {
    setFields(getFields());
    super.initState();
  }

  List<Widget> getFields() {
    return [
      TurpTextFormField.name(
        labelText: "First name",
        hintText: "Enter your first name",
        controller: firstNameController,
        validator: NameValidator.validate,
      ),
      const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      TurpTextFormField.name(
        labelText: "Last name",
        hintText: "Enter your last name",
        controller: lastNameController,
        validator: NameValidator.validate,
      ),
      const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      TurpTextFormField.date(
        labelText: "Birth date",
        hintText: "dd.mm.yyyy or dd-mm-yyyy or dd/mm/yyyy",
        controller: dateController,
        validator: DateValidator.validate,
      ),
      const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      TurpTextFormField.name(
        labelText: "Father's first name",
        hintText: "Enter your father's first name",
        controller: fathersNameController,
        validator: NameValidator.validate,
      ),
      const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      TurpTextFormField.name(
        labelText: "Mother's first name",
        hintText: "Enter your mother's first name",
        controller: mothersNameController,
        validator: NameValidator.validate,
      ),
      const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      TurpDropdownButton(
        labelText: "Gender",
        items: const ["Female", "Male", "Diverse"],
        onChanged: (value) => gender = value,
        validator: GenderValidator.validate,
      ),
      const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
    ];
  }
}
