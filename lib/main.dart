import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:isomanbangkit/routes/routes.dart';
import 'package:isomanbangkit/routes/routes_name.dart';
import 'package:sp_util/sp_util.dart';

void main() async {
  await SpUtil.getInstance();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: RoutesName.INTRO_SPLASH,
    getPages: Routes.routes,
    title: "IsomanBangkit",
  ));
}
