import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/price_with_button.dart';

class AddCartFloatingButton extends StatelessWidget {
  final double price;
  final String textButton;
  final Function onPressed;

  const AddCartFloatingButton({@required this.price, @required this.textButton, @required this.onPressed});



  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(35)),
        child: PriceWithButton(price: price, textButton: textButton, onPressed: onPressed));
  }
}
