import 'package:flutter/material.dart';
import 'package:travel_bus/res/text_style_manager.dart';
import '../res/color_manager.dart';
import '../res/size_manager.dart';
import 'elevate_button_widget.dart';

class FindTicketWidget extends StatelessWidget {
  const FindTicketWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    DeviesSize size = DeviesSize.size(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: size.height / 3,
          width: size.width,
          child: CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 10)),
            onDateChanged: (date) {
              dateTime = date;
            },
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 239, 245, 252),
            boxShadow: [
              BoxShadow(
                color: ColorManager.grayColor,
                offset: Offset.zero,
                blurRadius: 5,
                blurStyle: BlurStyle.solid,
              ),
            ],
          ),
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.circle_outlined),
                  Text(
                    'دمشق',
                    style: TextStyleManager.defuolt,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.swap_vertical_circle_outlined, //autorenew_rounded,
                    color: ColorManager.primaryColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: size.width * 0.5,
                    child: const Divider(
                      height: 20,
                      thickness: 3,
                      indent: 20,
                      endIndent: 0,
                      color: ColorManager.primaryColor,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.circle),
                  Text(
                    'حلب',
                    style: TextStyleManager.defuolt,
                  )
                ],
              ),
            ],
          ),
        ),
        ElevatedButtonWidget(
          function: () {},
          text: 'البحث عن حجز',
        )
      ],
    );
  }
}
