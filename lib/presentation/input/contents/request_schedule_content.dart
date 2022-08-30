import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/buttom_button_confirmation.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/snackbar.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/uploaded_file_box.dart';
import 'package:kspm_scheduler_mobile/data/schedule_request/models/requests/save_schedule_request_body.dart';
import 'package:kspm_scheduler_mobile/domain/schedule_request/entities/entities.dart';
import 'package:kspm_scheduler_mobile/presentation/input/cubit/schedule_request_cubit.dart';
import 'package:kspm_scheduler_mobile/presentation/input/widgets/session_expansion_widget.dart';
import 'package:kspm_scheduler_mobile/presentation/navigation/pages/navigation.dart';
import 'package:varx_design_system/components/buttons/varx_button.dart';

class RequestScheduleContent extends StatefulWidget {
  const RequestScheduleContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<SessionDataEntity> data;

  @override
  State<RequestScheduleContent> createState() => _RequestScheduleContentState();
}

class _RequestScheduleContentState extends State<RequestScheduleContent> {
  final dio = Dio();
  final scheduleRequestCubit = sl<ScheduleRequestCubit>();
  final listSessionNotifier = ValueNotifier<List<int>>([]);
  final notesParticipantController = TextEditingController();
  final fileNotifier = ValueNotifier<File?>(null);
  final fileUrlNotifier = ValueNotifier<String?>(null);
  final agreementNotifier = ValueNotifier<bool>(false);

  Future<void> getFile() async {
    await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    ).then((value) {
      if (value != null) {
        fileNotifier.value = File(value.files.single.path!);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    scheduleRequestCubit.getListMySession();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScheduleRequestCubit>(
      create: (context) => scheduleRequestCubit,
      child: BlocConsumer<ScheduleRequestCubit, ScheduleRequestState>(
        bloc: scheduleRequestCubit,
        listener: (context, state) {
          if (state is FailureScheduleState) {
            Get.snackbar(
              'Gagal',
              state.message,
              backgroundColor: Theme.of(context).colorScheme.error,
              colorText: Theme.of(context).colorScheme.onPrimary,
            );
          }
          if (state is SuccessLoadListMySessionState) {
            setState(() {
              listSessionNotifier.value.clear();
              listSessionNotifier.value.addAll(state.data.sessionListId);
              if (state.data.partisipanNotes != null) {
                notesParticipantController.text = state.data.partisipanNotes!;
              }
              if (state.data.bukti != null) {
                fileUrlNotifier.value = state.data.bukti;
              }
            });
          }
          if (state is SuccessSaveScheduleRequestState) {
            AppSnackbar.snackbarSuccess(
              'Berhasil!',
              'Berhasil menyimpan ajuan jadwal.',
            );
          }
          if (state is SuccessSendScheduleRequestState) {
            AppSnackbar.snackbarSuccess(
              'Berhasil!',
              'Berhasil mengirim ajuan jadwal.',
            );
            Future<void>.delayed(
              const Duration(milliseconds: 500),
              () => Get.offAllNamed<void>(
                NavigationPage.route,
                arguments: 2,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Inputkan Jadwal Sedia kamu',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      ValueListenableBuilder<List<int>>(
                        valueListenable: listSessionNotifier,
                        builder: (context, meetValue, _) {
                          return Column(
                            children: List.generate(
                              widget.data.length,
                              (index) {
                                final data = widget.data[index];
                                return SessionExpansionWidget(
                                  title: 'Hari ${data.hari.name.capitalize}',
                                  listSession: data.result,
                                  sessionNotifier: listSessionNotifier,
                                );
                              },
                            ),
                          );
                        },
                      ),
                      const Divider(height: 10, thickness: 10),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            uploadSection(),
                            const SizedBox(height: 10),
                            notesSection(),
                            const SizedBox(height: 15),
                            agreeementSection(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      if (state is LoadingScheduleState)
                        const LinearProgressIndicator(),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: (state is LoadingScheduleState)
                ? const LinearProgressIndicator()
                : ValueListenableBuilder<bool>(
                    valueListenable: agreementNotifier,
                    builder: (context, _value, _widget) {
                      return ButtomButtonConfirmation(
                        onPressedRightButton: _value
                            ? () {
                                scheduleRequestCubit.sendScheduleRequest(
                                  SaveScheduleRequestBody(
                                    listSessionId: listSessionNotifier.value,
                                    partisipanNotes:
                                        notesParticipantController.text,
                                    file: (fileNotifier.value != null)
                                        ? fileNotifier.value!.path
                                        : null,
                                  ),
                                );
                              }
                            : null,
                        onPressedLeftButton: () {
                          scheduleRequestCubit.saveScheduleRequest(
                            SaveScheduleRequestBody(
                              listSessionId: listSessionNotifier.value,
                              partisipanNotes: notesParticipantController.text,
                              file: (fileNotifier.value != null)
                                  ? fileNotifier.value!.path
                                  : null,
                            ),
                          );
                        },
                      );
                    },
                  ),
          );
        },
      ),
    );
  }

  Widget uploadSection() {
    return ValueListenableBuilder<File?>(
        valueListenable: fileNotifier,
        builder: (context, _value, _widget) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Lampirkan Foto KRS',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              Text(
                'Upload file maksimum 2MB',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
              const SizedBox(height: 10),
              if (fileNotifier.value != null || fileUrlNotifier.value != null)
                UploadedFileBox(
                  nameFile: 'BUKTI_KRS.pdf',
                  onDismiss: () {
                    fileNotifier.value = null;
                    fileUrlNotifier.value = null;
                    setState(() {});
                  },
                )
              else
                VarxButton(
                  label: 'Upload KRS (PDF)',
                  prefixIconData: FluentIcons.attach_16_regular,
                  type: VarxButtonType.secondary,
                  onTap: getFile,
                ),
            ],
          );
        });
  }

  Widget notesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Keterangan',
          // style: Theme.of(context)
          //     .textTheme
          //     .labelLarge!
          //     .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: notesParticipantController,
          decoration: const InputDecoration(
            hintText:
                '''Tambahkan keterangan bila perlu (Contoh apabila terdapat jadwal di luar perkuliahan)''',
            // hintStyle: Theme.of(context).textTheme.bodySmall,
          ),
          maxLines: 5,
        ),
      ],
    );
  }

  Widget agreeementSection() {
    return ValueListenableBuilder<bool>(
      valueListenable: agreementNotifier,
      builder: (context, _value, _widget) {
        return InkWell(
          onTap: () {
            agreementNotifier.value = !_value;
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: agreementNotifier.value,
                  onChanged: (value) {
                    agreementNotifier.value = !_value;
                  },
                ),
                const Expanded(
                  child: Text(
                    '''Saya telah mengisi data dengan teliti, jujur, dan benar. Apabila jadwal terdapat kekeliruan yang terbukti disengaja, maka saya siap menerima konsekuensi yang akan diberikan.''',
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
