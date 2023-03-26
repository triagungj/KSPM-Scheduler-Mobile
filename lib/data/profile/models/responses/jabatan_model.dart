import 'package:json_annotation/json_annotation.dart';
import 'package:kspm_scheduler_mobile/domain/profile/entities/jabatan_entitiy.dart';

part 'jabatan_model.g.dart';

@JsonSerializable(createToJson: false)
class JabatanModel extends JabatanEntity {
  const JabatanModel({
    required int status,
    required List<JabatanDataModel> data,
  }) : super(
          status: status,
          data: data,
        );

  factory JabatanModel.fromJson(Map<String, dynamic> json) =>
      _$JabatanModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class JabatanDataModel extends JabatanDataEntity {
  const JabatanDataModel({
    required String id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory JabatanDataModel.fromJson(Map<String, dynamic> json) =>
      _$JabatanDataModelFromJson(json);
}
