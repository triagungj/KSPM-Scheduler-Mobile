import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kspm_scheduler_mobile/core/constants/key_constants.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/home_banner.dart';
import 'package:kspm_scheduler_mobile/presentation/home/widgets/info_home_section.dart';
import 'package:kspm_scheduler_mobile/presentation/home/widgets/partisipan_home_section.dart';
import 'package:kspm_scheduler_mobile/presentation/home/widgets/petugas_home_section.dart';
import 'package:kspm_scheduler_mobile/presentation/info/cubit/info_cubit.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/cubit/schedule_cubit.dart';
import 'package:kspm_scheduler_mobile/presentation/validation/cubit/validation_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final sharedPrefs = sl<SharedPrefs>();
  final scheduleCubit = sl<ScheduleCubit>();
  final validationCubit = sl<ValidationCubit>();
  final infoCubit = sl<InfoCubit>();

  void refresh() {
    final isPetugas = sharedPrefs.getBool(KeyConstants.keyIsPetugas) ?? false;

    if (isPetugas) {
      validationCubit.getListCountValidation();
    } else {
      scheduleCubit.getListMySchedule();
    }

    infoCubit.getInfoList(1);
  }

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    final isPetugas = sharedPrefs.getBool(KeyConstants.keyIsPetugas) ?? false;
    return MultiBlocProvider(
      providers: [
        BlocProvider<ScheduleCubit>(
          create: (context) => scheduleCubit,
        ),
        BlocProvider<ValidationCubit>(
          create: (context) => validationCubit,
        ),
        BlocProvider<InfoCubit>(
          create: (context) => infoCubit,
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              refresh();
            },
            child: ListView(
              children: [
                const HomeBanner(),
                const Divider(thickness: 3),
                if (isPetugas)
                  PetugasHomeSection(
                    validationCubit: validationCubit,
                  )
                else
                  PartisipanHomeSection(
                    scheduleCubit: scheduleCubit,
                  ),
                const Divider(thickness: 3),
                InfoHomeSection(
                  infoCubit: infoCubit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
