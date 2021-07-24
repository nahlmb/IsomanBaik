import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isomanbangkit/routes/routes_name.dart';
import 'package:isomanbangkit/view_model/intro/intro_splash_view_model.dart';

class IntroSplashView extends StatefulWidget {
  @override
  _IntroSplashViewState createState() => _IntroSplashViewState();
}

class _IntroSplashViewState extends State<IntroSplashView> {
  IntroSplashViewModel viewModel = Get.put(IntroSplashViewModel());

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      viewModel.checkWhereToGo().then((nextPage) => Get.offNamed(nextPage));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "lib/assets/images/logo_color.png",
              width: Get.mediaQuery.size.width * 0.8,
            ),
            Positioned(
              bottom: 12,
              child: Container(
                width: Get.mediaQuery.size.width * 0.7,
                child: Text(
                  "(C) Nahl Munif Basalamah - Sevima Hackathon 2021 - IsomanBaik 0.1.0",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
