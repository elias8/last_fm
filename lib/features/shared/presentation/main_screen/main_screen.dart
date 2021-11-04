import 'package:flutter/material.dart';

import '../../../../config/config.dart';
import '../../../features.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _currentPageIndex,
      children: [
        AlbumsScreen(bottomNavigationBar: _buildBottomNavigationBar()),
        ArtistSearchScreen(bottomNavigationBar: _buildBottomNavigationBar()),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: _onPageSelected,
      currentIndex: _currentPageIndex,
      items: [
        BottomNavigationBarItem(
          label: context.l10n.home,
          icon: const Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: context.l10n.artist,
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  void _onPageSelected(int selectedPageIndex) {
    if (selectedPageIndex != _currentPageIndex) {
      _currentPageIndex = _currentPageIndex == 0 ? 1 : 0;
      setState(() {});
    }
  }
}
