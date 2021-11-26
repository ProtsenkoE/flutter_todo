import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/config/color_constants.dart';
import 'package:flutter_todo/config/string_constants.dart' as string_constant;
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HeaderUpPanel extends StatelessWidget {
  const HeaderUpPanel({
    Key? key,
    required this.radius,
    required this.controller,
  }) : super(key: key);

  final BorderRadiusGeometry radius;
  final PanelController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.isPanelClosed) {
          controller.open();
        } else {
          controller.close();
        }
      },
      child: Container(
        height: 84.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorConstants.lightOrangeColor,
              ColorConstants.orangeColor
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: radius,
        ),
        child: const Center(
          child: Text(
            string_constant.addItem,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
