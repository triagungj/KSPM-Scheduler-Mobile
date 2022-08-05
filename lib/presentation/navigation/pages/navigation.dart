import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/presentation/home/pages/home_page.dart';
import 'package:kspm_scheduler_mobile/presentation/input/pages/request_schedule_page.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/presentation/profile_page.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/presentation/schedule_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  static const route = '/navigationPage';

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    const _widgetItems = [
      HomePage(),
      SchedulePage(),
      RequestSchedulePage(),
      ProfilePage(),
    ];

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

    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, _value, _widget) {
          return IndexedStack(
            index: _selectedIndex.value,
            children: _widgetItems.map((e) => e).toList(),
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, _value, _widget) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _value,
            onTap: (index) {
              _selectedIndex.value = index;
            },
            items: _navbarItems.map((e) => e).toList(),
          );
        },
      ),
    );
  }
}
