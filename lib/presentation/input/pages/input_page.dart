import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/schedule_status_label.dart';
import 'package:kspm_scheduler_mobile/presentation/input/contents/input_content.dart';

class InputSchedulePage extends StatelessWidget {
  const InputSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusNotifier = ValueNotifier<StatusType?>(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Jadwal'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          if (statusNotifier.value == null) {
            statusNotifier.value = StatusType.requested;
          } else if (statusNotifier.value == StatusType.requested) {
            statusNotifier.value = StatusType.declined;
          } else if (statusNotifier.value == StatusType.declined) {
            statusNotifier.value = StatusType.accepted;
          } else {
            statusNotifier.value = null;
          }
        },
        child: ListView(
          children: [
            ValueListenableBuilder<StatusType?>(
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
