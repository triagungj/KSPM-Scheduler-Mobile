import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  const ProfileEntity({
    required this.status,
    required this.data,
  });

  final int status;
  final ProfileDataEntity data;

  @override
  List<Object> get props => [status, data];
}

class ProfileDataEntity extends Equatable {
  const ProfileDataEntity({
    required this.name,
    required this.phoneNumber,
    this.memberId,
    this.jabatan,
    this.avatarUrl,
  });

  final String name;
  final String? memberId;
  final String phoneNumber;
  final String? jabatan;
  final String? avatarUrl;

  @override
  List<Object?> get props => [
        name,
        memberId,
        phoneNumber,
        jabatan,
        avatarUrl,
      ];
}
