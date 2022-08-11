import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/buttom_button_pagination.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/presentation/contents/session_content.dart';

class SessionPage extends StatelessWidget {
  const SessionPage({Key? key}) : super(key: key);
  static const route = '/meetPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Pengurus'),
      ),
      body: const SessionContent(),
      bottomNavigationBar: ButtomButtonPagination(
        labelNext: 'Pertemuan Materi 2',
        onNext: () {},
      ),
    );
  }
}
