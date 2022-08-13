import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/buttom_button_confirmation.dart';
import 'package:kspm_scheduler_mobile/presentation/input/contents/request_schedule_content.dart';

class RequestSchedulePage extends StatelessWidget {
  const RequestSchedulePage({Key? key}) : super(key: key);
  static const String route = '/requestSchedulePage';

  @override
  Widget build(BuildContext context) {
    final agreementNotifier = ValueNotifier<bool>(false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajuan Jadwal'),
      ),
      body: RequestScheduleContent(
        agreementNotifier: agreementNotifier,
      ),
      bottomNavigationBar: ValueListenableBuilder<bool>(
        valueListenable: agreementNotifier,
        builder: (context, _value, _widget) {
          return ButtomButtonConfirmation(
            onPressedRightButton: _value ? () {} : null,
            onPressedLeftButton: () {},
          );
        },
      ),
    );
  }
}
