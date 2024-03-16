import 'package:flutter/material.dart';
import 'package:news_app/constant.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    Key? key,
    required this.smallDevices,
    required this.largeDevices,
  }) : super(key: key);
  final WidgetBuilder smallDevices, largeDevices;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (deviceWidth < smallDeviceSize) {
          return smallDevices(context);
        } else {
          return largeDevices(context);
        }
      },
    );
  }
}
