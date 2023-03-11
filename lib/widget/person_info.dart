import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_bus/res/api.dart';
import 'package:travel_bus/res/routes_manager.dart';
import '../res/size_manager.dart';
import '../res/string_manager.dart';
import '../res/text_style_manager.dart';
import 'elevate_button_widget.dart';
import 'input_text_form_widget.dart';
import 'text_label_widget.dart';

TextEditingController nationalNumber = TextEditingController();
TextEditingController firstName = TextEditingController();
TextEditingController lastName = TextEditingController();
TextEditingController fatherName = TextEditingController();
TextEditingController motherName = TextEditingController();
TextEditingController amana = TextEditingController();
TextEditingController kayed = TextEditingController();
TextEditingController region = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController birthday = TextEditingController();
TextEditingController sex = TextEditingController();
bool? sexval = false;
String? regionval = '';
List<DropdownMenuEntry> regions = [];
void per() async {
  var p = await Controller.personInfo(FirebaseAuth.instance.currentUser!.uid);
  if (p.nationalNumber.isNotEmpty) {
    nationalNumber.text = p.nationalNumber;
    firstName.text = p.firstName;
    lastName.text = p.lastName;
    fatherName.text = p.fatherName;
    motherName.text = p.motherName;
    amana.text = p.amana;
    kayed.text = p.kayed;
    region.text = p.region.id;
    phone.text = p.phone;
    birthday.text = p.birthDay.toString();
  }
}

void getRegion() async {
  regions = [];
  var re = await Controller.allRegion();
  for (var element in re) {
    DropdownMenuEntry r = DropdownMenuEntry(
      value: element.id,
      label: element.arRegion,
    );
    regions.add(r);
  }
}

class PersonInfoWidget extends StatefulWidget {
  const PersonInfoWidget({
    super.key,
    required this.size,
  });
  final DeviesSize size;
  @override
  State<PersonInfoWidget> createState() => _PersonInfoWidgetState();
}

class _PersonInfoWidgetState extends State<PersonInfoWidget> {
  @override
  Widget build(BuildContext context) {
    per();
    getRegion();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: widget.size.height / 14),
          TextLabelWidget(
            text: StringManager.createAccont.tr,
            textStyle: TextStyleManager.wellcomLogin,
          ),
          SizedBox(height: widget.size.height / 14),
          InputTextFormWidget(
            textInputType: TextInputType.text,
            isPass: false,
            label: StringManager.firstName.tr,
            textEditingController: firstName,
          ),
          const SizedBox(height: 10),
          InputTextFormWidget(
            textInputType: TextInputType.text,
            isPass: false,
            label: StringManager.lastName.tr,
            textEditingController: lastName,
          ),
          const SizedBox(height: 10),
          InputTextFormWidget(
            textInputType: TextInputType.text,
            label: StringManager.fatherName.tr,
            textEditingController: fatherName,
            isPass: false,
          ),
          const SizedBox(height: 10),
          InputTextFormWidget(
            textInputType: TextInputType.text,
            label: StringManager.motherName.tr,
            textEditingController: motherName,
            isPass: false,
          ),
          const SizedBox(height: 10),
          InputTextFormWidget(
            textInputType: TextInputType.number,
            label: StringManager.nationalNumber.tr,
            textEditingController: nationalNumber,
            isPass: false,
          ),
          const SizedBox(height: 10),
          DropdownMenu(
            label: Text(StringManager.region.tr),
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyleManager.defuolt,
                border: const UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 1))),
            dropdownMenuEntries: regions,
            controller: region,
            onSelected: (value) => regionval = value,
          ),
          const SizedBox(height: 10),
          InputTextFormWidget(
            textInputType: TextInputType.text,
            label: StringManager.amana.tr,
            textEditingController: amana,
            isPass: false,
          ),
          const SizedBox(height: 10),
          InputTextFormWidget(
            textInputType: TextInputType.text,
            label: StringManager.kayed.tr,
            textEditingController: kayed,
            isPass: false,
          ),
          const SizedBox(height: 10),
          InputTextFormWidget(
            textInputType: TextInputType.phone,
            label: StringManager.phone.tr,
            textEditingController: phone,
            isPass: false,
          ),
          const SizedBox(height: 10),
          DropdownMenu(
            label: Text(StringManager.sex.tr),
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyleManager.defuolt,
                border: const UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 1))),
            dropdownMenuEntries: [
              DropdownMenuEntry(value: true, label: StringManager.male.tr),
              DropdownMenuEntry(value: false, label: StringManager.fmale.tr)
            ],
            controller: sex,
            onSelected: (value) => sexval = value,
          ),
          const SizedBox(height: 10),
          Center(
            child: SizedBox(
              height: 200,
              width: 400,
              child: CalendarDatePicker(
                  initialDate: birthday.text.isEmpty
                      ? DateTime.now()
                      : DateTime.parse(birthday.text),
                  firstDate: DateTime.utc(1920),
                  lastDate: DateTime.now(),
                  onDateChanged: (date) {
                    birthday.text = date.toString();
                  }),
            ),
          ),
          SizedBox(height: widget.size.height / 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButtonWidget(
                function: () async {
                  PersonData p = PersonData(
                      amana: amana.text,
                      birthDay: DateTime.parse(birthday.text),
                      fatherName: fatherName.text,
                      firstName: firstName.text,
                      kayed: kayed.text,
                      lastName: lastName.text,
                      motherName: motherName.text,
                      nationalNumber: nationalNumber.text,
                      phone: phone.text,
                      region: regionval,
                      sex: sexval,
                      userId: FirebaseAuth.instance.currentUser!.uid);
                  var res = await Controller.addPerson(p);
                  if (res) {
                    Navigator.of(context)
                        .pushReplacementNamed(AllRoutesManager.loginScreen);
                  }
                },
                text: StringManager.savePersonData.tr,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
