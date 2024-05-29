import 'package:animals/data/repository/storage_repository.dart';
import 'package:mobx/mobx.dart';

part 'splash_state.g.dart';

class SplashState = SplashStateBase with _$SplashState;

abstract class SplashStateBase with Store {
  SplashStateBase(this._storageRepository);

  final StorageRepository _storageRepository;


}
