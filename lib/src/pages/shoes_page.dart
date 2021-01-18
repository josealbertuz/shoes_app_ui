import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoes_app/src/pages/shoe_desc_page.dart';
import 'package:shoes_app/src/utils/constants.dart';
import 'package:shoes_app/src/utils/utils.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoesPage extends StatelessWidget {
  const ShoesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    darkStatusBar();

    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(title: 'For you', icon: FontAwesomeIcons.search),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Hero(tag: 'shoe-1', child: ShoeSizePreview()),
                ShoeNameDescription(
                    name: shoeInformation['name'],
                    description: shoeInformation['description']),
              ],
            ),
          )),
          AddCartFloatingButton(
            price: 180,
            textButton: 'Add to cart',
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ShoeDescPage())),
          )
        ],
      ),
    );
  }
}
