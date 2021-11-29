import 'package:flutter/cupertino.dart';
import 'package:flutter_todo/config/image_constants.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage('${AllImages().image}/bg_top.png'),
      ),
    );
  }
}
