import 'package:coinapp/pages/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:coinapp/pages/home.dart';
import 'package:coinapp/pages/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CoinApp());
}

class CoinApp extends StatelessWidget {
  const CoinApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Loading(),
          '/home': (context) => Home(),
          '/auth': (context) => Authentication(),
        }
    );
  }
}
