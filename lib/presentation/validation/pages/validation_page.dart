import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/schedule_menu_button.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/cubit/validation_cubit.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({Key? key}) : super(key: key);

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  final validationCubit = sl<ValidationCubit>();

  @override
  void initState() {
    super.initState();
    validationCubit.getListCountValidation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ValidationCubit>(
      create: (context) => validationCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Validasi Jadwal'),
        ),
        body: RefreshIndicator(
          onRefresh: () async => validationCubit.getListCountValidation(),
          child: BlocBuilder<ValidationCubit, ValidationState>(
            bloc: validationCubit,
            builder: (context, state) {
              if (state is LoadingValidationState) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView(
                  children: [
                    if (state is FailureValidationState)
                      Column(
                        children: [
                          SizedBox(height: Get.height * 0.2),
                          StateInfo(
                            type: StateInfoType.serverError,
                            title: 'Server Error',
                            subTitle: state.message,
                          ),
                        ],
                      ),
                    if (state is SuccessLoadCountValidationState)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            ScheduleMenuButton(
                              partisipanType: PartisipanType.pengurus,
                              notValidated: state.data.pengurus.requested,
                              rejected: state.data.pengurus.rejected,
                              empty: state.data.pengurus.empty,
                              validated: state.data.pengurus.validated,
                              accepted: state.data.pengurus.accepted,
                              total: state.data.pengurus.total,
                            ),
                            const SizedBox(height: 10),
                            ScheduleMenuButton(
                              partisipanType: PartisipanType.anggota,
                              notValidated: state.data.anggota.requested,
                              rejected: state.data.anggota.rejected,
                              empty: state.data.anggota.empty,
                              validated: state.data.anggota.validated,
                              accepted: state.data.anggota.accepted,
                              total: state.data.anggota.total,
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
