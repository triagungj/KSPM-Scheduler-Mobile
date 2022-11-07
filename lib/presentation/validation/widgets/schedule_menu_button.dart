import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/circle_item_button.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/validation_type_entity.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/cubit/validation_cubit.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/pages/list_validation_page.dart';

class ScheduleMenuButton extends StatelessWidget {
  const ScheduleMenuButton({
    Key? key,
    required this.notValidated,
    required this.rejected,
    required this.empty,
    required this.validated,
    required this.accepted,
    required this.total,
    this.partisipanType,
  }) : super(key: key);

  final PartisipanType? partisipanType;
  final int notValidated;
  final int rejected;
  final int empty;
  final int validated;
  final int accepted;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              partisipanType == PartisipanType.anggota
                  ? 'Jadwal Anggota'
                  : partisipanType == PartisipanType.pengurus
                      ? 'Jadwal Pengurus'
                      : 'Informasi Jadwal',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              children: [
                CircleItemButton(
                  label: 'Belum Tervalidasi',
                  count: notValidated,
                  iconData: FluentIcons.calendar_clock_24_filled,
                  componentColor: Theme.of(context).colorScheme.error,
                  onTap: () {
                    if (partisipanType != null) {
                      Get.toNamed<void>(
                        ListValidationPage.route,
                        arguments: ValidationTypeEntity(
                          partisipanType: partisipanType!,
                          validationType: ValidationType.requested,
                        ),
                      )?.then((value) {
                        context
                            .read<ValidationCubit>()
                            .getListCountValidation();
                      });
                    }
                  },
                ),
                CircleItemButton(
                  label: 'Ditolak',
                  count: rejected,
                  iconData: FluentIcons.calendar_error_24_filled,
                  componentColor: Theme.of(context).colorScheme.error,
                  onTap: () {
                    if (partisipanType != null) {
                      Get.toNamed<void>(
                        ListValidationPage.route,
                        arguments: ValidationTypeEntity(
                          partisipanType: partisipanType!,
                          validationType: ValidationType.rejected,
                        ),
                      )?.then((value) {
                        context
                            .read<ValidationCubit>()
                            .getListCountValidation();
                      });
                    }
                  },
                ),
                CircleItemButton(
                  label: 'Belum Mengajukan',
                  count: empty,
                  iconData: FluentIcons.calendar_empty_24_filled,
                  componentColor: Theme.of(context).colorScheme.error,
                  onTap: () {
                    if (partisipanType != null) {
                      Get.toNamed<void>(
                        ListValidationPage.route,
                        arguments: ValidationTypeEntity(
                          partisipanType: partisipanType!,
                          validationType: ValidationType.empty,
                        ),
                      );
                    }
                  },
                ),
                CircleItemButton(
                  label: 'Tervalidasi',
                  count: validated,
                  iconData: FluentIcons.calendar_edit_24_filled,
                  componentColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                  onTap: () {
                    if (partisipanType != null) {
                      Get.toNamed<void>(
                        ListValidationPage.route,
                        arguments: ValidationTypeEntity(
                          partisipanType: partisipanType!,
                          validationType: ValidationType.validated,
                        ),
                      )?.then((value) {
                        context
                            .read<ValidationCubit>()
                            .getListCountValidation();
                      });
                    }
                  },
                ),
                CircleItemButton(
                  label: 'Diterima',
                  count: accepted,
                  iconData: FluentIcons.calendar_checkmark_24_filled,
                  componentColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                  onTap: () {
                    if (partisipanType != null) {
                      Get.toNamed<void>(
                        ListValidationPage.route,
                        arguments: ValidationTypeEntity(
                          partisipanType: partisipanType!,
                          validationType: ValidationType.accepted,
                        ),
                      )?.then((value) {
                        context
                            .read<ValidationCubit>()
                            .getListCountValidation();
                      });
                    }
                  },
                ),
                CircleItemButton(
                  label: 'Total Pengurus',
                  count: total,
                  iconData: FluentIcons.person_circle_24_filled,
                  componentColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                  onTap: () {
                    if (partisipanType != null) {
                      Get.toNamed<void>(
                        ListValidationPage.route,
                        arguments: ValidationTypeEntity(
                          partisipanType: partisipanType!,
                          validationType: ValidationType.all,
                        ),
                      )?.then((value) {
                        context
                            .read<ValidationCubit>()
                            .getListCountValidation();
                      });
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
