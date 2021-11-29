import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_todo/presentation/screens/item_details.dart';

import '../main.dart';

class RouterFluro {
  static final FluroRouter router = FluroRouter();

  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const MyHomePage());

  static final Handler _detailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          ItemDetails(id: params['id'][0]));

  static void setupRouter() {
    router.define(
      '/',
      handler: _homeHandler,
    );
    router.define(
      '/details/:id',
      handler: _detailHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
