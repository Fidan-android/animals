import 'package:animals/data/hive/models/animal/animal_model.dart';
import 'package:animals/domain/repository/i_animal_repository.dart';
import 'package:hive/hive.dart';

class AnimalRepository extends IAnimalRepository {
  final _animalBox = Hive.box<AnimalModel>('animal_box');

  @override
  List<AnimalModel> onGetAnimals() => _animalBox.values.toList();

  @override
  List<AnimalModel> onGetFreeAnimals() {
    return _animalBox.values.where((animal) => !animal.isPaid).toList();
  }

  @override
  List<AnimalModel> onGetPaidAnimals() {
    return _animalBox.values.where((animal) => animal.isPaid).toList();
  }

  @override
  void onSaveAnimal(AnimalModel model) {
    _animalBox.add(model);
  }

  @override
  void onUpdateAnimal(int index, AnimalModel animalModel) {
    _animalBox.putAt(index, animalModel);
  }
}
