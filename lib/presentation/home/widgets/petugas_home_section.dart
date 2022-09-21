
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/schedule_menu_button.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/cubit/validation_cubit.dart';

class PetugasHomeSection extends StatefulWidget {
  const PetugasHomeSection({
    Key? key,
    required this.validationCubit,
  }) : super(key: key);

  final ValidationCubit validationCubit;

  @override
  State<PetugasHomeSection> createState() => _PetugasHomeSectionState();
}

class _PetugasHomeSectionState extends State<PetugasHomeSection> {
  @override
  void initState() {
    super.initState();
    widget.validationCubit.getListCountValidation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationCubit, ValidationState>(
      bloc: widget.validationCubit,
      builder: (context, state) {
        if (state is LoadingValidationState) {
          return const SizedBox(
            height: 255,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is FailureValidationState) {
          return SizedBox(
            height: 255,
            child: StateInfo(
              type: StateInfoType.serverError,
              title: 'Server Error',
              subTitle: state.message,
            ),
          );
        }
        if (state is SuccessLoadCountValidationState) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Builder(
                  builder: (context) {
                    final pengurus = state.data.pengurus;
                    final anggota = state.data.anggota;

                    return ScheduleMenuButton(
                      notValidated: pengurus.requested + anggota.requested,
                      rejected: pengurus.rejected + anggota.rejected,
                      empty: pengurus.empty + anggota.empty,
                      validated: pengurus.validated + anggota.validated,
                      accepted: pengurus.accepted + anggota.accepted,
                      total: pengurus.total + anggota.total,
                    );
                  },
                ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
