import 'package:flutter/material.dart';
import 'package:indianews/breakingScreen.dart';
import 'package:indianews/categoryScreen.dart';
import 'package:indianews/latestnewsScreen.dart';
import 'package:indianews/bookmarkScreen.dart';
import 'package:indianews/profileScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // List of screens to navigate to
  final List<Widget> _screens = [
    HomeScreen(), // Placeholder for HomeScreen
    BookmarkScreen(), // Placeholder for BookmarkScreen
    // FeedScreen(), // Placeholder for FeedScreen
    ProfileScreen(), // Placeholder for ProfileScreen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "NewsApp",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2, // Adjust flex as needed
            child: CategoryScreen(),
          ),
          Expanded(
            flex: 5, // Adjust flex as needed
            child: BreakingNewsScreen(),
          ),
          Expanded(
            flex: 5, // Adjust flex as needed
            child: LatestNewsScreen(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: BottomNavigationBar(
          elevation: 0.0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.blue,
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookmarkScreen()),
              );
            } else {
              // Directly navigate to ProfileScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            }
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: "Bookmark",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.rss_feed_rounded),
              label: "Feed",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
