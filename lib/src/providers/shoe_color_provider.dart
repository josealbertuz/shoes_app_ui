import 'package:flutter/cupertino.dart';
import 'package:shoes_app/src/models/shoe_color_model.dart';

class ShoeColorProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  List<ShoeColorModel> get shoeColors => [
        ShoeColorModel(
            uri: 'assets/imgs/amarillo.png', color: Color(0xffFFAD29)),
        ShoeColorModel(uri: 'assets/imgs/azul.png', color: Color(0xff2099F1)),
        ShoeColorModel(uri: 'assets/imgs/negro.png', color: Color(0xff364D56)),
        ShoeColorModel(uri: 'assets/imgs/verde.png', color: Color(0XffC6D642)),
      ];
}
