import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/foto.png'), // Asegúrate de tener esta imagen en tu carpeta de assets
            ),
            SizedBox(height: 20),
            Text('Shumacker Del Villar Lorenzo', style: TextStyle(fontSize: 24)),
            Text('shumackerlorenzo@gmail.com', style: TextStyle(fontSize: 18)),
            Text('829-784-0904', style: TextStyle(fontSize: 18)),
            Text('https://github.com/shumackerpy', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}
