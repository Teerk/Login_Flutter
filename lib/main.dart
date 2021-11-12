import 'package:flutter/material.dart';
import 'package:login_app/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos app',
      initialRoute: 'login',
      routes: {
        'login': (_) {
          return LoginScreen();
        },
        'home':(_){
          return HomeScreen();
        }
      },
    );
  }
}