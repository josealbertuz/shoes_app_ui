import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/providers/shoe_color_provider.dart';
import 'package:shoes_app/src/utils/constants.dart';
import 'package:shoes_app/src/utils/utils.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';
import 'package:shoes_app/src/widgets/elevated_circle_button.dart';
import 'package:shoes_app/src/widgets/orange_button.dart';
import 'package:shoes_app/src/widgets/price_with_button.dart';

class ShoeDescPage extends StatelessWidget {
  const ShoeDescPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    lightStatusBar();

    return Scaffold(
      body: Column(
        children: [
          Hero(tag: 'shoe-1', child: ShoeSizePreview(fullScreen: true)),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShoeNameDescription(
                    name: shoeInformation['name'],
                    description: shoeInformation['description']),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: PriceWithButton(
                      price: 180, textButton: 'Buy now', onPressed: () {}),
                ),
                _ColorPickerWithButton(),
                _LikeCartSettingsButtons(),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _LikeCartSettingsButtons extends StatelessWidget {
  const _LikeCartSettingsButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedCircleButton(icon: Icons.favorite),
        ElevatedCircleButton(icon: FontAwesomeIcons.cartPlus),
        ElevatedCircleButton(icon: Icons.settings),
      ],
    );
  }
}

class _ColorPickerWithButton extends StatelessWidget {
  const _ColorPickerWithButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ColorPicker(),
          OrangeButton(
            textButton: 'More releated items',
            height: 30,
            width: 160,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoeColors = Provider.of<ShoeColorProvider>(context, listen: false);

    final colors = shoeColors.shoeColors;

    return Container(
      height: 40,
      width: (40 * colors.length).toDouble(),
      child: Stack(
          children: List<Positioned>.generate(colors.length, (index) {
        return Positioned(
            left: (((colors.length - index) - 1) * 30).toDouble(),
            child: GestureDetector(
              child: FadeInLeft(
                  delay: Duration(milliseconds: 30 * index),
                  child: _ColorCircleContainer(colors[index].color)),
              onTap: () => shoeColors.currentIndex = index,
            ));
      })),
    );
  }
}

class _ColorCircleContainer extends StatelessWidget {
  final Color color;

  const _ColorCircleContainer(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
