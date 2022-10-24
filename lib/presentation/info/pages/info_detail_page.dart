import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/presentation/info/cubit/info_cubit.dart';

class InfoDetailPage extends StatefulWidget {
  const InfoDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  static const route = '/infoDetailPage';

  @override
  State<InfoDetailPage> createState() => _InfoDetailPageState();
}

class _InfoDetailPageState extends State<InfoDetailPage> {
  final infoCubit = sl<InfoCubit>();

  String convertDate(String date) {
    final validateTime = DateTime.parse(date).toLocal();
    final dateFormat = DateFormat('EEEE, dd MMM yyyy, HH:mm');
    return dateFormat.format(validateTime);
  }

  @override
  void initState() {
    super.initState();
    infoCubit.getInfo(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => infoCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Info'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await infoCubit.getInfo(widget.id);
          },
          child: BlocBuilder<InfoCubit, InfoState>(
            builder: (context, state) {
              return ListView(
                children: [
                  if (state is LoadingInfoState)
                    Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.4,
                        ),
                        const CircularProgressIndicator(),
                      ],
                    ),
                  if (state is FailureInfoState)
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
                  if (state is SuccessGetDetailInfoListState)
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            convertDate(state.data.createdAt),
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.end,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            state.data.title,
                            style: Theme.of(context).textTheme.labelLarge,
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            state.data.description,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
