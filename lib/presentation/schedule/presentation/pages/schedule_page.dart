
import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/presentation/contents/schedule_content.dart';
// import 'package:kspm_scheduler_mobile/presentation/schedule/presentation/contents/meet_content.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final sharedPrefs = sl<SharedPrefs>();
  @override
  Widget build(BuildContext context) {
    final emptyNotifier = ValueNotifier<bool>(false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          emptyNotifier.value = !emptyNotifier.value;
        },
        child: ListView(
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: emptyNotifier,
              builder: (context, _value, _widget) {
                return ScheduleContent(scheduleEmpty: _value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
