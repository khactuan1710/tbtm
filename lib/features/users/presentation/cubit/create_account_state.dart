part of 'create_account_cubit.dart';

@freezed
abstract class CreateAccountState with _$CreateAccountState {
  const factory CreateAccountState({
    @Default(<BankCodeEntity>[]) List<BankCodeEntity> bankCodes,
    BankCodeEntity? selectedBank,
    @Default('user') String type,
    @Default(false) bool isSubmitting,
    @Default(false) bool didCreate,
  }) = _CreateAccountState;

  const CreateAccountState._();
}
