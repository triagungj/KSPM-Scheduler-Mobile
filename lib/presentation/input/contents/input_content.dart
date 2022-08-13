import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/schedule_status_label.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/session_expansion_tile.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/presentation/input/pages/request_schedule_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:varx_design_system/components/buttons/varx_button.dart';

class InputContent extends StatefulWidget {
  const InputContent({
    Key? key,
    this.type,
  }) : super(key: key);

  final StatusType? type;

  @override
  State<InputContent> createState() => _InputContentState();
}

class _InputContentState extends State<InputContent> {
  final meetNotifier = ValueNotifier<List<Meet>>([]);

  Future<void> _launchInBrowser(String phoneNumber) async {
    try {
      await launchUrl(
        Uri(
          scheme: 'https',
          host: 'api.whatsapp.com',
          path: 'send',
          query: 'phone=$phoneNumber',
        ),
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final listString = [
      'Hari Senin',
      'Hari Selasa',
      'Hari Rabu',
      'Hari Kamis',
      'Hari Jumat',
    ];

    final listSession = [
      Session(sessionName: '09:00 - 10.30', sessionStatus: true),
      Session(sessionName: '09:00 - 10.30', sessionStatus: false),
      Session(sessionName: '09:00 - 10.30', sessionStatus: false),
      Session(sessionName: '09:00 - 10.30', sessionStatus: false),
    ];
    meetNotifier.value = [
      Meet(title: listString[0], listSession: listSession),
      Meet(title: listString[1], listSession: listSession),
      Meet(title: listString[2], listSession: listSession),
      Meet(title: listString[3], listSession: listSession),
      Meet(title: listString[4], listSession: listSession),
    ];
    if (widget.type != null) {
      return requestedSection(widget.type!, listSession);
    }

    return emptySection();
  }

  Widget requestedSection(StatusType type, List<Session> listSession) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ScheduleStatusLabel(
            type: type,
          ),
        ),
        Column(
          children: List.generate(
            meetNotifier.value.length,
            (index) => SessionExpansionTile(
              title: meetNotifier.value[index].title,
              listSession: listSession,
              isEnabled: false,
            ),
          ),
        ),
        const Divider(height: 10, thickness: 10),
        if (type == StatusType.requested)
          Padding(
            padding: const EdgeInsets.all(20),
            child: RichText(
              text: TextSpan(
                text:
                    '''Jadwal bersedia kamu sedang diajukan ke petugas. Silakan menunggu petugas untuk konfirmasi, atau bisa menghubungi petugas dengan ''',
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: 'klik disini.',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchInBrowser(
                          '6282262401237',
                        );
                      },
                  ),
                ],
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        if (type == StatusType.declined)
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Jadwal yang kamu ajukan ditolak oleh Petugas Jadwal.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 15),
                Text(
                  'Catatan dari Petugas Jadwal',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  controller: TextEditingController(
                      text:
                          '''Hari jumat kamu tidak ada jadwal, mengapa tidak menginputkan jika sedia?'''),
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.surfaceVariant,
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                      ),
                    ),
                  ),
                  enabled: false,
                  maxLines: 5,
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: VarxButton(
                        fullWidth: false,
                        label: 'Hubungi Petugas',
                        primary:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: VarxButton(
                        fullWidth: false,
                        label: 'Ubah Jadwal',
                        primary: Theme.of(context).colorScheme.primary,
                        onTap: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        if (type == StatusType.accepted)
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  '''Jadwal yang kamu ajukan telah disetujui oleh petugas. Ajuan jadwal yang telah disetujui tidak dapat diubah lagi. Segera hubungi petugas apabila diperlukan.''',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 15),
                VarxButton(
                  label: 'Hubungi Petugas',
                  prefixIconData: FluentIcons.chat_20_regular,
                  primary: Theme.of(context).colorScheme.primary,
                  onTap: () {},
                ),
              ],
            ),
          ),
        const Divider(height: 10, thickness: 10),
        if (type == StatusType.requested)
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Ingin mengubah Jadwal Sedia kamu?'),
                const SizedBox(height: 15),
                VarxButton(
                  label: 'Ubah Jadwal',
                  primary: Theme.of(context).colorScheme.primary,
                  onTap: () {},
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget emptySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: Get.height * 1 / 5),
        const Center(
          child: StateInfo(
            type: StateInfoType.reschedule,
            title: 'Kamu belum selesai menginputkan Jadwal Sedia kamu',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            onPressed: () => Get.toNamed<void>(RequestSchedulePage.route),
            child: const Text('Mulai Input Jadwal'),
          ),
        ),
      ],
    );
  }
}
