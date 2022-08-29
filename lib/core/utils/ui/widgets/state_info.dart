import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kspm_scheduler_mobile/core/constants/assets_constants.dart';

enum StateInfoType {
  calendar,
  calendarEmpty,
  reschedule,
  signOut,
  serverError,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
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
                          : type == StateInfoType.serverError
                              ? AssetsConstants.serverError
                              : AssetsConstants.singOutSvg,
              height: 200,
              width: 200,
            ),
          const SizedBox(height: 20),
          Text(
            subTitle ?? ' ',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
