import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_todo/config/api.dart';
import 'package:flutter_todo/config/image_constants.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/widgets/top_bar.dart';
import 'package:flutter_todo/config/string_constants.dart' as string_constant;

class ItemDetails extends StatefulWidget {
  ItemDetails({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  Todo item = Todo(isChecked: false, image: '', title: '', createdAt: '');

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  void getDetails() async {
    var result = await Api.getTodoDetails(widget.id);
    setState(() {
      item = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            const TopBar(),
            _title(item),
            Positioned(
              top: 134.0,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _image(item),
                        _backButton(context),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _backButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40.0),
      width: 100.0,
      child: ElevatedButton(
        child: const Center(
          child: Text(
            string_constant.backButton,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          minimumSize: const Size(100.0, 40.0),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Container _image(Todo item) {
    return Container(
      margin: const EdgeInsets.only(top: 64.0),
      width: 300.0,
      height: 220.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: item.image != ''
              ? NetworkImage(item.image)
              : NetworkImage(AllImages().loaderImage),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Positioned _title(Todo item) {
    return Positioned(
      top: 30.0,
      left: 28.0,
      child: Text(
        item.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
