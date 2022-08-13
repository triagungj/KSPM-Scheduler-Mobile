import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/schedule_menu_button.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({Key? key}) : super(key: key);

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validasi Jadwal'),
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: ScheduleMenuButton(),
          ),
        ],
      ),
    );
  }
}
