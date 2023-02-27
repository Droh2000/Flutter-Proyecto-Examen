import 'package:flutter/material.dart';

import '../pages/home_pages.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
  };
}
