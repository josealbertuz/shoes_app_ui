import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/orange_button.dart';

class PriceWithButton extends StatelessWidget {
  final double price;
  final String textButton;
  final Function onPressed;

  const PriceWithButton({@required this.price, @required this.textButton, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('\$$price',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        OrangeButton(textButton: textButton, onPressed: onPressed)
      ],
    );
  }
}
