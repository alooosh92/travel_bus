import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_bus/res/api.dart';
import 'package:travel_bus/res/routes_manager.dart';
import 'package:travel_bus/res/string_manager.dart';
import '../res/color_manager.dart';
import '../res/text_style_manager.dart';
import 'elevate_button_widget.dart';
import 'input_text_form_widget.dart';

class TripWidget extends StatelessWidget {
  const TripWidget(
      {super.key,
      required this.id,
      required this.companyColor,
      required this.companyShortName,
      required this.price,
      required this.tripLine,
      required this.dateTime,
      required this.minutes,
      required this.notes,
      required this.vip});
  final String id;
  final Color companyColor;
  final String companyShortName;
  final double price;
  final String tripLine;
  final DateTime dateTime;
  final int minutes;
  final List<dynamic> notes;
  final bool vip;
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    DateTime dateArrivel = dateTime.add(Duration(minutes: minutes));
    return Container(
      height: 450,
      width: 325,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: ColorManager.whiteColor,
        boxShadow: [
          BoxShadow(
            color: ColorManager.grayColor,
            offset: Offset.zero,
            blurRadius: 5,
            spreadRadius: 5,
          )
        ],
      ),
      child: Stack(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: companyColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
          ),
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColorInfo(
                color: companyColor,
                text: companyShortName,
                isLeft: false,
                textStyle: TextStyleManager.defuolt,
                margin: 55,
              ),
              ColorInfo(
                color: ColorManager.fullBlack,
                text: price.round().toString() + StringManager.sp.tr,
                isLeft: true,
                textStyle: TextStyleManager.price,
                margin: 55,
              ),
            ],
          ),
          Visibility(
            visible: vip,
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                ColorInfo(
                  color: ColorManager.vipColor,
                  text: StringManager.vip.tr,
                  isLeft: false,
                  textStyle: TextStyleManager.defuolt,
                  margin: 90,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    tripLine,
                    style: TextStyleManager.ticketRegion,
                  ),
                  Text(
                    StringManager.tripInfo.tr,
                    style: TextStyleManager.title,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            StringManager.date.tr,
                            style: TextStyleManager.defuolt,
                          ),
                          Text(
                            StringManager.time.tr,
                            style: TextStyleManager.defuolt,
                          ),
                          Text(
                            StringManager.timeBefor.tr,
                            style: TextStyleManager.defuolt,
                          ),
                          Text(
                            StringManager.timeToArrival.tr,
                            style: TextStyleManager.defuolt,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${dateTime.year.toString()}/${dateTime.month.toString()}/${dateTime.day.toString()}',
                            style: TextStyleManager.defuolt,
                          ),
                          Text(
                            '${dateTime.hour.toString()}:${dateTime.minute.toString()}',
                            style: TextStyleManager.defuolt,
                          ),
                          Text(
                            '${dateTime.add(const Duration(hours: -1)).hour..toString()}:${dateTime.minute.toString()}',
                            style: TextStyleManager.defuolt,
                          ),
                          Text(
                            '${dateArrivel.hour.toString()}:${dateArrivel.minute.toString()}',
                            style: TextStyleManager.defuolt,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const DDivider(),
                  Text(
                    StringManager.tripNote.tr,
                    style: TextStyleManager.title,
                  ),
                  SizedBox(
                    height: 85,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2, right: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NotesWidget(
                                  scrollController: scrollController,
                                  notes: notes),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const DDivider(),
                  ElevatedButtonWidget(
                    function: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AddBooking(
                            tripid: id,
                          );
                        },
                      );
                    },
                    text: StringManager.bayTicket.tr,
                    color: companyColor,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddBooking extends StatelessWidget {
  const AddBooking({
    super.key,
    required this.tripid,
  });
  final String tripid;

  @override
  Widget build(BuildContext context) {
    TextEditingController number = TextEditingController();
    TextEditingController note = TextEditingController();
    return AlertDialog(
      title: Text(
        StringManager.bookingConfirmation.tr,
        style: TextStyleManager.title,
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InputTextFormWidget(
              textInputType: TextInputType.text,
              isPass: false,
              label: StringManager.numSeat.tr,
              textEditingController: number,
            ),
            InputTextFormWidget(
              textInputType: TextInputType.multiline,
              isPass: false,
              label: StringManager.notes.tr,
              textEditingController: note,
            ),
            ElevatedButtonWidget(
                function: () async {
                  var user = FirebaseAuth.instance.currentUser;
                  var per = await Controller.personInfo(user!.uid);
                  if (per.nationalNumber.isNotEmpty) {
                    BookingPostUser b = BookingPostUser(
                      note: note.text,
                      numSeate: int.parse(number.text),
                      personId: user.uid,
                      tripId: tripid,
                      userId: user.uid,
                    );
                    var res = await Controller.addBooking(b);
                    if (res) {
                      Navigator.pop(context);
                    }
                  } else {
                    Navigator.of(context).pushReplacementNamed(
                        AllRoutesManager.personInfoScreen);
                  }
                },
                text: StringManager.confirmation.tr)
          ],
        ),
      ),
      contentPadding: const EdgeInsets.all(20),
    );
  }
}

class NotesWidget extends StatelessWidget {
  const NotesWidget({
    super.key,
    required this.scrollController,
    required this.notes,
  });

  final ScrollController scrollController;
  final List<dynamic> notes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      width: 300,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Text(
            '${index + 1}- ${notes[index].toString()}',
            style: TextStyleManager.defuolt,
          );
        },
      ),
    );
  }
}

class DDivider extends StatelessWidget {
  const DDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 25,
      width: 300,
      child: Divider(
        color: ColorManager.primaryColor,
        indent: 40,
        endIndent: 40,
        thickness: 1,
      ),
    );
  }
}

class ColorInfo extends StatelessWidget {
  const ColorInfo({
    super.key,
    required this.color,
    required this.text,
    required this.isLeft,
    required this.textStyle,
    required this.margin,
  });
  final Color color;
  final String text;
  final bool isLeft;
  final TextStyle textStyle;
  final double margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      margin: EdgeInsets.only(top: margin),
      decoration: BoxDecoration(
        color: color,
        borderRadius: isLeft
            ? const BorderRadius.only(
                bottomRight: Radius.circular(25),
                topRight: Radius.circular(25),
              )
            : const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
