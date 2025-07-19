
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'shop_screen.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initializes Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MarketConnect',
      theme: ThemeData(primarySwatch: Colors.green),
      home: ShopScreen(), // Default screen is shop
    );
  }
}
 