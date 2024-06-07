import 'package:animals/conventions/enum/shared_keys.dart';
import 'package:animals/data/hive/models/animal/animal_model.dart';
import 'package:animals/data/repository/animal_repository.dart';
import 'package:animals/data/repository/storage_repository.dart';
import 'package:mobx/mobx.dart';

part 'main_state.g.dart';

class MainState = MainStateBase with _$MainState;

abstract class MainStateBase with Store {
  MainStateBase(this._storageRepository, this._animalRepository);

  final StorageRepository _storageRepository;
  final AnimalRepository _animalRepository;

  @observable
  ObservableList<AnimalModel> animals = ObservableList.of([]);

  @observable
  bool isPaidPremium = false;

  @action
  void onLoadAnimals() {
    animals.clear();
    animalModel = null;

    isPaidPremium =
        _storageRepository.shared<bool>(SharedKeys.subscription.key) ?? false;

    animals.addAll(_animalRepository.onGetAnimals());
    animalModel = animals[currentIndex ?? 0];
  }

  @observable
  int? currentIndex;

  @observable
  AnimalModel? animalModel;

  @action
  void onSelectCurrentModel(int index) {
    currentIndex = index;
    animalModel = animals[currentIndex ?? 0];
  }
}
