import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/domain/info/entities/info_detail_entity.dart';
import 'package:kspm_scheduler_mobile/presentation/info/contents/info_content.dart';
import 'package:kspm_scheduler_mobile/presentation/info/cubit/info_cubit.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  static const route = '/infoPage';

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final infoCubit = sl<InfoCubit>();
  final PagingController<int, InfoDetailDataEntity> _pagingController =
      PagingController(firstPageKey: 1);

  Future<void> getInfoList(int pageKey) async {
    return infoCubit.getInfoList(pageKey);
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(getInfoList);
  }

  @override
  void dispose() {
    infoCubit.close();
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InfoCubit>(
      create: (context) => infoCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Info'),
        ),
        body: InfoContent(
          cubit: infoCubit,
          pagingController: _pagingController,
        ),
      ),
    );
  }
}
