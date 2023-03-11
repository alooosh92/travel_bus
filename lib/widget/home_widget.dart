import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_bus/res/api.dart';
import '../res/color_manager.dart';
import '../res/string_manager.dart';
import '../res/text_style_manager.dart';
import 'navigation_bar.dart';
import 'trip_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

TextEditingController textEditingController = TextEditingController();

class _HomeWidgetState extends State<HomeWidget> {
  // var db = FirebaseFirestore.instance.collection('Company');
  //CollectionReference col = FirebaseFirestore.instance.collection('Trpis');
  // List<Map<String, dynamic>> companies = [];
  List<TripWidget> tripes = [];
  // getcompanies() async {
  //   var dd = await db.get();
  //   var com = dd.docs;
  //   for (var element in com) {
  //     var m = {
  //       'id': element.id,
  //       'shortName': element['shortName'],
  //       'color': element['color'],
  //       'notes': element['notes']
  //     };
  //     companies.add(m);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: defulteAppBarHome(
              context: context,
              function: () {},
              icon: Icons.filter_list,
              title: StringManager.home.tr),
          body: FutureBuilder<List<TripUser>>(
            future: Controller.tripUser(),
            initialData: const [],
            builder: (context, snapshot) {
              tripes = [];
              for (var trip in snapshot.data!) {
                TripWidget tr = TripWidget(
                  vip: trip.vip,
                  id: trip.id,
                  companyColor: Color(int.parse(trip.color)),
                  companyShortName: trip.shortName,
                  price: trip.price,
                  tripLine: trip.busLine,
                  dateTime: trip.dateTime,
                  minutes: trip.minutes,
                  notes: trip.note,
                );
                if (tr.companyShortName.contains(textEditingController.text) ||
                    tr.tripLine.contains(textEditingController.text)) {
                  tripes.add(tr);
                }
              }
              return GridView.builder(
                padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (MediaQuery.of(context).size.width / 400).round(),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3,
                    mainAxisExtent: 400),
                itemCount: tripes.length,
                itemBuilder: (context, index) => Center(
                  child: tripes[index],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 50, right: 50),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: ColorManager.fullWhite,
            ),
            child: TextFormField(
              style: TextStyleManager.defuolt,
              onChanged: (value) => setState(() {}),
              controller: textEditingController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.search),
                hintText: StringManager.search.tr,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(
                    color: ColorManager.fullWhite,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
