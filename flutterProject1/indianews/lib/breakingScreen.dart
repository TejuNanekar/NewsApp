import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:indianews/fullArticleScreen.dart';
import 'package:indianews/expandabletext.dart';

import 'dart:convert';

class BreakingNewsScreen extends StatefulWidget {
  @override
  _BreakingNewsScreenState createState() => _BreakingNewsScreenState();
}

class _BreakingNewsScreenState extends State<BreakingNewsScreen> {
  late List<dynamic> _breakingNews =[];

  @override
  void initState() {
    super.initState();
    _loadBreakingNews();
  }

  Future<void> _loadBreakingNews() async {
    final String apiUrl =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=5a4da311f55a45319c0a16cffdf81f3a'; // Replace this with your News API endpoint

    try {
      final response = await http.get(Uri.parse(apiUrl));

      final jsonData = json.decode(response.body);

      setState(() {
        _breakingNews = jsonData['articles'];
      });
    } catch (error) {
      print('Error fetching breaking news: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breaking News',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      ),
      body: FractionallySizedBox(
        heightFactor: 0.9,
        child: _breakingNews.isNotEmpty
            ? ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _breakingNews.length,
          itemBuilder: (context, index) {
            final article = _breakingNews[index];
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
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: 300,
                  height: 500,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          article['urlToImage'] ?? '',
                          height: 130,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: ExpandableText(
                            text: article['title'] ?? '',

                        ),
                        )],
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
      ),
    );
  }
}
