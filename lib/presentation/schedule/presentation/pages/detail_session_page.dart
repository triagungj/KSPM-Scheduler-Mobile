import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/buttom_button_pagination.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/presentation/contents/detail_session_content.dart';

class DetailSessionPage extends StatelessWidget {
  const DetailSessionPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  static const route = '/detailSessionPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const DetailSessionContent(),
      bottomNavigationBar: ButtomButtonPagination(
        labelNext: 'Sesi Selanjutnya',
        onNext: () => Get.off<void>(const DetailSessionPage(title: 'Sesi 2')),
      ),
    );
  }
}
