import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
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
      appBar: AppBar(
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
      ),
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
      bottomNavigationBar: Stack(
        children: [
          AnimatedBottomNavigationBar(
            icons: const [
              Icons.home,
              Icons.calendar_month_rounded,
              Icons.history,
              Icons.person,
            ],
            activeIndex: _bottomNavIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.defaultEdge,
            onTap: (index) {
              setState(() => _bottomNavIndex = index);
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            backgroundColor: Colors.white,
            activeColor: Colors.black,
            inactiveColor: Colors.black,
            iconSize: 24,
            splashColor: Colors.blue.withOpacity(0.3),
            splashSpeedInMilliseconds: 300,
            splashRadius: 20,
          ),
          Positioned(
            bottom: 6,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                return Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _bottomNavIndex == index
                        ? Color(0xff578e54)
                        : Colors.transparent,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
