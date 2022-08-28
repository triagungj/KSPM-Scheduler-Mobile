// import 'package:fluentui_system_icons/fluentui_system_icons.dart';
// import 'package:flutter/gestures.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/schedule_status_label.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/server_exception_widget.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/entities/schedule_request_entity.dart';
import 'package:kspm_scheduler_mobile/presentation/input/cubit/schedule_request_cubit.dart';
import 'package:kspm_scheduler_mobile/presentation/input/pages/request_schedule_page.dart';
import 'package:kspm_scheduler_mobile/presentation/input/widgets/session_expansion_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:varx_design_system/components/buttons/varx_button.dart';

class InputContent extends StatefulWidget {
  const InputContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ScheduleRequestDataEntity data;

  @override
  State<InputContent> createState() => _InputContentState();
}

class _InputContentState extends State<InputContent> {
  final scheduleRequestCubit = sl<ScheduleRequestCubit>();

  final listSessionNotifier = ValueNotifier<List<int>>([]);
  final petugasNoteController = TextEditingController();

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
  void initState() {
    super.initState();
    if (widget.data.status != null) {
      scheduleRequestCubit.getListSession();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.status != null) {
      listSessionNotifier.value = widget.data.sessionListId;
      petugasNoteController.text = widget.data.petugasNotes!;
      return requestedSection(
        widget.data.status!,
      );
    } else {
      return emptySection();
    }
  }

  Widget requestedSection(ScheduleStatusType type) {
    return BlocBuilder<ScheduleRequestCubit, ScheduleRequestState>(
      bloc: scheduleRequestCubit,
      builder: (context, state) {
        if (state is LoadingScheduleState) {
          return const LinearProgressIndicator();
        }
        if (state is FailureScheduleState) {
          return Column(
            children: [
              SizedBox(height: Get.height * 0.2),
              const ServerExceptionWidget(),
            ],
          );
        }
        if (state is SuccessGetListSessionState) {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ScheduleStatusLabel(
                  type: type,
                ),
              ),
              ValueListenableBuilder<List<int>>(
                valueListenable: listSessionNotifier,
                builder: (context, meetValue, _) {
                  return Column(
                    children: List.generate(
                      state.data.length,
                      (index) {
                        final data = state.data[index];
                        return SessionExpansionWidget(
                          title: 'Hari ${data.hari.name.capitalize}',
                          listSession: data.result,
                          sessionNotifier: listSessionNotifier,
                          enabled: false,
                        );
                      },
                    ),
                  );
                },
              ),
              const Divider(height: 10, thickness: 10),
              if (type == ScheduleStatusType.requested)
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
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
              if (type == ScheduleStatusType.rejected)
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
                        controller: petugasNoteController,
                        decoration: InputDecoration(
                          fillColor:
                              Theme.of(context).colorScheme.surfaceVariant,
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color:
                                  Theme.of(context).colorScheme.surfaceVariant,
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
                                primary: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                onTap: () {
                                  if (widget.data.nomorPetugas != null) {
                                    _launchInBrowser(
                                      widget.data.nomorPetugas!,
                                    );
                                  }
                                }),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: VarxButton(
                              fullWidth: false,
                              label: 'Ubah Jadwal',
                              primary: Theme.of(context).colorScheme.primary,
                              onTap: () => Get.toNamed<void>(
                                RequestSchedulePage.route,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              if (type == ScheduleStatusType.accepted)
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
                        onTap: () {
                          if (widget.data.nomorPetugas != null) {
                            _launchInBrowser(
                              widget.data.nomorPetugas!,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              const Divider(height: 10, thickness: 10),
              if (type == ScheduleStatusType.requested)
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
                        onTap: () => Get.toNamed<void>(
                          RequestSchedulePage.route,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        }
        return const SizedBox();
      },
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
