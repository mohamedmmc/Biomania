import 'package:Biomania2/constant/colors.dart';
import 'package:Biomania2/widgets/custom_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../constant/app_fonts.dart';
import '../../../widgets/custom_image_view.dart';

class FancyCard extends StatelessWidget {
  const FancyCard({
    Key? key,
    required this.image,
    required this.name,
    required this.job,
    required this.date,
    required this.price,
    required this.onPressed,
  }) : super(key: key);

  final String image;
  final String name;
  final String job;
  final String date;
  final String price;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                child: CustomImageView(
                  imagePath: image,
                  height: 100.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                  radius: BorderRadius.circular(25.0),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "historique",
                      style: AppFonts.x12RegularUnderline,
                    ),
                    Row(
                      children: [
                        Text(name, style: AppFonts.x12Bold),
                        Text(".", style: AppFonts.x12Bold),
                        Text(job, style: AppFonts.x12Bold),
                      ],
                    ),
                    Row(
                      children: [
                        Text(date, style: AppFonts.x12Regular),
                        const Text(" "),
                        Text(price, style: AppFonts.x12Bold),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          backgroundColor: kGrey,
                          titleColor: kBlackColor,
                          title: "commander",
                          width: 130,
                          height: 40,
                          onPressed: onPressed,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
