import 'package:animals/conventions/enum/shared_keys.dart';
import 'package:animals/data/repository/storage_repository.dart';
import 'package:mobx/mobx.dart';

part 'premium_state.g.dart';

class PremiumState = PremiumStateBase with _$PremiumState;

abstract class PremiumStateBase with Store {
  PremiumStateBase(this._storageRepository);

  final StorageRepository _storageRepository;

  @observable
  bool? isSuccessPaid;

  @action
  void onGetAccess() {
    _storageRepository
        .saveShared(SharedKeys.subscription.key, true)
        .then((value) => isSuccessPaid = true);
  }
}
