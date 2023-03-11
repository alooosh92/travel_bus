import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_bus/res/api.dart';
import 'package:travel_bus/res/routes_manager.dart';
import '../res/images_manager.dart';
import '../res/string_manager.dart';
import '../res/text_style_manager.dart';
import 'navigation_bar.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defulteAppBar(
          context: context,
          function: () {
            Navigator.of(context).pushNamed(AllRoutesManager.personInfoScreen);
          },
          icon: Icons.edit,
          title: StringManager.personInformation.tr),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: FutureBuilder<PersonInfo>(
          future: Controller.personInfo(FirebaseAuth.instance.currentUser!.uid),
          initialData: PersonInfo(
            amana: '',
            birthDay: DateTime.now(),
            fatherName: '',
            firstName: '',
            kayed: '',
            lastName: '',
            motherName: '',
            nationalNumber: '',
            phone: '',
            region: Region(id: '', arRegion: '', enRegion: ''),
            sex: true,
          ),
          builder: (context, snapshot) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  maxRadius: 75,
                  minRadius: 50,
                  child: Image.asset(ImagesManager.icon),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoRow(
                          text:
                              '${StringManager.fullName.tr}: ${snapshot.data!.firstName} ${snapshot.data!.lastName}',
                          icon: Icons.person),
                      const SizeBoxBetwenInfo(),
                      InfoRow(
                          text:
                              '${StringManager.fatherName.tr}:  ${snapshot.data!.fatherName}',
                          icon: Icons.person),
                      const SizeBoxBetwenInfo(),
                      InfoRow(
                          text:
                              '${StringManager.birthday.tr}:  ${snapshot.data!.birthDay.toString().substring(0, 10)}',
                          icon: Icons.calendar_month),
                      const SizeBoxBetwenInfo(),
                      InfoRow(
                          text:
                              '${StringManager.kayed.tr}:  ${snapshot.data!.kayed}',
                          icon: Icons.note)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoRow(
                          text:
                              '${StringManager.phone.tr}:  ${snapshot.data!.phone}',
                          icon: Icons.phone_android),
                      const SizeBoxBetwenInfo(),
                      InfoRow(
                          text:
                              '${StringManager.motherName.tr}:  ${snapshot.data!.motherName}',
                          icon: Icons.person_2),
                      const SizeBoxBetwenInfo(),
                      InfoRow(
                          text:
                              '${StringManager.region.tr}:  ${snapshot.data!.region.arRegion}',
                          icon: Icons.location_city),
                      const SizeBoxBetwenInfo(),
                      InfoRow(
                          text:
                              '${StringManager.amana.tr}:  ${snapshot.data!.amana}',
                          icon: Icons.note)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SizeBoxBetwenInfo extends StatelessWidget {
  const SizeBoxBetwenInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 15);
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.text, required this.icon});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyleManager.defuolt,
        ),
      ],
    );
  }
}
