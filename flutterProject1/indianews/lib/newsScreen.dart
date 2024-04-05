import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'category.dart'; // Import the Category class

class NewsScreen extends StatefulWidget {
  final Category category;

  NewsScreen({required this.category});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<dynamic> _news = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _fetchNews() async {
    final apiKey = '5a4da311f55a45319c0a16cffdf81f3a';
    final category = widget.category.name.toLowerCase();
    final apiUrl = 'https://newsapi.org/v2/top-headlines?category=$category&apiKey=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      final jsonData = json.decode(response.body);

      if (mounted) {
        setState(() {
          _news = jsonData['articles'];
          _loading = false;
        });
      }
    } catch (error) {
      print('Error fetching news: $error');
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Related News'),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _news.length, // Corrected property
              itemBuilder: (context, index) {
                final article = _news[index];
                return ListTile(
                  title: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              // article['urlToImage'] ?? '',
                              // height: 150,
                              // width: double.infinity,
                              // fit: BoxFit.cover,
                              article['urlToImage'] != null && article['urlToImage'].isNotEmpty
                                  ? article['urlToImage']
                                  : 'https://via.placeholder.com/150', // Placeholder image URL
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                article['title'] ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                article['description'] ?? '',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
