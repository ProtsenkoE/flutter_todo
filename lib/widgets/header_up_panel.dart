import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/config/color_constants.dart';
import 'package:flutter_todo/config/string_constants.dart' as string_constant;

class HeaderUpPanel extends StatelessWidget {
  const HeaderUpPanel({
    Key? key,
    required this.radius,
  }) : super(key: key);

  final BorderRadiusGeometry radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorConstants.lightOrangeColor, ColorConstants.orangeColor],
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
    );
  }
}
