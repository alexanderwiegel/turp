import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:turp/model/turp_user.dart';
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
  TextEditingController nationalityController = TextEditingController();
  late String nationality;
  late String flag;
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
      InkWell(
        onTap: () => showCountryPicker(
          context: context,
          onSelect: (Country country) => setState(() {
            nationality = country.name;
            flag = country.flagEmoji;
            nationalityController.text = "$flag $nationality";
          }),
        ),
        child: IgnorePointer(
          child: TurpTextFormField.country(
            labelText: "Nationality",
            controller: nationalityController,
            validator: CountryValidator.validate,
          ),
        ),
      ),
      const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
    ];
  }

  @override
  Future saveData(auth) async {
    TurpUser.firstName = firstNameController.text;
    TurpUser.lastName = lastNameController.text;
    TurpUser.birthdate = dateController.text;
    TurpUser.fathersName = fathersNameController.text;
    TurpUser.mothersName = mothersNameController.text;
    TurpUser.gender = gender;
    TurpUser.country = nationality;
    TurpUser.flag = flag;
    await auth.updateUser(
      {
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "birthdate": dateController.text,
        "fathersName": fathersNameController.text,
        "mothersName": mothersNameController.text,
        "gender": gender,
        "country": nationality,
        "flag": flag,
      },
    );
  }
}
