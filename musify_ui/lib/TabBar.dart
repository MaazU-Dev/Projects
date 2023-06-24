import 'package:flutter/material.dart';
import 'package:musify_ui/LibraryView.dart';

import 'HomeView.dart';
import 'ProfileView.dart';
import 'SearchView.dart';

class myTabBar extends StatefulWidget {
  const myTabBar({Key? key}) : super(key: key);

  @override
  State<myTabBar> createState() => _myTabBarState();
}

class _myTabBarState extends State<myTabBar> {
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: Stack(
        children: [
          renderView(0, const HomeView()),
          renderView(1, const SearchView()),
          renderView(2, const LibraryView()),
          renderView(3, const ProfileView()),
        ],
      ),
    );
  }

  Widget renderView(int selectedInd, Widget wid) {
    return IgnorePointer(
          ignoring: _selectedIndex != selectedInd,
          child: Opacity(
            opacity: _selectedIndex == selectedInd ? 1 : 0,
            child: wid,
          ),
        );
  }
}
