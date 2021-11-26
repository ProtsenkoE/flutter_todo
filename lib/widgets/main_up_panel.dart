import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/config/api.dart';
import 'package:flutter_todo/config/color_constants.dart';
import 'package:flutter_todo/config/string_constants.dart' as string_constant;
import 'package:flutter_todo/config/toast_messages.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainUpPanel extends StatefulWidget {
  const MainUpPanel({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PanelController controller;

  @override
  State<MainUpPanel> createState() => _MainUpPanelState();
}

class _MainUpPanelState extends State<MainUpPanel> {
  String newTitle = '';
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 120.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
          child: TextField(
            controller: _controller,
            onChanged: (newText) {
              setState(() {
                newTitle = newText;
              });
            },
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
              onPressed: () {
                if (newTitle == '') {
                  ToastMessages.error(string_constant.error, context);
                } else {
                  Api.addItem(newTitle);
                  _controller.clear();
                  setState(() {
                    newTitle = '';
                  });
                  widget.controller.close();
                }
              },
              tooltip: string_constant.addItem,
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
