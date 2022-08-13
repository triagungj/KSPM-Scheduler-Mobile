import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/avatar_edit.dart';
// import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/buttom_button_confirmation.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/list_tile_wtih_label.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/partisipant_card.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/schedule_info_card.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/schedule_status_label.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/session_expansion_tile.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/tile_label.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/uploaded_file_box.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/vertical_label.dart';

class Template extends StatefulWidget {
  const Template({Key? key}) : super(key: key);

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  final meetNofifier = ValueNotifier<List<Meet>>([]);

  @override
  Widget build(BuildContext context) {
    final listString = [
      'Pertemuan Materi 1',
      'Pertemuan Materi 2',
    ];

    final listSession = [
      Session(sessionName: '09:00 - 10.30', sessionStatus: true),
      Session(sessionName: '09:00 - 10.30', sessionStatus: false),
      Session(sessionName: '09:00 - 10.30', sessionStatus: false),
      Session(sessionName: '09:00 - 10.30', sessionStatus: false),
    ];

    meetNofifier.value = [
      Meet(title: listString[0], listSession: listSession),
      Meet(title: listString[1], listSession: listSession),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                child: AvatarEdit(
                  name: 'Tri Agung Jiwandono',
                  onEdit: () => Get.snackbar('cok', '12'),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: ScheduleInfoCard(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: ScheduleStatusLabel(type: StatusType.accepted),
            ),
            const TileLabel(
              label: 'Jadwal Belum Tervalidasi',
              suffixLabel: 'Total: 4',
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: UploadedFileBox(
                nameFile: 'Bukti KRS Tri Agung J.pdf',
                onDismiss: () => Get.snackbar('yuhu', 'ayo wisuda oktober'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                maxLines: 5,
              ),
            ),
            ValueListenableBuilder<List<Meet>>(
              valueListenable: meetNofifier,
              builder: (context, meetValue, _) {
                return Column(
                  children: List.generate(
                    meetValue.length,
                    (index) => SessionExpansionTile(
                      title: meetValue[index].title,
                      listSession: listSession,
                    ),
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: VerticalLabel(
                textAbove: 'Terakhir diperbarui',
                textBelow: '22 Mei 2022',
              ),
            ),
            const PartisipantCard(
              textName: 'Tri Agung Jiwandono',
              textPosition: 'Ketua Umum',
              textNumber: 'P3312000333',
              phoneNumber: '6282327495261',
            ),
            const StateInfo(
              type: StateInfoType.signOut,
              title: 'Kamu akan logout',
              subTitle: 'Pastikan kamu sudah',
            ),
            ListTileWithLabel(
              label: 'Jadwal Pengurus',
              listSubTitle: listString,
              onTap: (index) {},
            ),
          ],
        ),
      ),
      // bottomNavigationBar: ButtomButtonPagination(
      //   labelPrev: 'Pertemuan 1',
      //   labelNext: 'Pertemuan 2',
      //   onPrev: () {},
      //   onNext: () {},
      // ),
      // bottomNavigationBar: ConfirmationButtomButton(
      //   onPressedRightButton: () {},
      // ),
    );
  }
}
