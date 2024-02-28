import 'package:flutter/material.dart';

import '../../../constant/app_fonts.dart';
import '../../../constant/colors.dart';
import '../../../constant/sizes.dart';
import '../../../widgets/custom_buttons.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/map.dart';

class CustomMapCard extends StatelessWidget {
  const CustomMapCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 300,
        width: 300,
        child: Stack(
          children: [
            // CustomImageView as background
            MapView(),
            // Texts in top left
             Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Commander',
                    style: AppFonts.x20Bold.copyWith(color: kBlackColor),
                  ),
                  Text(
                    'maintenat',
                    style:AppFonts.x20Bold.copyWith(color: kBlackColor),
                  ),
                ],
              ),
            ),
            // Button in bottom left
            Positioned(
              bottom: 16,
              left: 16,
              child: CustomButton(
                radius: 35,
                height: 90,
                backgroundColor: Colors.black,
                titleColor: Colors.white,
                onPressed: (){
      
                },
                icon: Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
