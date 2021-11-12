import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/config/color_constants.dart';
import 'package:flutter_todo/config/string_constants.dart' as string_constant;

class MainUpPanel extends StatefulWidget {
  const MainUpPanel({
    Key? key,
  }) : super(key: key);

  @override
  State<MainUpPanel> createState() => _MainUpPanelState();
}

class _MainUpPanelState extends State<MainUpPanel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 120.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: string_constant.addItemPlaceholder,
              fillColor: ColorConstants.lightMintColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50.0),
        Center(
          child: SizedBox(
            width: 70.0,
            height: 70.0,
            child: FloatingActionButton(
              backgroundColor: ColorConstants.blueColor2,
              onPressed: () {},
              tooltip: string_constant.addItem,
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
