import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/buttom_button_confirmation.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/custom_dialog.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/partisipant_card.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/session_expansion_tile.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/widgets/schedule_status_icon.dart';
import 'package:varx_design_system/components/buttons/varx_button.dart';

class DetailValidationContent extends StatefulWidget {
  const DetailValidationContent({
    Key? key,
    this.type,
    required this.onRefresh,
  }) : super(key: key);

  final ScheduleStatusType? type;
  final Future<void> Function() onRefresh;

  @override
  State<DetailValidationContent> createState() =>
      _DetailValidationContentState();
}

class _DetailValidationContentState extends State<DetailValidationContent> {
  final meetNotifier = ValueNotifier<List<Meet>>([]);

  final document = ValueNotifier<PDFDocument?>(null);
  bool isError = false;

  Future<void> getDocument() async {
    try {
      document.value =
          await PDFDocument.fromURL('https://triagungj.site/storage/coba.pdf');
    } catch (e) {
      setState(() {
        isError = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDocument();
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

    final bottomNavBar = ButtomButtonConfirmation(
      leftWidget: const Icon(
        FluentIcons.dismiss_16_filled,
      ),
      labelLeft: 'Tolak',
      primaryLeft: Theme.of(context).colorScheme.error,
      labelRight: 'Konfirmasi',
      onPressedRightButton: widget.type == ScheduleStatusType.declined ||
              widget.type == ScheduleStatusType.requested
          ? () => Get.dialog<void>(
                CustomDialog(
                  confirmText: 'Terima Jadwal',
                  content: const StateInfo(
                    title: 'Terima Jadwal Sedia',
                    type: StateInfoType.reschedule,
                    subTitle: 'Pastikan Jadwal Sedia sudah valid',
                  ),
                  primary: Theme.of(context).colorScheme.primary,
                  onConfirm: () {},
                ),
              )
          : null,
      onPressedLeftButton: widget.type == ScheduleStatusType.accepted ||
              widget.type == ScheduleStatusType.requested
          ? () => Get.dialog<void>(
                CustomDialog(
                  confirmText: 'Tolak Jadwal',
                  content: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Tolak Jadwal Sedia',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          maxLines: 5,
                          decoration: const InputDecoration(
                            hintText: 'Berikan alasan menolak jadwal',
                          ),
                        )
                      ],
                    ),
                  ),
                  onConfirm: () {},
                ),
              )
          : null,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Validasi Jadwal Pengurus'),
      ),
      bottomNavigationBar: (widget.type != null) ? bottomNavBar : null,
      body: RefreshIndicator(
        onRefresh: widget.onRefresh,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (widget.type == ScheduleStatusType.accepted ||
                  widget.type == ScheduleStatusType.declined)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Validator: Faradhika M.D.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Tanggal Validasi: 22 Mei 2022, 15:30',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                  ],
                                ),
                              ),
                              ScheduleStatusIcon(
                                isAccepted:
                                    widget.type == ScheduleStatusType.accepted,
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          if (widget.type == ScheduleStatusType.declined)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Alasan Ditolak',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  controller: TextEditingController(
                                    text: 'Jadwal tidak valid',
                                  ),
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                  enabled: false,
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const Divider(height: 5, thickness: 5),
                  ],
                ),
              const PartisipantCard(
                textName: 'Faradhika MD',
                textPosition: 'Staff HRD',
                textNumber: 'P5180111136238',
                phoneNumber: '6282327495261',
              ),
              const SizedBox(height: 10),
              if (widget.type != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Keterangan',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: TextEditingController(
                              text:
                                  '''Saya ada jadwal untuk jadi asisten dosen pada hari kamis pukul 12.50''',
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                            enabled: false,
                            decoration: InputDecoration(
                              hintStyle: Theme.of(context).textTheme.bodySmall,
                            ),
                            maxLines: 5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Bukti Jadwal',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      height: 400,
                      child: isError
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: StateInfo(
                                  title: 'Dokumen Tidak Tersedia',
                                  type: StateInfoType.calendarEmpty,
                                ),
                              ),
                            )
                          : ValueListenableBuilder<PDFDocument?>(
                              valueListenable: document,
                              builder: (context, _value, _widget) {
                                if (_value != null) {
                                  return PDFViewer(
                                    document: document.value!,
                                  );
                                }
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                    ),
                    const Divider(thickness: 8, height: 8),
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
                  ],
                )
              else
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.15),
                      const StateInfo(
                        title: 'Lintang Wahyu belum menginputkan jadwal',
                        type: StateInfoType.calendarEmpty,
                      ),
                      VarxButton(
                        label: 'Hubungi Lintang',
                        prefixIconData: FluentIcons.chat_24_regular,
                        onTap: () {},
                      ),
                      SizedBox(height: Get.height * 0.25),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
