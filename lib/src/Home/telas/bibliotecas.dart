import 'package:flutter/material.dart';

class Bibliotecas extends StatefulWidget {
  const Bibliotecas({Key? key}) : super(key: key);

  @override
  _BibliotecasState createState() => _BibliotecasState();
}

class _BibliotecasState extends State<Bibliotecas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Biblioteca", style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
