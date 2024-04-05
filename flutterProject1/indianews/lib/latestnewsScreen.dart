import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'fullArticleScreen.dart';
import 'dart:convert';

class LatestNewsScreen extends StatefulWidget {
  @override
  _LatestNewsScreenState createState() => _LatestNewsScreenState();
}

class _LatestNewsScreenState extends State<LatestNewsScreen> {
  late List<dynamic> _latestNews = [];

  @override
  void initState() {
    super.initState();
    _loadLatestNews();
  }

  Future<void> _loadLatestNews() async {
    final String apiUrl =
        'https://newsapi.org/v2/everything?q=apple&from=2024-03-31&to=2024-03-31&sortBy=popularity&apiKey=5a4da311f55a45319c0a16cffdf81f3a'; // Replace with your API endpoint

    try {
      final response = await http.get(Uri.parse(apiUrl));
      final jsonData = json.decode(response.body);

      setState(() {
        _latestNews = jsonData['articles'];
      });
    } catch (error) {
      print('Error fetching latest news: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Latest News',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      body: _latestNews.isNotEmpty
          ? ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _latestNews.length,
        itemBuilder: (context, index) {
          final article = _latestNews[index];
          return GestureDetector(
            onTap: () {
              // Navigate to a new screen to display the full article
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullArticleScreen(
                    article: article,
                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                width: 300,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        article['urlToImage'] ?? '',
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
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 8.0),
                      //   child: Text(
                      //     article['description'] ?? '',
                      //     style: TextStyle(fontSize: 14.0),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}