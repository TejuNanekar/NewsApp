import 'package:flutter/material.dart';
import 'category.dart'; // Import the Category class
import 'package:indianews/newsScreen.dart'; // Import the NewsScreen widget

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<Category> _categories = [
    Category('Business'),
    Category('Entertainment'),
    Category('Health'),
    Category('Science'),
    Category('Sports'),
    Category('Technology'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Categories'),
          ),
      body: Container(
        margin: const EdgeInsets.only(top: 0.0),
        height: 45, // Specify the height here
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NewsScreen(category: _categories[index]),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    _categories[index].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
