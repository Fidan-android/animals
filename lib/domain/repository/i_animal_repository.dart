import 'package:animals/data/hive/models/animal/animal_model.dart';

abstract class IAnimalRepository {
  List<AnimalModel> onGetAnimals();
  
  List<AnimalModel> onGetFreeAnimals();

  List<AnimalModel> onGetPaidAnimals();

  void onSaveAnimal(AnimalModel model);

  void onUpdateAnimal(int index, AnimalModel animalModel);
}
