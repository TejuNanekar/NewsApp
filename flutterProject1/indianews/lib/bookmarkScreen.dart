import 'package:flutter/material.dart';

class BookmarkScreen extends StatefulWidget {
  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  List<dynamic> _bookmarkedNews = [];

  // Function to toggle bookmark status of a news article
  void toggleBookmark(dynamic article) {
    // Check if the article is already bookmarked
    bool isBookmarked = _bookmarkedNews.contains(article);

    setState(() {
      if (isBookmarked) {
        // If already bookmarked, remove it from bookmarks
        _bookmarkedNews.remove(article);
      } else {
        // If not bookmarked, add it to bookmarks
        _bookmarkedNews.add(article);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build your UI to display the bookmarked news articles
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarked News'),
      ),
      body: ListView.builder(
        itemCount: _bookmarkedNews.length,
        itemBuilder: (context, index) {
          final article = _bookmarkedNews[index];
          return ListTile(
            title: Text(article['title'] ?? ''),
            subtitle: Text(article['description'] ?? ''),
            onTap: () {
              // You can add navigation logic to view the full article here
            },
          );
        },
      ),
    );
  }
}
