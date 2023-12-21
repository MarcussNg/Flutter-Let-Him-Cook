import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:let_him_cook/base_template/base_stateful_page.dart';
import 'package:let_him_cook/utils/constants.dart';
import 'package:let_him_cook/view/favourites_page.dart';
import 'package:let_him_cook/view/home_page.dart';
import 'package:let_him_cook/view/settings_page.dart';

class MainTabPage extends BaseStatefulPage {
  final BottomTabEnum selectedTab;

  MainTabPage({this.selectedTab = BottomTabEnum.home});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends BaseStatefulState<MainTabPage> {
  var _selectedTabIndex = 0;
  final _pages = [HomePage(), FavouritesPage(), SettingsPage()];

  final _items = [
    BottomNavigationBarItem(
        icon: SvgPicture.asset('lib/asset/images/home.svg'),
        activeIcon: SvgPicture.asset('lib/asset/images/home_filled.svg'),
        label: "Home",
        tooltip: ''),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('lib/asset/images/heart.svg'),
        activeIcon: SvgPicture.asset('lib/asset/images/heart_filled.svg'),
        label: "Favourites",
        tooltip: ''),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('lib/asset/images/gear.svg'),
        activeIcon: SvgPicture.asset('lib/asset/images/gear_filled.svg'),
        label: "Settings",
        tooltip: ''),
  ];

  @override
  bool topSafeAreaEnabled() => false;

  @override
  Widget body() {
    return _pages[_selectedTabIndex];
  }

  @override
  BottomNavigationBar? bottomNavigationBar() => BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red,
        items: _items,
        currentIndex: _selectedTabIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        //selectedLabelStyle: CustomStyles.bottomTabSelectedTextStyle,
        //unselectedLabelStyle: CustomStyles.bottomTabUnselectedTextStyle,
        showUnselectedLabels: true,
        onTap: _onTabItemTapped,
      );

  void _setState(void Function() fn) {
    if (mounted) setState(fn);
  }
}

extension _Actions on _MainTabPageState {
  void _onTabItemTapped(int index) {
    _setState(() => _selectedTabIndex = index);
  }
}
