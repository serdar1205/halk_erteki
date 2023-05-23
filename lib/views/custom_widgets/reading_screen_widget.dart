import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:halk_erteki/views/utils/custom_text.dart';
import 'package:halk_erteki/views/utils/theme.dart';

class ReadingScreenWidget extends StatelessWidget {
  const ReadingScreenWidget({
    Key? key,
    required this.image,
    required this.titleText,
    required this.fontSize,
    required this.bodyText,
  }) : super(key: key);

  final String image;
  final String titleText;
  final double fontSize;
  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            //img
            Container(
              height: 250,
              padding: EdgeInsets.only(bottom: 5),
              child: Image.asset(
                "assets/images/${image}",
                fit: BoxFit.cover,
              ),
            ),
            //like
            Positioned(
                top: 10,
                right: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 40,
                    height: 40,
                    color: AppColors.whiteLikeColor,
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/like.svg',
                        color: AppColors.likeColor,
                        fit: BoxFit.contain,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                )),
          ],
        ),
        //title
        Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: TitleText(
              titleText
            //    "Turkmen halk ertekisi Akylly Ahmet",
          ),
        ),
        Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: BodyText(
                bodyText, fontSize: fontSize)),
      ],
    );
  }
}