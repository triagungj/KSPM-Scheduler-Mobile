import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/info_card.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/domain/info/entities/info_detail_entity.dart';
import 'package:kspm_scheduler_mobile/presentation/info/cubit/info_cubit.dart';
import 'package:kspm_scheduler_mobile/presentation/info/pages/info_detail_page.dart';
import 'package:varx_design_system/components/empty_states/empty_state.dart';

class InfoContent extends StatelessWidget {
  const   InfoContent({
    Key? key,
    required this.cubit,
    required this.pagingController,
  }) : super(key: key);

  final InfoCubit cubit;
  final PagingController<int, InfoDetailDataEntity> pagingController;

  @override
  Widget build(BuildContext context) {
    var totalRecordCount = 0;

    return BlocListener<InfoCubit, InfoState>(
      listener: (context, state) {
        if (state is SuccessGetInfoListState) {
          totalRecordCount++;
          final _next = 1 + totalRecordCount;

          final isLastPage = totalRecordCount == state.data.lastPage;
          if (isLastPage) {
            pagingController.appendLastPage(state.data.data);
          } else {
            pagingController.appendPage(state.data.data, _next);
          }
        }
        if (state is FailureInfoState) {
          pagingController.error = state.message;
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          totalRecordCount = 0;
          await Future.sync(pagingController.refresh);
        },
        child: RefreshIndicator(
          onRefresh: () async {
            totalRecordCount = 0;
            await Future.sync(pagingController.refresh);
          },
          child: PagedListView(
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<InfoDetailDataEntity>(
              firstPageErrorIndicatorBuilder: (context) => Column(
                children: [
                  SizedBox(height: Get.height * 0.2),
                  const StateInfo(
                    type: StateInfoType.serverError,
                    title: 'Server Error',
                    subTitle: 'Periksa koneksi anda atau hubungi Admin.',
                  ),
                ],
              ),
              noItemsFoundIndicatorBuilder: (context) => EmptyState(
                title: 'Info Belum Ada',
                message: 'Belum ada info terbaru saat ini.',
                image: Icon(
                  FluentIcons.info_28_filled,
                  size: 32,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              itemBuilder: (context, data, index) => Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: index == 0 ? 10 : 0,
                ),
                child: InfoCard(
                  id: data.id,
                  title: data.title,
                  date: data.createdAt,
                  description: data.description,
                  onTap: () => Get.toNamed<void>(
                    InfoDetailPage.route,
                    arguments: data.id,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
