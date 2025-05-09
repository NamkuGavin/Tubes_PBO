import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tubes_pbo/app/common/constant/assets.dart';
import 'package:tubes_pbo/app/common/constant/color_value.dart';
import 'package:tubes_pbo/app/modules/roles/penghuni/navigation/views/home_view.dart';
import 'package:tubes_pbo/app/modules/roles/penghuni/navigation/views/kost_view.dart';
import 'package:tubes_pbo/app/modules/roles/penghuni/navigation/views/profile_view.dart';

class BuildNavigation extends StatefulWidget {
  const BuildNavigation({super.key});

  @override
  State<BuildNavigation> createState() => _BuildNavigationState();
}

class _BuildNavigationState extends State<BuildNavigation> {
  int _currentIndex = 0;
  final List _pageStack = [];

  final _tabs = [
    const HomeView(),
    const KostView(),
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
    _currentIndex = 1;
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
              icon: SvgPicture.asset(IconAssets.home, height: 25),
              activeIcon:
                  SvgPicture.asset(IconAssets.home, height: 25, color: MyColor.mainBlue),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.kost2, height: 30),
              activeIcon:
                  SvgPicture.asset(IconAssets.kost2, height: 30, color: MyColor.mainBlue),
              label: 'Kost',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconAssets.person, height: 30),
              activeIcon:
                  SvgPicture.asset(IconAssets.person, height: 30, color: MyColor.mainBlue),
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
          onTap: (index) {
            _pagePush(index);
          },
        ),
      ),
    );
  }
}
