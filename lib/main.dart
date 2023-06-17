import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/alphabet_screen.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'screens/home_screen.dart';
import 'screens/math_module_screen.dart';
import 'screens/english_module_screen.dart';
import 'screens/addition_screen.dart';
import 'screens/subtraction_screen.dart';
import 'screens/counting_game_screen.dart';
import 'screens/words_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Failed to initialize Firebase: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kids Learning App',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => MyLogin(),
        '/ (context)':(context) =>  HomeScreen(),
        '/math_module': (context) => MathModuleScreen(),
        '/english_module': (context) => EnglishModuleScreen(),
        '/addition': (context) => AdditionScreen(),
        '/subtraction': (context) => SubtractionScreen(),
        '/counting': (context) => CountingGameScreen(),
        '/alphabets': (context) => AlphabetScreen(),
        '/words': (context) => WordsScreen(),
      },
    );
  }
}

