import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/contents/detail_validation_content.dart';

class DetailValidationPage extends StatefulWidget {
  const DetailValidationPage({Key? key}) : super(key: key);

  static const String route = '/detailValidationPage';

  @override
  State<DetailValidationPage> createState() => _DetailValidationPageState();
}

class _DetailValidationPageState extends State<DetailValidationPage> {
  final scheduleType = ValueNotifier<ScheduleStatusType?>(null);

  Future<void> onRefresh() async {
    if (scheduleType.value == null) {
      scheduleType.value = ScheduleStatusType.requested;
    } else if (scheduleType.value == ScheduleStatusType.requested) {
      scheduleType.value = ScheduleStatusType.accepted;
    } else if (scheduleType.value == ScheduleStatusType.accepted) {
      scheduleType.value = ScheduleStatusType.rejected;
    } else {
      scheduleType.value = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ScheduleStatusType?>(
      valueListenable: scheduleType,
      builder: (context, _value, _widget) {
        return DetailValidationContent(
          type: _value,
          onRefresh: onRefresh,
        );
      },
    );
  }
}
