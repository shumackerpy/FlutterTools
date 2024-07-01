import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GenderScreen extends StatefulWidget {
  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  final TextEditingController _controller = TextEditingController();
  String _gender = '';
  bool _isLoading = false;

  void _predictGender(String name) async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse('https://api.genderize.io/?name=$name'));
    final data = jsonDecode(response.body);

    setState(() {
      _gender = data['gender'] ?? 'unknown';
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predicir genero'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Ingresar nombre'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _predictGender(_controller.text);
              },
              child: Text('Predecir'),
            ),
            if (_isLoading) CircularProgressIndicator(),
            if (!_isLoading && _gender.isNotEmpty)
              Container(
                color: _gender == 'male' ? Colors.blue : Colors.pink,
                child: Text(
                  'Gender: $_gender',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                padding: EdgeInsets.all(16.0),
              ),
          ],
        ),
      ),
    );
  }
}
