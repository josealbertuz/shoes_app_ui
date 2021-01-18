import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String textButton;
  final double height;
  final double width;
  final Function onPressed;

  const OrangeButton(
      {@required this.textButton, this.height = 40, this.width = 120, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: TextButton(
              onPressed: onPressed,
              child: Text(textButton, style: TextStyle(color: Colors.white)))),
    );
  }
}
