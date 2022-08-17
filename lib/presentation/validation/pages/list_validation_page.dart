import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/entities/classes.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/tile_item.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/tile_label.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/pages/detail_validation_page.dart';

class ListValidationPage extends StatelessWidget {
  const ListValidationPage({
    Key? key,
    required this.validationEntity,
  }) : super(key: key);

  static const String route = '/listValidationPage';
  final ValidationEntity validationEntity;

  @override
  Widget build(BuildContext context) {
    final privilegeType = validationEntity.privilegeType;
    final validationType = validationEntity.validationScheduleType;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          privilegeType == PrivilegeType.anggota
              ? 'Jadwal Anggota'
              : 'Jadwal Pengurus',
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          TileLabel(
            label: validationType == ValidationScheduleType.notValidated
                ? 'Jadwal Belum tervalidasi'
                : validationType == ValidationScheduleType.rejected
                    ? 'Jadwal Ditolak'
                    : validationType == ValidationScheduleType.empty
                        ? 'Belum Menginputkan'
                        : validationType == ValidationScheduleType.validated
                            ? 'Jadwal Tervalidasi'
                            : validationType == ValidationScheduleType.accepted
                                ? 'Jadwal Diterima'
                                : 'Semua Pengurus',
            suffixLabel: 'Total: 4',
          ),
          Column(
            children: List.generate(
              10,
              (index) => TileItem(
                title: 'Tri Agung J',
                onTap: ()=> Get.toNamed<void>(DetailValidationPage.route),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
