import 'package:flutter/material.dart';

class ElevatedCircleButton extends StatefulWidget {
  final IconData icon;

  const ElevatedCircleButton({@required this.icon});

  @override
  _ElevatedCircleButtonState createState() => _ElevatedCircleButtonState();
}

class _ElevatedCircleButtonState extends State<ElevatedCircleButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            elevation: 2.5,
            shadowColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            minimumSize: Size(70, 70)),
        onPressed: () {
          setState(() {
            isPressed = isPressed ? false : true;
          });
        },
        child: Icon(
          widget.icon,
          color: isPressed ? Colors.red : Colors.grey[300],
        ));
  }
}
