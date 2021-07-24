import 'package:get/route_manager.dart';
import 'package:isomanbangkit/routes/routes_name.dart';
import 'package:isomanbangkit/view/intro/Intro_splash_view.dart';
import 'package:isomanbangkit/view/intro/intro_ask_view.dart';
import 'package:isomanbangkit/view/isoman/isoman_home_view.dart';
import 'package:isomanbangkit/view/isoman/isoman_intro_view.dart';
import 'package:isomanbangkit/view/prevent/prevent_home_view.dart';

class Routes {
  static final routes = [
    GetPage(name: RoutesName.INTRO_ASK, page: () => IntroAskView()),
    GetPage(name: RoutesName.INTRO_SPLASH, page: () => IntroSplashView()),
    GetPage(name: RoutesName.ISOMAN_HOME, page: () => IsomanHomeView()),
    GetPage(name: RoutesName.ISOMAN_INTRO, page: () => IsomanIntroView()),
    GetPage(name: RoutesName.PREVENT_HOME, page: () => PreventHomeView()),
  ];
}
