import 'package:animals/conventions/enum/shared_keys.dart';
import 'package:animals/data/repository/storage_repository.dart';
import 'package:mobx/mobx.dart';

part 'onboarding_state.g.dart';

class OnboardingState = OnboardingStateBase with _$OnboardingState;

abstract class OnboardingStateBase with Store {
  OnboardingStateBase(this._storageRepository);

  final StorageRepository _storageRepository;

  @observable
  bool isCloseOnboard = false;

  @observable
  int currentPage = 0;

  @action
  Future nextPage() async {
    if (currentPage == 0) {
      currentPage = 1;
    } else {
      await _storageRepository.saveShared(SharedKeys.firstLaunch.key, false);
      isCloseOnboard = true;
    }
  }

  @action
  Future skipOnboarding() async {
    await _storageRepository.saveShared(SharedKeys.firstLaunch.key, false);
    isCloseOnboard = true;
  }
}
