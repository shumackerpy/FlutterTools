import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgeScreen extends StatefulWidget {
  @override
  _AgeScreenState createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  final TextEditingController _controller = TextEditingController();
  int? _age;
  bool _isLoading = false;

  void _predictAge(String name) async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse('https://api.agify.io/?name=$name'));
    final data = jsonDecode(response.body);

    setState(() {
      _age = data['age'];
      _isLoading = false;
    });
  }

  String _getAgeCategory(int? age) {
    if (age == null) return 'unknown';
    if (age < 18) return 'Young';
    if (age < 60) return 'Adult';
    return 'Elderly';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predecir edad'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Enter name'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _predictAge(_controller.text);
              },
              child: Text('Predecir'),
            ),
            if (_isLoading) CircularProgressIndicator(),
            if (!_isLoading && _age != null)
              Column(
                children: [
                  Text(
                    'Age: $_age',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Category: ${_getAgeCategory(_age)}',
                    style: TextStyle(fontSize: 24),
                  ),
                  Image.asset(_getAgeCategory(_age) == 'Young'
                      ? 'assets/young.png'
                      : _getAgeCategory(_age) == 'Adult'
                          ? 'assets/adult.jpg'
                          : 'assets/elderlyn.jpg'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
