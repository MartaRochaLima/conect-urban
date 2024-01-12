import "package:flutter/material.dart";
import 'pages/logindapagina.dart';
import 'pages/recuperarsenha.dart';
import 'pages/criarconta.dart';
import 'pages/destino.dart';
import "pages/recarga.dart";




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Bus',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
