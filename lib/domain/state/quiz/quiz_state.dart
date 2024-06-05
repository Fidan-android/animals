import 'package:animals/data/hive/models/animal/animal_model.dart';
import 'package:animals/data/repository/animal_repository.dart';
import 'package:mobx/mobx.dart';

part 'quiz_state.g.dart';

class QuizState = QuizStateBase with _$QuizState;

abstract class QuizStateBase with Store {
  QuizStateBase(this._animalRepository);

  final AnimalRepository _animalRepository;

  @observable
  AnimalModel? animalModel;

  List<List<Map<String, String>>> allQuestions = [
    [
      {"Does a bull market indicate a decline in stock prices?": "no"},
      {"Are investors generally confident during a bull market?": "yes"},
      {"Can a bull market last for several years?": "yes"}
    ],
    [
      {"Is a bear market characterized by rising stock prices?": "no"},
      {
        "Does a bear market often lead to reduced investment from a pessimistic outlook?":
            "yes"
      },
      {"Can a bear market last only a few days?": "yes"}
    ],
    [
      {"Do turtle investors prefer short-term trading?": "no"},
      {"Is long-term growth a focus for turtle-type investors?": "yes"},
      {"Do turtles make frequent trades?": "no"}
    ],
    [
      {"Are rabbits known for holding their stock positions long-term?": "no"},
      {"Do rabbit traders aim for quick profits?": "yes"},
      {"Is it common for rabbits to engage in intraday trading?": "yes"}
    ],
    [
      {"Are pig investors known for their cautious investment strategy?": "no"},
      {
        "Do pigs often ignore standard investment strategies out of greed?":
            "yes"
      },
      {"Is emotional trading a characteristic of a pig investor?": "yes"}
    ],
    [
      {
        "Do chickens hold onto their investments during market downturns?": "no"
      },
      {
        "Are chickens known for making rash decisions based on market volatility?":
            "yes"
      },
      {"Is being risk-averse typical for a chicken investor?": "yes"}
    ],
    [
      {
        "Do ostrich investors typically stay well-informed about market conditions?":
            "no"
      },
      {"Are ostriches known for ignoring adverse market conditions?": "yes"},
      {"Is an ostrich's investment strategy generally proactive?": "no"}
    ],
    [
      {
        "Do sheep investors like to research and make independent investment decisions?":
            "no"
      },
      {"Is following the herd a common trait among sheep investors?": "yes"},
      {"Are sheep usually quick to react to new market trends?": "no"}
    ],
    [
      {"Are dog stocks generally well-performing and popular?": "no"},
      {"Is recovery expected from dog stocks?": "yes"},
      {"Do analysts typically have high expectations for dog stocks?": "no"}
    ],
    [
      {"Are wolves in the stock market known for ethical investing?": "no"},
      {"Do wolves use deceptive practices to maximize profits?": "yes"},
      {
        "Is a wolf investor likely to prioritize transparency with their investment strategies?":
            "no"
      }
    ],
    [
      {"Does a lame duck refer to a highly successful investor?": "no"},
      {
        "Is being a lame duck associated with financial difficulties in settling trades?":
            "yes"
      },
      {"Can a lame duck be someone who is bankrupt?": "yes"}
    ],
    [
      {
        "Are whale investors typically unknown and make small market movements?":
            "no"
      },
      {"Do whale orders often influence market prices significantly?": "yes"},
      {"Are hedge funds commonly associated with whale activities?": "yes"}
    ],
    [
      {"Do sharks prioritize ethical trading practices?": "no"},
      {
        "Are sharks known for manipulating stock prices for personal gain?":
            "yes"
      },
      {
        "Do sharks typically offer investments in well-known and stable stocks?":
            "no"
      }
    ],
  ];

  @observable
  bool? isFirstAnswerCorrect;

  @observable
  bool? isSecondAnswerCorrect;

  @observable
  bool? isThirdAnswerCorrect;

  List<Map<String, String>> questionsOfAnimal = [];

  @observable
  int currentIndexOfQuestion = 0;

  @observable
  bool isShowFirstResult = false;

  @observable
  bool isShowSecondResult = false;

  @observable
  bool isShowThirdResult = false;

  int? _indexOfAnimal;

  @action
  void onConfigureQuiz(int index) {
    _indexOfAnimal = index;

    var temp = [];
    temp.addAll(_animalRepository.onGetFreeAnimals());
    temp.addAll(_animalRepository.onGetPaidAnimals());

    animalModel = temp[index];

    questionsOfAnimal.addAll(allQuestions[index]);
  }

  @action
  void onCheckAnswer(String answer) {
    if (currentIndexOfQuestion == 0) {
      isFirstAnswerCorrect =
          questionsOfAnimal[currentIndexOfQuestion].values.first == answer;
      isShowFirstResult = true;
    }
    if (currentIndexOfQuestion == 1) {
      isSecondAnswerCorrect =
          questionsOfAnimal[currentIndexOfQuestion].values.first == answer;
      isShowSecondResult = true;
    }
    if (currentIndexOfQuestion == 2) {
      isThirdAnswerCorrect =
          questionsOfAnimal[currentIndexOfQuestion].values.first == answer;
      isShowThirdResult = true;
    }
  }

  @action
  void onNextQuestion() {
    isShowFirstResult = false;
    isShowSecondResult = false;
    isShowThirdResult = false;
    currentIndexOfQuestion++;
  }

  @action
  void onTryAgain() {
    isShowFirstResult = false;
    isShowSecondResult = false;
    isShowThirdResult = false;

    if (currentIndexOfQuestion == 0) {
      isFirstAnswerCorrect = null;
    } else if (currentIndexOfQuestion == 1) {
      isSecondAnswerCorrect = null;
    } else {
      isThirdAnswerCorrect = null;
    }
  }

  @action
  void onRestartQuiz() {
    isShowFirstResult = false;
    isShowSecondResult = false;
    isShowThirdResult = false;
    isFirstAnswerCorrect = null;
    isSecondAnswerCorrect = null;
    isThirdAnswerCorrect = null;
    currentIndexOfQuestion = 0;
  }

  @action
  void onSaveSolvedResult() {
    if (_indexOfAnimal != null && animalModel != null) {
      animalModel!.isLock = false;
      _animalRepository.onUpdateAnimal(_indexOfAnimal!, animalModel!);
    }
  }
}
