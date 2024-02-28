import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/historique.dart';

class HomeController extends GetxController {
  static String routeName = '/home';
  final List<HistoriqueModel> fancyCards = <HistoriqueModel>[
    HistoriqueModel(
      image: "assets/images/pilotes/1.jpeg",
      name: 'Say hello to planets!', job: 'aa', date: '11.02.2022', price: '52,30',

    ),
    HistoriqueModel(
      image: "assets/images/pilotes/2.jpeg",
      name: "Don't be sad!", job: 'aa', date: '11.02.2022', price: '52,30',
    ),
    HistoriqueModel(
      image: "assets/images/pilotes/3.jpeg",
      name: "Go for a walk!", job: 'aa', date: '11.02.2022', price: '52,30',
    ),
    HistoriqueModel(
      image: "assets/images/pilotes/4.jpeg",
      name: "Try teleportation!", job: 'aa', date: '11.02.2022', price: '52,30',
    ),
    HistoriqueModel(
      image: "assets/images/pilotes/5.jpeg",
      name: "Enjoy your coffee!", job: 'aa', date: '11.02.2022', price: '52,30',
    ),
    HistoriqueModel(
      image: "assets/images/pilotes/6.jpeg",
      name: "Play with your cat!", job: 'aa', date: '11.02.2022', price: '52,30',
    ),HistoriqueModel(
      image: "assets/images/pilotes/1.jpeg",
      name: 'Say hello to planets!', job: 'aa', date: '11.02.2022', price: '52,30',
    ),
    HistoriqueModel(
      image: "assets/images/pilotes/2.jpeg",
      name: "Don't be sad!", job: 'aa', date: '11.02.2022', price: '52,30',
    ),
  ];
  late HistoriqueModel previousCard;
  late PageController pageController;

  HomeController() {
    // fancyCardsShowed = fancyCards.take(3).toList();
    pageController =PageController(keepPage: false,initialPage: 0);
    previousCard = fancyCards[0];
  }

  void scrollHistoricList(int currentIndex) {
  //   if (currentIndex + 3 < fancyCards.length) {
  //     var aze = fancyCards.firstWhere((element) => element.id == fancyCardsShowed.elementAt(currentIndex).id);
  //     fancyCardsShowed = fancyCards.sublist(currentIndex).take(currentIndex).toList();
  //   }
  //   print(currentIndex);
  //   pageController.animateToPage(currentIndex, duration: const Duration(seconds: 3), curve: Curves.bounceIn);

    previousCard = fancyCards[currentIndex > 0 ? currentIndex - 1 : currentIndex];
    update();
  }
  Future<void> navigateToMission() async {
    Get.toNamed("mission");
  }
}
