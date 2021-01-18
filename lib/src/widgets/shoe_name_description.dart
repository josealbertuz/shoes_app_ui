import 'package:flutter/material.dart';

class ShoeNameDescription extends StatelessWidget {
  final String name;
  final String description;

  const ShoeNameDescription({@required this.name, @required this.description});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        width: screenSize.width,
        height: screenSize.height * 0.21,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            Text(description,
              maxLines: 4, 
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13, color: Colors.grey, height: 1.6))
          ],
        ));
  }
}
