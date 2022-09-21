import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/partisipant_card.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/tile_label.dart';
import 'package:kspm_scheduler_mobile/domain/schedule/entities/detail_schedule_session_entity.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/widgets/sesion_header.dart';

class DetailSessionContent extends StatefulWidget {
  const DetailSessionContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  final DetailScheduleSessionDataEntity data;

  @override
  State<DetailSessionContent> createState() => _DetailSessionContentState();
}

class _DetailSessionContentState extends State<DetailSessionContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SessionHeader(
            details: widget.data.details,
          ),
          const SizedBox(height: 10),
          const TileLabel(
            label: 'Daftar Partisipan',
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          Column(
            children: List.generate(
              widget.data.listPartisipan.length,
              (index) => PartisipantCard(
                textName: widget.data.listPartisipan[index].name,
                textPosition: widget.data.listPartisipan[index].jabatan,
                textNumber: widget.data.listPartisipan[index].memberId,
                phoneNumber: widget.data.listPartisipan[index].phoneNumber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
