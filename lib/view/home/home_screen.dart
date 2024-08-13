import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

import '../../constant/app_fonts.dart';
import '../../constant/colors.dart';
import '../../constant/sizes.dart';
import '../../widgets/custom_image_view.dart';
import 'components/custom_map_card.dart';
import 'components/historique_card.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(Paddings.exceptional,
                Paddings.exceptional, Paddings.exceptional, 0),
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Centering the row horizontally
                  children: [
                    // Left-aligned container for "Hello" and "Sophie"
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello",
                              style: AppFonts.x30Regular
                                  .copyWith(color: kNeutralLightColor)),
                          Text("Sophie", style: AppFonts.x30Bold),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: CustomImageView(
                          imagePath: "assets/images/pilotes/1.jpeg",
                          height: 150.0,
                          width: 150.0,
                          fit: BoxFit.cover,
                          radius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                const CustomMapCard(),
                const SizedBox(
                  height: 50.0,
                ),
                Stack(children: [
                  // Positioned(
                  //   top: -30,
                  //   left: 0,
                  //   right: 0,
                  //   child: SizedBox(
                  //     child: FancyCard(
                  //       image: controller.previousCard.image,
                  //       name: controller.previousCard.name, job: controller.previousCard.job, date: controller.previousCard.date, price: controller.previousCard.price,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 250,
                    child: StackedCardCarousel(
                      applyTextScaleFactor: true,
                      type: StackedCardCarouselType.fadeOutStack,
                      // spaceBetweenItems: 20,
                      initialOffset: 0,
                      pageController: controller.pageController,
                      items: controller.fancyCards.map((data) {
                        return FancyCard(
                          image: data.image,
                          name: data.name,
                          job: data.job,
                          date: data.date,
                          price: data.price,
                          onPressed: controller.navigateToMission,
                        );
                      }).toList(),
                      onPageChanged: controller.scrollHistoricList,
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
