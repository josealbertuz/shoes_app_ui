import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/providers/shoe_color_provider.dart';
import 'package:shoes_app/src/providers/shoe_size_provider.dart';

class ShoeSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ShoeSizePreview({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: fullScreen ? 5 : 20, vertical: fullScreen ? 5 : 10),
        width: double.infinity,
        height: fullScreen ? screenSize.height * 0.47 : screenSize.height * 0.52,
        decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: fullScreen
                ? BorderRadius.circular(20)
                : BorderRadius.circular(50)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [_ShoeWithShadow(), if (!fullScreen) _ShoeSizes()],
        ));
  }
}

class _ShoeSizes extends StatelessWidget {
  const _ShoeSizes({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeSizes =
        Provider.of<ShoeSizeProvider>(context, listen: false).shoeSizes;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<_ShoeSizeBox>.generate(
          shoeSizes.length, (index) => _ShoeSizeBox(shoeSizes[index], index)),
    );
  }
}

class _ShoeSizeBox extends StatelessWidget {
  final double _shoeSize;
  final int _index;

  _ShoeSizeBox(this._shoeSize, this._index);

  @override
  Widget build(BuildContext context) {
    final shoeSizeModel = Provider.of<ShoeSizeProvider>(context);

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: shoeSizeModel.currentIndex == _index
                ? Color(0xffF1A23A)
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (shoeSizeModel.currentIndex == _index)
                BoxShadow(
                    color: Color(0xffEAA14E),
                    blurRadius: 10,
                    offset: Offset(0, 5))
            ]),
        child: Text(_shoeSize.toString().replaceAll('.0', ''),
            style: TextStyle(
                fontSize: 16,
                color: shoeSizeModel.currentIndex == _index
                    ? Colors.white
                    : Color(0xffF1A23A),
                fontWeight: FontWeight.bold)),
      ),
      onTap: () => shoeSizeModel.currentIndex = _index,
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ShoeColorProvider shoeColorProvider =
        Provider.of<ShoeColorProvider>(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: Stack(
        children: [
          Positioned(right: 5, bottom: 10, child: _ShoeShadow()),
          Image.asset(
              shoeColorProvider.shoeColors[shoeColorProvider.currentIndex].uri),
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: screenSize.width * 0.55,
        height: screenSize.height * 0.1,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xffEAA14E),
            blurRadius: 40,
          )
        ]),
      ),
    );
  }
}
