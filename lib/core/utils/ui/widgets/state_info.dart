import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kspm_scheduler_mobile/core/constants/assets_constants.dart';

enum StateInfoType {
  calendar,
  calendarEmpty,
  reschedule,
  signOut,
}

class StateInfo extends StatelessWidget {
  const StateInfo({
    Key? key,
    this.type,
    required this.title,
    this.subTitle,
    this.bodyContent,
  }) : super(key: key);

  final StateInfoType? type;
  final String title;
  final String? subTitle;
  final Widget? bodyContent;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            if (bodyContent != null)
              bodyContent!
            else if (type != null)
              SvgPicture.asset(
                type == StateInfoType.calendar
                    ? AssetsConstants.calendarSvg
                    : type == StateInfoType.calendarEmpty
                        ? AssetsConstants.calendarEmptySvg
                        : type == StateInfoType.reschedule
                            ? AssetsConstants.rescheduleSvg
                            : AssetsConstants.singOutSvg,
              ),
            const SizedBox(height: 20),
            Text(
              subTitle ?? ' ',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
