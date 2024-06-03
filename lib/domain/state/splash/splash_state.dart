import 'package:animals/conventions/enum/shared_keys.dart';
import 'package:animals/data/hive/models/animal/animal_model.dart';
import 'package:animals/data/repository/animal_repository.dart';
import 'package:animals/data/repository/storage_repository.dart';
import 'package:mobx/mobx.dart';

part 'splash_state.g.dart';

class SplashState = SplashStateBase with _$SplashState;

abstract class SplashStateBase with Store {
  SplashStateBase(this._storageRepository, this._animalRepository);

  final StorageRepository _storageRepository;
  final AnimalRepository _animalRepository;

  @observable
  bool isFirstLaunch = true;

  @action
  void checkFirstLaunch() {
    isFirstLaunch =
        _storageRepository.shared<bool>(SharedKeys.firstLaunch.key) ?? true;

    if (isFirstLaunch && _animalRepository.onGetFreeAnimals().isEmpty) {
      _animalRepository.onSaveAnimal(AnimalModel(
          name: "Bull",
          description:
              "A bull is one of the most famous and positive animals on the market. "
              "The market is in positive territory, with stock and investors placing more money into "
              "the market. If the market is bullish, investors are confident about the market, which increases "
              "the price of stocks. This can continue for many years. \n\nIn particular, the time period between 31 December "
              "2011 and March 2015 was thought to be an upbeat time in this Indian market. The Sensex was up by over 98% this time.",
          image: "free/bull.png",
          isPaid: false));
      _animalRepository.onSaveAnimal(AnimalModel(
          name: "Bear",
          description: "The bear market happens to be exactly the opposite of "
              "a bull market. The outlook and attitude of investors towards the market "
              "are negative and pessimistic in a bear market, and this results in lower investment. "
              "The market is considered to be in a bearish mood when there is a drop of around 20%. It could last "
              "from a few days to a month. It could also happen when a country goes through a recession, which results "
              "in job losses, which, in turn, results in less investment. The Great Depression is the most well-known illustration "
              "of a bear run. The 2007 housing market crisis in the US is another example of a bearish trend.",
          image: "free/bear.png",
          isPaid: false));
      _animalRepository.onSaveAnimal(AnimalModel(
          name: "Turtle",
          description:
              "A turtle refers to investors in the stock market who invest for a longer period of time. as one makes the fewest number"
              " of trades and doesn’t focus on short term gains or losses. \n\nThe turtle works as the opposite of the rabbit. "
              "For example, a trader can consider investing in an IT company as the stock sees long term growth. So, after "
              "investing in the stock, one can expect the bearish trend to continue for some time. But in the long run, it can "
              "have better returns.",
          image: "free/turtle.png",
          isPaid: false));
      _animalRepository.onSaveAnimal(AnimalModel(
          name: "Rabbit",
          description:
              "Rabbits are traders who purchase stocks and hold their positions for a short amount of time. They tend to be "
              "intraday traders who are seeking a quick return. Rabbits may not even have an overnight position and are "
              "always searching for quick cash in the daytime. \n\nConsider, for instance, a scenario where shares of a particular "
              "company were purchased at 11:30 a.m. The decision to buy the stock was based on the anticipation of a price "
              "increase in the near future. As the stock aligned with expectations and saw an uptick around 2:30 p.m. on the "
              "same day, the decision was made to sell, realising a profit. This scenario illustrates the behaviour of a rabbit investor.",
          image: "free/rabbit.png",
          isPaid: false));
      _animalRepository.onSaveAnimal(AnimalModel(
          name: "Pig",
          description:
              "An investor is a pig who is emotional and greedy. The returns aren’t enough for them. They also ignore "
              "established investment strategies and attempt to earn a huge profit. As a result, pigs always suffer a "
              "massive loss or gain. \n\nIn a similar scenario, if a profit is made over the long term and the decision is "
              "to stay invested with the hope of maximising returns, it is categorised as a pig-investor. This approach "
              "entails the potential for significant gains but also the risk of losing all profits.",
          image: "free/pig.png",
          isPaid: false));
      /* paid */
      _animalRepository.onSaveAnimal(AnimalModel(
          name: "Chicken",
          description:
              "A chicken is an investor who flies out in difficult times. They get scared even at the slightest bear "
              "tendency and make rash decisions about their investments. They are often unaware that volatility is "
              "a component of the stock market and are constantly worried about losing their money. \n\nFor example, a "
              "lot of investors sell all their stock when they see a red line on the graph. This can affect their "
              "investment and reduce the value of them.",
          image: "sub/chicken.png",
          isPaid: true));
      _animalRepository.onSaveAnimal(AnimalModel(
          name: "Ostrich",
          description:
              "Ostriches are known to possess an individual character. They are known to bury their heads in the "
              "sand when things get difficult. They do not pay attention to unpleasant situations and pray that "
              "they will disappear. Investors who behave this way are referred to as ostriches. They disregard "
              "the adverse market conditions and continue their investments in the hope of the market’s ability "
              "to eventually come back to normal in time.",
          image: "sub/ostrich.png",
          isPaid: true));
      _animalRepository.onSaveAnimal(AnimalModel(
          name: "Sheep",
          description:
              "Sheep are well-known for their herd-like mentality. Investors with an identical mindset are referred "
              "to as sheep. They tend to follow an investment recommendation blindly, without putting any thought "
              "into their personal opinions. They’re usually not comfortable deciding on their own investment plans "
              "and are the last ones to follow an upward trend and abandon the downward trend.",
          image: "sub/sheep.png",
          isPaid: true));
      _animalRepository.onSaveAnimal(AnimalModel(
          name: "Dog",
          description:
              "Dogs are stocks that are less popular but are part of a larger market. They’re hammered because of "
              "their performance. Analysts and investors are expecting that they will recover. \n\nA noteworthy "
              "illustration is found in smaller struggling IT firms. Hindered by competition and a lack of recognition, "
              "they may rebound upon identifying and rectifying their shortcomings.",
          image: "sub/german.png",
          isPaid: true));
      _animalRepository.onSaveAnimal(AnimalModel(
          name: "Wolf",
          description:
              "In the movie Wolf of Wall Street, American broker Jordan Belfort, who pleaded guilty to stock fraud, "
              "serves as a portrayal of how wolves operate in the investment realm. Similar to their powerful and "
              "often unscrupulous counterparts, these investors don’t hesitate to resort to scams and deceit to maximise their earnings.",
          image: "sub/wolf.png",
          isPaid: true));
      _animalRepository.onSaveAnimal(AnimalModel(
          name: "Lame Duck",
          description:
              "Lame duck refers to an investor who is not able to pay their debts for the day and is in debt. Lame "
              "duck can also describe those who have become bankrupt. The idea of margin calls originated at the "
              "beginning of the London Stock Exchange where investors could not pay the debt at the time of day. "
              "Today, a margin call could be viewed as an example of being a lazy duck.",
          image: "sub/duck.png",
          isPaid: true));
      _animalRepository.onSaveAnimal(AnimalModel(
          name: "Whale",
          description:
              "Whales are investors, usually unidentified, who make an unusually large amount of money in the "
              "market for stocks. Whale orders can alter the direction of the stock and have an impact on "
              "market fluctuations and also. Hedge funds are often connected with whale orders.",
          image: "sub/whale.png",
          isPaid: true));
      _animalRepository.onSaveAnimal(AnimalModel(
          name: "Shark",
          description:
              "Sharks are investors who entice consumers to invest in obscure securities that offer large returns. "
              "They manipulate the prices of stocks by trading among themselves, and when prices rise, they "
              "sell the stock to retail investors and then disappear.",
          image: "sub/shark.png",
          isPaid: true));
    }
  }
}
