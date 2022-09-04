import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/server_exception_widget.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/contents/detail_validation_content.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/cubit/validation_cubit.dart';

class DetailValidationPage extends StatefulWidget {
  const DetailValidationPage({
    Key? key,
    required this.scheduleRequestId,
  }) : super(key: key);

  static const String route = '/detailValidationPage';
  final String scheduleRequestId;

  @override
  State<DetailValidationPage> createState() => _DetailValidationPageState();
}

class _DetailValidationPageState extends State<DetailValidationPage> {
  final validationCubit = sl<ValidationCubit>();

  @override
  void initState() {
    super.initState();
    validationCubit.getDetailValidation(widget.scheduleRequestId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ValidationCubit>(
      create: (context) => validationCubit,
      child: BlocBuilder<ValidationCubit, ValidationState>(
        bloc: validationCubit,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Validasi Jadwal Pengurus'),
            ),
            body: Stack(
              children: [
                if (state is LoadingValidationState)
                  const Center(child: CircularProgressIndicator()),
                if (state is FailureValidationState)
                  RefreshIndicator(
                    onRefresh: () async => validationCubit.getDetailValidation(
                      widget.scheduleRequestId,
                    ),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: Get.height * 0.2),
                            const ServerExceptionWidget(),
                          ],
                        ),
                      ],
                    ),
                  ),
                if (state is SuccessLoadDetailValidationState)
                  SizedBox(
                    child: DetailValidationContent(
                      data: state.data,
                      parentCubit: validationCubit,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
