import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:turp/constants.dart';
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
  String nationality = "";
  String flag = "";
  String gender = "";
  late TurpDropdownButton genderDropdownButton;

  @override
  Future<void> getUserData() async {
    final userData = await super.getUserData();
    if (userData != null) {
      firstNameController.text = user.firstName!;
      lastNameController.text = user.lastName!;
      fathersNameController.text = user.fathersName!;
      mothersNameController.text = user.mothersName!;
      dateController.text = user.birthDate!;
      nationalityController.text = "${user.flag} ${user.nationality}";
      printWarning(genderDropdownButton.value);
      // TODO: make sure dropdown value is actually set to the saved gender
      genderDropdownButton.value = user.gender;
      printWarning(genderDropdownButton.value);
    }
  }

  @override
  void initState() {
    genderDropdownButton = TurpDropdownButton(
      labelText: "Gender",
      items: const ["Female", "Male", "Diverse"],
      onChanged: (value) => gender = value,
      validator: GenderValidator.validate,
    );
    printWarning(
        "After initialization in initState(), the value of the dropdown button is ${genderDropdownButton.value}");
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
      genderDropdownButton,
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
  Future saveUserData() async {
    user.firstName = firstNameController.text;
    user.lastName = lastNameController.text;
    user.birthDate = dateController.text;
    user.fathersName = fathersNameController.text;
    user.mothersName = mothersNameController.text;
    user.gender = gender;
    user.nationality = nationality;
    user.flag = flag;
    super.saveUserData();
  }
}
