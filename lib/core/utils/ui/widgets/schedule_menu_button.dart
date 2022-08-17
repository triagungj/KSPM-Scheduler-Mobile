import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/entities/classes.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/circle_item_button.dart';
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
    this.privilegeType,
  }) : super(key: key);

  final PrivilegeType? privilegeType;
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
              privilegeType == PrivilegeType.anggota
                  ? 'Jadwal Anggota'
                  : privilegeType == PrivilegeType.pengurus
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
                    if (privilegeType != null) {
                      Get.toNamed<void>(
                        ListValidationPage.route,
                        arguments: ValidationEntity(
                          privilegeType: privilegeType!,
                          validationScheduleType:
                              ValidationScheduleType.notValidated,
                        ),
                      );
                    }
                  },
                ),
                CircleItemButton(
                  label: 'Ditolak',
                  count: rejected,
                  iconData: FluentIcons.calendar_error_24_filled,
                  componentColor: Theme.of(context).colorScheme.error,
                  onTap: () {
                     if (privilegeType != null) {
                      Get.toNamed<void>(
                        ListValidationPage.route,
                        arguments: ValidationEntity(
                          privilegeType: privilegeType!,
                          validationScheduleType:
                              ValidationScheduleType.rejected,
                        ),
                      );
                    }
                  },
                ),
                CircleItemButton(
                  label: 'Belum Menginput',
                  count: empty,
                  iconData: FluentIcons.calendar_empty_24_filled,
                  componentColor: Theme.of(context).colorScheme.error,
                  onTap: () {
                     if (privilegeType != null) {
                      Get.toNamed<void>(
                        ListValidationPage.route,
                        arguments: ValidationEntity(
                          privilegeType: privilegeType!,
                          validationScheduleType:
                              ValidationScheduleType.empty,
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
                     if (privilegeType != null) {
                      Get.toNamed<void>(
                        ListValidationPage.route,
                        arguments: ValidationEntity(
                          privilegeType: privilegeType!,
                          validationScheduleType:
                              ValidationScheduleType.validated,
                        ),
                      );
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
                     if (privilegeType != null) {
                      Get.toNamed<void>(
                        ListValidationPage.route,
                        arguments: ValidationEntity(
                          privilegeType: privilegeType!,
                          validationScheduleType:
                              ValidationScheduleType.accepted,
                        ),
                      );
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
                     if (privilegeType != null) {
                      Get.toNamed<void>(
                        ListValidationPage.route,
                        arguments: ValidationEntity(
                          privilegeType: privilegeType!,
                          validationScheduleType:
                              ValidationScheduleType.all,
                        ),
                      );
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
