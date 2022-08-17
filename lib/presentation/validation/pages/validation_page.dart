import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
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
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ListView(
            shrinkWrap: true,
            children: const [
              ScheduleMenuButton(
                privilegeType: PrivilegeType.pengurus,
                notValidated: 5,
                rejected: 3,
                empty: 4,
                validated: 98,
                accepted: 88,
                total: 90,
              ),
              SizedBox(height: 10),
              ScheduleMenuButton(
                privilegeType: PrivilegeType.anggota,
                notValidated: 5,
                rejected: 3,
                empty: 4,
                validated: 98,
                accepted: 88,
                total: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
