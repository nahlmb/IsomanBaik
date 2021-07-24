import 'package:flutter/material.dart';

AppBar getIBAppBar(
    {bool border = true,
    bool logoColored = true,
    Color backgroundColor = Colors.white,
    List<Widget> actions = const []}) {
  return AppBar(
      title: (logoColored)
          ? Image.asset(
              "lib/assets/images/logo_color.png",
              height: 24,
            )
          : Image.asset(
              "lib/assets/images/logo_white.png",
              height: 24,
            ),
      backgroundColor: backgroundColor,
      elevation: 0,
      actions: actions,
      flexibleSpace: (border)
          ? Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: Colors.black.withOpacity(0.1)))))
          : null);
}
