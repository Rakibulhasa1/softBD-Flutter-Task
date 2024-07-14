import 'package:flutter/material.dart';
import 'package:softbd/pages/history_page.dart';
import 'package:softbd/pages/profile_page.dart';
import 'calender_page.dart';
import 'home_content.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomNavIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    HomePageContent(),
    CalenderPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _bottomNavIndex == 0
          ? AppBar(
        title: Row(
          children: <Widget>[
            Image.asset(
              'icons/demo 1.png',
              height: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Flutter Task',
              style: TextStyle(fontFamily: 'Noto Serif Bengali', fontSize: 25),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(
              'icons/Group 1000002232.png',
              height: 40,
            ),
          ),
        ],
      )
          : null,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(),
              child: Text('Soft BD'),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _bottomNavIndex = index);
        },
        children: _pages,
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF72a35a),
              Color(0xFF437b4d),
            ],
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0.0,
          child: Image.asset(
            'icons/camera.png',
            width: 30,
            height: 30,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() => _bottomNavIndex = index);
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, 'icons/home.png',),
          _buildNavItem(1, 'icons/calender.png', ),
          _buildNavItem(2, 'icons/history.png', ),
          _buildNavItem(3, 'icons/profile.png', ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath,) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 24,
            height: 24,
            color: index == currentIndex ? Colors.black : Colors.grey,
          ),
        ],
      ),
    );
  }
}
