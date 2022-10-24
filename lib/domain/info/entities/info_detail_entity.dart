import 'package:equatable/equatable.dart';

class InfoDetailEntity extends Equatable {
  const InfoDetailEntity({
    required this.status,
    required this.data,
  });

  final int status;
  final InfoDetailDataEntity data;

  @override
  List<Object> get props => [
        status,
        data,
      ];
}

class InfoDetailDataEntity extends Equatable {
  const InfoDetailDataEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  final String id;
  final String title;
  final String description;
  final String createdAt;

  @override
  List<Object> get props => [
        id,
        title,
        description,
        createdAt,
      ];
}
