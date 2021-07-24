import 'package:flutter/material.dart';

class IBButtonAccent extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color color, textColor;
  const IBButtonAccent(this.title,
      {required this.onPressed,
      this.color = Colors.white,
      this.textColor = const Color(0xff389F6E)});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onPressed(),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Text(
            title,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            primary: color,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0))));
  }
}
