import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ParitipantButtomNavigation extends StatelessWidget {
  const ParitipantButtomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  final int selectedIndex;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    const _navbarItems = [
      BottomNavigationBarItem(
        label: 'Home',
        activeIcon: Icon(
          FluentIcons.home_16_filled,
        ),
        icon: Icon(
          FluentIcons.home_16_regular,
        ),
      ),
      BottomNavigationBarItem(
        label: 'Jadwal',
        activeIcon: Icon(
          FluentIcons.calendar_ltr_24_filled,
        ),
        icon: Icon(
          FluentIcons.calendar_ltr_24_regular,
        ),
      ),
      BottomNavigationBarItem(
        label: 'Input',
        activeIcon: Icon(FluentIcons.calendar_add_20_filled),
        icon: Icon(
          FluentIcons.calendar_add_20_regular,
        ),
      ),
      BottomNavigationBarItem(
        label: 'Profil',
        activeIcon: Icon(FluentIcons.person_20_filled),
        icon: Icon(
          FluentIcons.person_20_regular,
        ),
      ),
    ];
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onTap,
      items: _navbarItems.map((e) => e).toList(),
    );
  }
}
