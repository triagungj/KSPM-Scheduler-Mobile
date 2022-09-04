import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/entities/enum.dart';
import 'package:kspm_scheduler_mobile/data/validation/models/requests/validation_type_body.dart';
import 'package:kspm_scheduler_mobile/domain/validation/entities/validation_type_entity.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/contents/list_validation_content.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/cubit/validation_cubit.dart';

class ListValidationPage extends StatefulWidget {
  const ListValidationPage({
    Key? key,
    required this.validationTypeEntity,
  }) : super(key: key);

  static const String route = '/listValidationPage';
  final ValidationTypeEntity validationTypeEntity;

  @override
  State<ListValidationPage> createState() => _ListValidationPageState();
}

class _ListValidationPageState extends State<ListValidationPage> {
  final validationCubit = sl<ValidationCubit>();

  @override
  void initState() {
    super.initState();
    validationCubit.getListValidation(ValidationTypeBody(
      partisipanType: widget.validationTypeEntity.partisipanType,
      validationType: widget.validationTypeEntity.validationType,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final paritipanType = widget.validationTypeEntity.partisipanType;

    return BlocProvider<ValidationCubit>(
      create: (context) => validationCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            paritipanType == PartisipanType.anggota
                ? 'Jadwal Anggota'
                : 'Jadwal Pengurus',
          ),
        ),
        body: ListValidationContent(
          validationCubit: validationCubit,
          validationTypeEntity: widget.validationTypeEntity,
        ),
      ),
    );
  }
}
