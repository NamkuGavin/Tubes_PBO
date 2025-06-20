import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/constant/assets.dart';
import '../../../../common/constant/color_value.dart';
import 'views/manage_kost_view.dart';
import 'views/profile_view.dart';

class BuildPemilikNavigation extends StatefulWidget {
  const BuildPemilikNavigation({super.key});

  @override
  State<BuildPemilikNavigation> createState() => _BuildPemilikNavigationState();
}

class _BuildPemilikNavigationState extends State<BuildPemilikNavigation> {
  int _currentIndex = 0;
  final List _pageStack = [];

  final _tabs = [
    const ManageKostView(),
    const ProfileView(),
  ];

  void _pagePush(int i) {
    if (_pageStack.isEmpty) {
      _pageStack.add(_currentIndex);
    }
    if (i == _currentIndex) {
      return;
    }
    if (!_pageStack.contains(_currentIndex)) {
      _pageStack.add(_currentIndex);
    }

    setState(() {
      _currentIndex = i;
    });
  }

  Future<bool> _pagePop(BuildContext context) {
    if (_pageStack.isEmpty) {
      return Future<bool>.value(true);
    } else {
      int t = _pageStack.removeLast();
      setState(() {
        _currentIndex = (_currentIndex != t) ? t : _pageStack.removeLast();
      });
      return Future<bool>.value(false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _pagePop(context),
      child: Scaffold(
        body: _tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.kost2, height: 30),
              activeIcon: SvgPicture.asset(IconAssets.kost2, height: 30, color: MyColor.mainBlue),
              label: 'Manage Kost',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.person, height: 30),
              activeIcon: SvgPicture.asset(IconAssets.person, height: 30, color: MyColor.mainBlue),
              label: 'Profil',
            ),
          ],
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: MyColor.mainBlue,
          selectedFontSize: 15,
          unselectedFontSize: 15,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          elevation: 5,
          backgroundColor: Colors.white,
          onTap: (index) {
            _pagePush(index);
          },
        ),
      ),
    );
  }
}
