import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/constants/key_constants.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/presentation/home/pages/home_page.dart';
import 'package:kspm_scheduler_mobile/presentation/input/pages/input_page.dart';
import 'package:kspm_scheduler_mobile/presentation/navigation/widgets/partisipant_buttom_navigation.dart';
import 'package:kspm_scheduler_mobile/presentation/navigation/widgets/petugas_bottom_navigation.dart';
import 'package:kspm_scheduler_mobile/presentation/profile/presentation/profile_page.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/pages/schedule_page.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/pages/validation_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({
    Key? key,
    this.selectedIndex = 0,
  }) : super(key: key);

  static const route = '/navigationPage';

  final int selectedIndex;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final _selectedIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    _selectedIndex.value = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sharedPrefs = sl<SharedPrefs>();
    final isPetugas = sharedPrefs.getBool(KeyConstants.keyIsPetugas) ?? false;

    const _widgetItems = [
      HomePage(),
      SchedulePage(),
      InputSchedulePage(),
      ProfilePage(),
    ];

    const _widgetItemsPetugas = [
      HomePage(),
      ValidationPage(),
      SchedulePage(),
      ProfilePage(),
    ];

    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, _value, _widget) {
          return IndexedStack(
            index: _selectedIndex.value,
            children: isPetugas
                ? _widgetItemsPetugas.map((e) => e).toList()
                : _widgetItems.map((e) => e).toList(),
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, _value, _widget) {
          if (isPetugas) {
            return PetugasButtomNavigation(
              selectedIndex: _value,
              onTap: (index) {
                _selectedIndex.value = index;
              },
            );
          }

          return ParitipantButtomNavigation(
            selectedIndex: _value,
            onTap: (index) {
              _selectedIndex.value = index;
            },
          );
        },
      ),
    );
  }
}
