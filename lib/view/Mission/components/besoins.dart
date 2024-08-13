import 'package:Biomania2/constant/app_fonts.dart';
import 'package:Biomania2/constant/colors.dart';
import 'package:Biomania2/view/Mission/components/plan_hour.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../constant/constants.dart';
import '../../../widgets/custom_buttons.dart';
import '../mission_controller.dart';

class Besoins extends StatefulWidget {
  static int indexValue = 3;
  final MissionController controller;

  const Besoins({Key? key, required this.controller}) : super(key: key);

  @override
  State<Besoins> createState() => _PlanDateState();
}

class _PlanDateState extends State<Besoins> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppConstants.yourCommande, style: AppFonts.x30Bold),
          Text(AppConstants.VosBesoins,
              style: AppFonts.x20Bold.copyWith(color: kBlackColor)),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppConstants.typeDeLogement,
                style: AppFonts.x20Bold.copyWith(color: kBlackColor)),
          ),
          GridView.custom(
            gridDelegate: SliverWovenGridDelegate.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              pattern: [
                const WovenGridTile(1),
                const WovenGridTile(
                  5 / 7,
                  crossAxisRatio: 0.9,
                  alignment: AlignmentDirectional.centerEnd,
                ),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => const Text("data"),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                radius: 35,
                height: 90,
                backgroundColor: backButton,
                titleColor: Colors.black,
                onPressed: () {
                  widget.controller.changeTab(PlanHour.indexValue);
                }, //controller.navigateToInscription,
                icon: Icons.chevron_left_sharp,
              ),
              CustomButton(
                radius: 35,
                height: 90,
                backgroundColor: Colors.black,
                titleColor: Colors.white,
                onPressed: () {
                  widget.controller.changeTab(PlanHour.indexValue);
                }, //controller.login,
                icon: Icons.done,
              )
            ],
          ),
        ],
      ),
    );
  }
}
