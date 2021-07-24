import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:isomanbangkit/routes/routes.dart';
import 'package:isomanbangkit/routes/routes_name.dart';
import 'package:isomanbangkit/theme/theme.dart';

void main() async {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: appTheme,
    initialRoute: RoutesName.INTRO_SPLASH,
    defaultTransition: Transition.fadeIn,
    getPages: Routes.routes,
    title: "IsomanBangkit",
  ));
}
