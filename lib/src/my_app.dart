import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/pages/shoes_page.dart';
import 'package:shoes_app/src/providers/shoe_color_provider.dart';
import 'package:shoes_app/src/providers/shoe_size_provider.dart';
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoeSizeProvider()),
        ChangeNotifierProvider(create: (context) => ShoeColorProvider())
      ],
          child: MaterialApp(
        title: 'Shoes app',
        debugShowCheckedModeBanner: false,
        home: ShoesPage()
      ),
    );
  }
}