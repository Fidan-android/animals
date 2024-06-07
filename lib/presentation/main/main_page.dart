import 'package:animals/config/route/app_route.gr.dart';
import 'package:animals/data/hive/models/animal/animal_model.dart';
import 'package:animals/data/repository/animal_repository.dart';
import 'package:animals/data/repository/storage_repository.dart';
import 'package:animals/domain/state/main/main_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final CarouselController _carouselController = CarouselController();
  late MainState _mainState;

  @override
  void initState() {
    _mainState = MainState(
      Provider.of<StorageRepository>(context, listen: false),
      Provider.of<AnimalRepository>(context, listen: false),
    );
    _mainState.onLoadAnimals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Animals",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w700, fontSize: 24),
                    ),
                    GestureDetector(
                      onTap: () => AutoRouter.of(context)
                          .pushNamed("/settings-page")
                          .then((value) => _mainState.onLoadAnimals()),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Color(0x14000000), blurRadius: 16)
                          ],
                        ),
                        child: SvgPicture.asset(
                          "assets/images/main/settings.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Observer(builder: (_) {
                  if (_mainState.animals.isEmpty) {
                    return Center(
                      child: Text(
                        "No data",
                        style: Theme.of(context).primaryTextTheme.bodyMedium,
                      ),
                    );
                  }

                  return CarouselSlider.builder(
                    carouselController: _carouselController,
                    itemCount: _mainState.animals.length,
                    options: CarouselOptions(
                        height: 400.0,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          _mainState.onSelectCurrentModel(index);
                        }),
                    itemBuilder: (context, index, realIndex) {
                      AnimalModel animal = _mainState.animals[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: GestureDetector(
                          onTap: () => {
                            if (_mainState.animalModel?.isPaid == true &&
                                !_mainState.isPaidPremium)
                              {
                                AutoRouter.of(context)
                                    .pushNamed("/premium-page")
                                    .then((value) => _mainState.onLoadAnimals())
                              }
                            else
                              {
                                AutoRouter.of(context)
                                    .push(AnimalRoute(
                                        index: _mainState.animals
                                            .indexOf(_mainState.animalModel),
                                        animalModel: _mainState.animalModel!))
                                    .then((value) => _mainState.onLoadAnimals())
                              }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.14),
                                    blurRadius: 16,
                                    blurStyle: BlurStyle.outer)
                              ],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        foregroundDecoration: animal.isLock
                                            ? const BoxDecoration(
                                                color: Color(0xFF747474),
                                                backgroundBlendMode:
                                                    BlendMode.saturation,
                                              )
                                            : null,
                                        width: double.infinity,
                                        child: Image.asset(
                                          "assets/images/${animal.image}",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Observer(
                                        builder: (_) => Visibility(
                                          visible: _mainState
                                                      .animalModel?.isPaid ==
                                                  true &&
                                              !_mainState.isPaidPremium &&
                                              _mainState.animals.indexOf(
                                                      _mainState.animalModel) ==
                                                  index,
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: SvgPicture.asset(
                                                  "assets/images/main/lock.svg"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(32),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        animal.name,
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w700),
                                      ),
                                      SvgPicture.asset(
                                          "assets/images/main/arrow_forward.svg"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              Observer(
                builder: (_) => Visibility(
                  visible: _mainState.animalModel?.isPaid == true &&
                      !_mainState.isPaidPremium,
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 24, right: 16, left: 16),
                          child: SizedBox(
                            width: double.infinity,
                            height: 64,
                            child: ElevatedButton(
                              onPressed: () => AutoRouter.of(context)
                                  .pushNamed("/premium-page")
                                  .then((value) => _mainState.onLoadAnimals()),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(64),
                                ),
                              ),
                              child: Text(
                                "Unlock an Animal",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
