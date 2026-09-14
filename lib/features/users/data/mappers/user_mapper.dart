import 'package:quanlymaygiat/features/users/data/models/bank_code_dto.dart';
import 'package:quanlymaygiat/features/users/data/models/user_dto.dart';
import 'package:quanlymaygiat/features/users/domain/entities/bank_code_entity.dart';
import 'package:quanlymaygiat/features/users/domain/entities/user_entity.dart';

class UserMapper {
  const UserMapper();

  UserEntity toEntity(UserDto dto) => UserEntity(
    id: dto.id ?? '',
    username: dto.username ?? '',
    fullName: dto.fullName ?? '',
    phoneNumber: dto.phoneNumber ?? '',
    address: dto.address ?? '',
    type: dto.type ?? '',
    isActive: dto.isActive ?? true,
    addressNew: dto.addressNew ?? const [],
    bankCode: dto.bankCode ?? '',
    bankAccountNumber: dto.bankAccountNumber ?? '',
    bankAccountName: dto.bankAccountName ?? '',
  );

  List<UserEntity> toEntities(List<UserDto>? dtos) =>
      (dtos ?? const []).map(toEntity).toList(growable: false);

  BankCodeEntity bankToEntity(BankCodeDto dto) => BankCodeEntity(
    bin: dto.bin ?? '',
    code: dto.code ?? '',
    name: dto.name ?? '',
    shortName: dto.shortName ?? '',
    logo: dto.logo ?? '',
  );

  List<BankCodeEntity> bankToEntities(List<BankCodeDto>? dtos) =>
      (dtos ?? const []).map(bankToEntity).toList(growable: false);
}
