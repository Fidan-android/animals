import 'package:animals/config/route/app_route.gr.dart';
import 'package:animals/data/hive/models/animal/animal_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage(
      {Key? key,
      required this.index,
      required this.animalModel})
      : super(key: key);

  final int index;
  final AnimalModel animalModel;

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/${widget.animalModel.image}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: GestureDetector(
                        onTap: () => AutoRouter.of(context).pop(),
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x14000000), blurRadius: 16)
                            ],
                          ),
                          child: SvgPicture.asset(
                            "assets/images/settings/arrow_left.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        widget.animalModel.description,
                        style: Theme.of(context).primaryTextTheme.bodyMedium,
                      ),
                    ),
                    Visibility(
                      visible: widget.animalModel.isLock == true,
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
                                      .push(QuizRoute(index: widget.index))
                                      .then((value) => setState(() {
                                            if (value != null) {
                                              widget.animalModel.isLock =
                                                  (value as AnimalModel).isLock;
                                            }
                                          })),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(64),
                                    ),
                                  ),
                                  child: Text(
                                    "Play Quiz",
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
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
