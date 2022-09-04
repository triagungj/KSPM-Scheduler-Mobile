import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/buttom_button_confirmation.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/custom_dialog.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/partisipant_card.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/server_exception_widget.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/snackbar.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/data/validation/models/requests/reject_validation_body.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/detail_validation_entity.dart';
import 'package:kspm_scheduler_mobile/presentation/input/cubit/schedule_request_cubit.dart';
import 'package:kspm_scheduler_mobile/presentation/input/widgets/session_expansion_widget.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/cubit/validation_cubit.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/widgets/schedule_status_icon.dart';
import 'package:varx_design_system/varx_design_system.dart';

class DetailValidationContent extends StatefulWidget {
  const DetailValidationContent({
    Key? key,
    required this.data,
    required this.parentCubit,
  }) : super(key: key);

  final DetailValidationDataEntity data;
  final ValidationCubit parentCubit;

  @override
  State<DetailValidationContent> createState() =>
      _DetailValidationContentState();
}

class _DetailValidationContentState extends State<DetailValidationContent> {
  final scheduleRequestCubit = sl<ScheduleRequestCubit>();
  final validationCubit = sl<ValidationCubit>();
  final listSessionNotifier = ValueNotifier<List<int>>([]);
  final petugasNotesController = TextEditingController();

  final document = ValueNotifier<PDFDocument?>(null);
  bool isError = false;

  Future<void> getDocument() async {
    try {
      document.value = await PDFDocument.fromURL(widget.data.bukti!);
    } catch (e) {
      setState(() {
        isError = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    scheduleRequestCubit.getListSession();
    listSessionNotifier.value = widget.data.listSessionId;
    getDocument();
  }

  @override
  Widget build(BuildContext context) {
    final buttonConfirm = ButtomButtonConfirmation(
      leftWidget: const Icon(
        FluentIcons.dismiss_16_filled,
      ),
      labelLeft: 'Tolak',
      primaryLeft: Theme.of(context).colorScheme.error,
      labelRight: 'Konfirmasi',
      onPressedRightButton: widget.data.status == ScheduleStatusType.rejected ||
              widget.data.status == ScheduleStatusType.requested
          ? () => Get.dialog<void>(
                CustomDialog(
                  confirmText: 'Terima Jadwal',
                  content: const StateInfo(
                    title: 'Terima Jadwal Sedia',
                    type: StateInfoType.reschedule,
                    subTitle: 'Pastikan Jadwal Sedia sudah valid',
                  ),
                  primary: Theme.of(context).colorScheme.primary,
                  onConfirm: () {
                    Get.back<void>();
                    validationCubit.acceptValidation(
                      widget.data.id,
                    );
                  },
                ),
              )
          : null,
      onPressedLeftButton: widget.data.status == ScheduleStatusType.accepted ||
              widget.data.status == ScheduleStatusType.requested
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
                          controller: petugasNotesController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            hintText: '''Berikan alasan menolak jadwal''',
                          ),
                        )
                      ],
                    ),
                  ),
                  onConfirm: () {
                    Get.back<void>();
                    validationCubit.rejectValidation(
                      RejectValidationBody(
                        id: widget.data.id,
                        petugasNotes: petugasNotesController.text,
                      ),
                    );
                  },
                ),
              )
          : null,
    );

    final validatorHeader = Column(
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '''Validator: ${widget.data.petugasName}''',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '''Tanggal Validasi: ${widget.data.validateAt}''',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                  ScheduleStatusIcon(
                    isAccepted:
                        widget.data.status == ScheduleStatusType.accepted,
                  )
                ],
              ),
              const SizedBox(height: 5),
              if (widget.data.status == ScheduleStatusType.rejected)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Alasan Ditolak',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: TextEditingController(
                        text: widget.data.petugasNotes,
                      ),
                      style: Theme.of(context).textTheme.labelMedium,
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
    );
    
    final partisipanEmptySeciton = Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(height: Get.height * 0.15),
                          StateInfo(
                            title:
                                '''${widget.data.partisipan.name} belum mengajukan jadwal''',
                            type: StateInfoType.calendarEmpty,
                          ),
                          VarxButton(
                            label: '''Hubungi ${widget.data.partisipan.name}''',
                            prefixIconData: FluentIcons.chat_24_regular,
                            onTap: () {},
                          ),
                          SizedBox(height: Get.height * 0.25),
                        ],
                      ),
                    );
    
    return BlocConsumer<ValidationCubit, ValidationState>(
      bloc: validationCubit,
      listener: (context, state) {
        if (state is SuccessRejectValidationState) {
          AppSnackbar.snackbarSuccess(
            'Berhasil!',
            'Ajuan jadwal partisipan ditolak',
          );
          widget.parentCubit.getDetailValidation(widget.data.id);
        }
        if (state is SuccessAcceptValidationState) {
          AppSnackbar.snackbarSuccess(
            'Berhasil!',
            'Ajuan jadwal partisipan diterima',
          );
          widget.parentCubit.getDetailValidation(widget.data.id);
        }
        if (state is FailureValidationState) {
          AppSnackbar.snackbarFailure(
            'Gagal!',
            'Ajuan gagal validasi jadwal partisipan',
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: (state is LoadingValidationState)
              ? const LinearProgressIndicator()
              : (widget.data.status != null)
                  ? buttonConfirm
                  : null,
          body: BlocProvider<ScheduleRequestCubit>(
            create: (context) => scheduleRequestCubit,
            child: RefreshIndicator(
              onRefresh: () async => widget.parentCubit.getDetailValidation(
                widget.data.id,
              ),
              child: ListView(
                children: [
                  if (widget.data.status == ScheduleStatusType.accepted ||
                      widget.data.status == ScheduleStatusType.rejected)
                    validatorHeader,
                  PartisipantCard(
                    textName: widget.data.partisipan.name,
                    textPosition: widget.data.partisipan.jabatan,
                    textNumber: widget.data.partisipan.memberId,
                    phoneNumber: widget.data.partisipan.phone,
                    avatarUrl: widget.data.partisipan.avatarUrl,
                  ),
                  if (widget.data.status == null)
                    partisipanEmptySeciton
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (widget.data.partisipanNotes != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Keterangan Partisipan',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      widget.data.partisipanNotes!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 15),
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
                        BlocBuilder<ScheduleRequestCubit, ScheduleRequestState>(
                          bloc: scheduleRequestCubit,
                          builder: (context, state) {
                            return Stack(
                              children: [
                                if (state is LoadingScheduleRequestState)
                                  const SizedBox(
                                    height: 400,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                if (state is FailureScheduleRequestState)
                                  const SizedBox(
                                    height: 400,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Center(
                                        child: ServerExceptionWidget(),
                                      ),
                                    ),
                                  ),
                                if (state is SuccessGetListSessionState)
                                  ValueListenableBuilder<List<int>>(
                                    valueListenable: listSessionNotifier,
                                    builder: (context, meetValue, _) {
                                      return Column(
                                        children: List.generate(
                                          state.data.length,
                                          (index) {
                                            final data = state.data[index];
                                            return SessionExpansionWidget(
                                              title:
                                                  '''Hari ${data.hari.name.capitalize}''',
                                              listSession: data.result,
                                              sessionNotifier:
                                                  listSessionNotifier,
                                              enabled: false,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  )
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
