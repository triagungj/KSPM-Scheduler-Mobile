import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/tile_item.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/tile_label.dart';
import 'package:kspm_scheduler_mobile/data/validation/models/requests/validation_type_body.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/validation_type_entity.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/cubit/validation_cubit.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/pages/detail_validation_page.dart';

class ListValidationContent extends StatefulWidget {
  const ListValidationContent({
    Key? key,
    required this.validationTypeEntity,
    required this.validationCubit,
  }) : super(key: key);

  final ValidationTypeEntity validationTypeEntity;
  final ValidationCubit validationCubit;

  @override
  State<ListValidationContent> createState() => _ListValidationContentState();
}

class _ListValidationContentState extends State<ListValidationContent> {
  Future<void> refresh() async {
    await widget.validationCubit.getListValidation(
      ValidationTypeBody(
        partisipanType: widget.validationTypeEntity.partisipanType,
        validationType: widget.validationTypeEntity.validationType,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final validationType = widget.validationTypeEntity.validationType;
    final allPartisipan =
        widget.validationTypeEntity.partisipanType == PartisipanType.pengurus
            ? 'Semua Pengurus'
            : 'Semua Anggota';

    return BlocBuilder<ValidationCubit, ValidationState>(
      bloc: widget.validationCubit,
      builder: (context, state) {
        if (state is LoadingValidationState) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: refresh,
          child: ListView(
            children: [
              if (state is FailureValidationState)
                Column(
                  children: [
                    SizedBox(height: Get.height * 0.2),
                    StateInfo(
                      title: 'Server Error',
                      type: StateInfoType.serverError,
                      subTitle: state.message,
                    ),
                  ],
                ),
              if (state is SuccessLoadListValidationState)
                TileLabel(
                  label: state.data.validationType == ValidationType.requested
                      ? 'Jadwal Belum tervalidasi'
                      : validationType == ValidationType.rejected
                          ? 'Jadwal Ditolak'
                          : validationType == ValidationType.empty
                              ? 'Belum Menginputkan'
                              : validationType == ValidationType.validated
                                  ? 'Jadwal Tervalidasi'
                                  : validationType == ValidationType.accepted
                                      ? 'Jadwal Diterima'
                                      : allPartisipan,
                  suffixLabel: 'Total: ${state.data.total}',
                ),
              if (state is SuccessLoadListValidationState)
                SizedBox(
                  child: (state.data.listRequest.isNotEmpty)
                      ? Column(
                          children: List.generate(
                            state.data.listRequest.length,
                            (index) => TileItem(
                              title: state.data.listRequest[index].name,
                              onTap: () => Get.toNamed<void>(
                                DetailValidationPage.route,
                                arguments: state.data.listRequest[index].id,
                              )?.then((value) {
                                refresh();
                              }),
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.2,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(20),
                              child: StateInfo(
                                title: 'Data tidak ada',
                                type: StateInfoType.calendarEmpty,
                                subTitle: 'Data yang dicari tidak ditemukan.',
                              ),
                            ),
                          ],
                        ),
                ),
            ],
          ),
        );
      },
    );
  }
}
