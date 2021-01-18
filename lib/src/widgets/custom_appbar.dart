import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final IconData icon;

  const CustomAppbar({this.title = 'Title', this.icon = Icons.search});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.09,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
          Icon(icon, size: 25, color: Colors.black)
        ],
      )),
    );
  }
}
