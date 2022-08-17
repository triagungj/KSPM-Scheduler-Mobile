import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/presentation/input/contents/input_content.dart';

class InputSchedulePage extends StatelessWidget {
  const InputSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusNotifier = ValueNotifier<ScheduleStatusType?>(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Jadwal'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          if (statusNotifier.value == null) {
            statusNotifier.value = ScheduleStatusType.requested;
          } else if (statusNotifier.value == ScheduleStatusType.requested) {
            statusNotifier.value = ScheduleStatusType.declined;
          } else if (statusNotifier.value == ScheduleStatusType.declined) {
            statusNotifier.value = ScheduleStatusType.accepted;
          } else {
            statusNotifier.value = null;
          }
        },
        child: ListView(
          children: [
            ValueListenableBuilder<ScheduleStatusType?>(
              valueListenable: statusNotifier,
              builder: (context, _value, __) {
                return InputContent(
                  type: _value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
