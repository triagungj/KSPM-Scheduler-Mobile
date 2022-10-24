import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/info_card.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/title_label.dart';
import 'package:kspm_scheduler_mobile/presentation/info/cubit/info_cubit.dart';
import 'package:kspm_scheduler_mobile/presentation/info/pages/info_detail_page.dart';
import 'package:kspm_scheduler_mobile/presentation/info/pages/info_page.dart';
import 'package:varx_design_system/varx_design_system.dart';

class InfoHomeSection extends StatelessWidget {
  const InfoHomeSection({
    Key? key,
    required this.infoCubit,
  }) : super(key: key);

  final InfoCubit infoCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: BlocBuilder<InfoCubit, InfoState>(
        builder: (context, state) {
          if (state is LoadingInfoState) {
            return const SizedBox(
              height: 100,
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is FailureInfoState) {
            return const StateInfo(
              type: StateInfoType.serverError,
              title: 'Server Error',
              subTitle: 'Periksa koneksi anda atau hubungi Admin.',
            );
          }
          if (state is SuccessGetInfoListState) {
            final listInfo = state.data.data;

            return TitleLabel(
              title: 'Info Terbaru',
              onTapAll: () => Get.toNamed<void>(InfoPage.route),
              child: (listInfo.isEmpty)
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: EmptyState(
                        title: 'Info Belum Ada',
                        message: 'Saat ini belum ada info terbaru.',
                        image: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Icon(
                            FluentIcons.info_28_filled,
                            size: 60,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: List.generate(
                        listInfo.length > 3 ? 3 : listInfo.length,
                        (index) => InfoCard(
                          title: listInfo[index].title,
                          date: listInfo[index].createdAt,
                          description: listInfo[index].description,
                          id: listInfo[index].description,
                          onTap: () => Get.toNamed<void>(
                            InfoDetailPage.route,
                            arguments: listInfo[index].id,
                          ),
                        ),
                      ),
                    ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
