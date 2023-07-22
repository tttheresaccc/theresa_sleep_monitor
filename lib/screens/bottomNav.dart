import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:theresa_test/screens/home_page.dart';
import 'package:theresa_test/screens/suggestion_page.dart';
import 'package:theresa_test/screens/log_page.dart';
import 'package:theresa_test/screens/community_page.dart';
import 'package:theresa_test/screens/profile_page.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  BottomNavPageState createState() => BottomNavPageState();
}

class BottomNavPageState extends State<BottomNavPage> {
  @override
  //Keeping the loading screen on screen for a certain amount of time.
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      FlutterNativeSplash.remove();
    });
  }

  int _selectedIndex = 0;

  final List<Widget> _children = [
    const HomePage(title: 'Home'),
    const SuggestionsPage(title: 'Suggestion'),
    const LogPage(title: 'Log'),
    const CommunityPage(title: 'Community'),
    const ProfilePage(title: 'Profile'),
  ];

  //Functions on tap. When we tap the item, the state changes to the selected sceeen.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
          //The image set (asset).
          image: AssetImage('assets/navbar.png'), // Replace with the correct path to your image
          fit: BoxFit.cover,
        ),
        ),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/home_icon.png'),
            ),
            label: '',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/suggestion_icon.png'),
            ),
            label: '',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/log_icon.png'),
            ),
            label: '',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/community_icon.png'),
            ),
            label: '',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/profile_icon.png'),
            ),
            label: '',
            backgroundColor: Colors.transparent,
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        onTap: onItemTapped,
      ),
    );
  }
}