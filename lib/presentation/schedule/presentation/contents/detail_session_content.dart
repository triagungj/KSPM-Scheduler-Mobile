import 'package:flutter/material.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/partisipant_card.dart';
import 'package:kspm_scheduler_mobile/core/utils/ui/widgets/tile_label.dart';
import 'package:kspm_scheduler_mobile/presentation/schedule/widgets/sesion_header.dart';

class DetailSessionContent extends StatefulWidget {
  const DetailSessionContent({Key? key}) : super(key: key);

  @override
  State<DetailSessionContent> createState() => _DetailSessionContentState();
}

class _DetailSessionContentState extends State<DetailSessionContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SessionHeader(),
          SizedBox(height: 10),
          TileLabel(
            label: 'Datar Partisipant',
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          PartisipantCard(
            textName: 'Tri Agung Jiwandono',
            textPosition: 'Ketua Umum',
            textNumber: 'P3312000003',
            phoneNumber: '6282262401237',
          ),
          PartisipantCard(
            textName: 'Tri Agung Jiwandono',
            textPosition: 'Ketua Umum',
            textNumber: 'P3312000003',
            phoneNumber: '6282262401237',
          ),
          PartisipantCard(
            textName: 'Tri Agung Jiwandono',
            textPosition: 'Ketua Umum',
            textNumber: 'P3312000003',
            phoneNumber: '6282262401237',
          ),
          PartisipantCard(
            textName: 'Tri Agung Jiwandono',
            textPosition: 'Ketua Umum',
            textNumber: 'P3312000003',
            phoneNumber: '6282262401237',
          ),
        ],
      ),
    );
  }
}
