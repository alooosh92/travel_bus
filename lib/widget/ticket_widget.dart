import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:travel_bus/res/api.dart';
import 'package:travel_bus/res/text_style_manager.dart';
import '../res/color_manager.dart';
import '../res/images_manager.dart';
import '../res/string_manager.dart';
import 'navigation_bar.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defulteAppBar(
          context: context,
          function: () async {},
          icon: Icons.filter_list,
          title: StringManager.myBooking.tr),
      body: FutureBuilder<List<BookingUser>>(
        initialData: const [],
        future: Controller.bookingUser(FirebaseAuth.instance.currentUser!.uid),
        builder: (context, snapshot) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    (MediaQuery.of(context).size.width / 400).round(),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 3,
                mainAxisExtent: 500),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Center(
                child: Ticket(
                  color: int.parse(snapshot.data![index].color),
                  companyName: snapshot.data![index].shortName,
                  form: snapshot.data![index].from,
                  to: snapshot.data![index].to,
                  traveldate: snapshot.data![index].dateTimeTravel,
                  numberSeates: snapshot.data![index].seateNumber,
                  prise: snapshot.data![index].price,
                  busNumber: snapshot.data![index].busNumber,
                  vip: snapshot.data![index].vip,
                  seates: snapshot.data![index].seates,
                  ischeck: snapshot.data![index].isCheck,
                  isPay: snapshot.data![index].isPay,
                  id: snapshot.data![index].id,
                  bookindDate: snapshot.data![index].dateTimeBooking,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Ticket extends StatelessWidget {
  const Ticket({
    super.key,
    required this.companyName,
    required this.form,
    required this.to,
    required this.color,
    required this.traveldate,
    required this.numberSeates,
    required this.prise,
    required this.busNumber,
    required this.vip,
    required this.ischeck,
    required this.seates,
    required this.isPay,
    required this.id,
    required this.bookindDate,
  });
  final String id;
  final String companyName;
  final String form;
  final String to;
  final int color;
  final DateTime traveldate;
  final int numberSeates;
  final int prise;
  final String busNumber;
  final bool vip;
  final List<int> seates;
  final bool ischeck;
  final bool isPay;
  final DateTime bookindDate;
  @override
  Widget build(BuildContext context) {
    String sss = '';
    for (var element in seates) {
      sss.isEmpty ? sss = element.toString() : sss = '$sss - $element';
    }
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 20,
                color: ColorManager.grayColor,
                offset: Offset.zero,
              )
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(color),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Center(
                    child: Text(
                  companyName,
                  style: TextStyleManager.title,
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.location_on_outlined,
                    size: 40,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 40,
                  ),
                  Icon(
                    Icons.location_on_outlined,
                    size: 40,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    form,
                    style: TextStyleManager.title,
                  ),
                  const Icon(
                    Icons.bus_alert,
                    size: 40,
                  ),
                  Text(
                    to,
                    style: TextStyleManager.title,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 40,
                    width: 30,
                    decoration: const BoxDecoration(
                        color: ColorManager.fullWhite,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                  ),
                  const CircularWhite(),
                  Container(
                    height: 40,
                    width: 30,
                    decoration: const BoxDecoration(
                        color: ColorManager.fullWhite,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20))),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${StringManager.tripDate.tr}:  ${traveldate.toString().substring(0, 10)}',
                        style: TextStyleManager.defuolt,
                      ),
                      Text(
                        '${StringManager.numSeat.tr}:  $numberSeates',
                        style: TextStyleManager.defuolt,
                      ),
                      Text(
                        '${StringManager.fullPrice.tr}: ${prise * numberSeates}',
                        style: TextStyleManager.defuolt,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          ischeck
                              ? StringManager.isCheck.tr
                              : StringManager.isNotCheck.tr,
                          style: TextStyleManager.defuolt,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${StringManager.tripTime.tr}:  ${traveldate.hour}:${traveldate.minute}',
                        style: TextStyleManager.defuolt,
                      ),
                      Text(
                        '${StringManager.timeToBeAtTheStation.tr}:  ${traveldate.add(const Duration(minutes: -30)).hour}:${traveldate.add(const Duration(minutes: -30)).minute}',
                        style: TextStyleManager.defuolt,
                      ),
                      Text(
                        '${StringManager.busNumber.tr}:  $busNumber',
                        style: TextStyleManager.defuolt,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          ischeck
                              ? isPay
                                  ? StringManager.isPay.tr
                                  : StringManager.isNotPay.tr
                              : StringManager.youCanNotPay.tr,
                          style: TextStyleManager.defuolt,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
                width: 300,
                child: Divider(
                  color: Color(color),
                  indent: 40,
                  endIndent: 40,
                  thickness: 1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringManager.seates.tr,
                            style: TextStyleManager.loginToContune,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                sss,
                                style: TextStyleManager.title,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      QrImage(
                        data: id,
                        version: QrVersions.auto,
                        size: 125,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Visibility(
          visible: vip,
          child: Positioned(
            top: 230,
            left: Get.locale == const Locale('ar') ? 30 : null,
            right: Get.locale == const Locale('en') ? 30 : null,
            child: Image.asset(
              ImagesManager.vip4,
              height: 45,
              width: 45,
            ),
          ),
        ),
        Visibility(
          visible: isPay,
          child: Positioned(
            bottom: 0,
            right: Get.locale == const Locale('ar') ? 20 : null,
            left: Get.locale == const Locale('en') ? 20 : null,
            child: Image.asset(
              ImagesManager.paid,
              height: 95,
              width: 95,
            ),
          ),
        ),
        Visibility(
          visible: ischeck,
          child: Positioned(
            bottom: 70,
            left: Get.locale == const Locale('ar') ? 30 : null,
            right: Get.locale == const Locale('en') ? 30 : null,
            child: Image.asset(
              ImagesManager.confirm,
              height: 75,
              width: 75,
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 0,
          right: 0,
          child: Center(
              child: Text(
                  '${StringManager.bookingDate.tr}:  ${bookindDate.year}/${bookindDate.month}/${bookindDate.day} ${bookindDate.hour}:${bookindDate.minute}',
                  style: TextStyleManager.defuolt)),
        ),
      ],
    );
  }
}

class CircularWhite extends StatelessWidget {
  const CircularWhite({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    double w = 9;
    double h = 12;
    return SizedBox(
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
                color: ColorManager.fullWhite,
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
                color: ColorManager.fullWhite,
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
                color: ColorManager.fullWhite,
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
                color: ColorManager.fullWhite,
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
                color: ColorManager.fullWhite,
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
                color: ColorManager.fullWhite,
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
                color: ColorManager.fullWhite,
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
                color: ColorManager.fullWhite,
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
                color: ColorManager.fullWhite,
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
                color: ColorManager.fullWhite,
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
                color: ColorManager.fullWhite,
                borderRadius: BorderRadius.circular(20)),
          ),
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
                color: ColorManager.fullWhite,
                borderRadius: BorderRadius.circular(20)),
          ),
        ],
      ),
    );
  }
}
