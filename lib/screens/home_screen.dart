import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToolBox Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/toolbox.jpg'), // Asegúrate de tener esta imagen en tu carpeta de assets
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/gender');
              },
              child: Text('Prediccion de genero'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/age');
              },
              child: Text('Prediccion de edad'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/universities');
              },
              child: Text('Universidades'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/weather');
              },
              child: Text('Clima'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/news');
              },
              child: Text('Noticias'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Text('Acerca'),
            ),
          ],
        ),
      ),
    );
  }
}
