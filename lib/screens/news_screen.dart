import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<dynamic> _news = [];
  bool _isLoading = false;

  void _fetchNews() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse('https://blog.playstation.com/wp-json/wp/v2/posts')); // Reemplaza con tu URL de API de WordPress
    final data = jsonDecode(response.body);

    setState(() {
      _news = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/play.jpg', // Ruta de tu imagen de logo
              width: 200, // Ancho deseado para el logo
              height: 200, // Alto deseado para el logo
            ),
            SizedBox(width: 10),
            Text('Noticias'),
          ],
        ),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: _news.length,
                itemBuilder: (context, index) {
                  final post = _news[index];
                  return ListTile(
                    title: Text(post['title']['rendered']),
                    subtitle: Text(post['excerpt']['rendered']),
                    trailing: IconButton(
                      icon: Icon(Icons.open_in_browser),
                      onPressed: () {
                        launch(post['link']);
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
