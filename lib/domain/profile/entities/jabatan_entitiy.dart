import 'package:equatable/equatable.dart';

class JabatanEntity extends Equatable {
  const JabatanEntity({
    required this.status,
    required this.data,
  });

  final int status;
  final List<JabatanDataEntity> data;

  @override
  List<Object> get props => [
        status,
        data,
      ];
}

class JabatanDataEntity extends Equatable {
  const JabatanDataEntity({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  @override
  List<Object> get props => [
        id,
        name,
      ];
}
