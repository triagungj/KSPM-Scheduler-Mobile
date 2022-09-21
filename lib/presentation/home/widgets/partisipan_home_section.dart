import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kspm_scheduler_mobile/core/constants/assets_constants.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/state_info.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/cubit/schedule_cubit.dart';

class PartisipanHomeSection extends StatelessWidget {
  const PartisipanHomeSection({
    Key? key,
    required this.scheduleCubit,
  }) : super(key: key);

  final ScheduleCubit scheduleCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleCubit, ScheduleState>(
      bloc: scheduleCubit,
      builder: (context, state) {
        if (state is LoadingScheduleState) {
          return const SizedBox(
            height: 260,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is FailureScheduleState) {
          return SizedBox(
            height: 260,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: StateInfo(
                bodyContent: SvgPicture.asset(
                  AssetsConstants.serverError,
                ),
                title: 'Server Error',
                subTitle: state.message,
              ),
            ),
          );
        }

        if (state is SuccessLoadListMyScheduleState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Selamat Datang,',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(height: 5),
                Text(
                  state.data.name,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (state.data.schedules == null)
                        Column(
                          children: [
                            const SizedBox(height: 15),
                            SvgPicture.asset(
                              AssetsConstants.rescheduleSvg,
                              height: 100,
                              width: 100,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Kamu Belum Mengajukan Jadwal',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                            ),
                          ],
                        ),
                      if (state.data.schedules != null &&
                          state.data.schedules!.isEmpty)
                        Column(
                          children: [
                            const SizedBox(height: 15),
                            SvgPicture.asset(
                              AssetsConstants.calendarSvg,
                              height: 100,
                              width: 100,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Jadwal Belum Tersedia',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                            ),
                          ],
                        ),
                      if (state.data.schedules != null &&
                          state.data.schedules!.isNotEmpty)
                        Column(
                          children: [
                            Text(
                              'Jadwal Edukasi Harian',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 15),
                            Column(
                              children: List.generate(
                                state.data.schedules!.length,
                                (index) {
                                  final sesi = state.data.schedules![index];
                                  final nameSesi = sesi.pertemuan;
                                  final detailSesi =
                                      '''${sesi.hari.name.capitalizeFirst}, ${sesi.waktu} (${sesi.name})''';
                                  return Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          child: Text(
                                            (index + 1).toString(),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                detailSesi,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge!
                                                    .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimary,
                                                    ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                nameSesi,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimary,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
