import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/constants/key_constants.dart';
import 'package:kspm_scheduler_mobile/core/di/injection.dart';
import 'package:kspm_scheduler_mobile/core/utils/services/shared_prefs.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/home_banner.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/info_card.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/title_label.dart';
import 'package:kspm_scheduler_mobile/presentation/home/pages/info_page.dart';
import 'package:kspm_scheduler_mobile/presentation/home/widgets/partisipan_home_section.dart';
import 'package:kspm_scheduler_mobile/presentation/home/widgets/petugas_home_section.dart';
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

  Future<void> onRefresh() async {
    final isPetugas = sharedPrefs.getBool(KeyConstants.keyIsPetugas) ?? false;

    if (isPetugas) {
      await validationCubit.getListCountValidation();
    } else {
      await scheduleCubit.getListMySchedule();
    }
  }

  @override
  void initState() {
    super.initState();
    onRefresh();
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
      ],
      child: Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: onRefresh,
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TitleLabel(
                    title: 'Info Terbaru',
                    onTapAll: () => Get.toNamed<void>(InfoPage.route),
                    child: Column(
                      children: List.generate(
                        listInfo.length > 3 ? 3 : listInfo.length,
                        (index) => InfoCard(
                          title: listInfo[index].title,
                          date: listInfo[index].date,
                          description: listInfo[index].description,
                          // onTap: ,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
