import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:halk_erteki/views/utils/custom_text.dart';
import 'package:halk_erteki/views/utils/theme.dart';

import '../../data/model/tale_model.dart';

class ReadingScreenWidget extends StatelessWidget {
  ReadingScreenWidget({
    Key? key,
    required this.taleModel,
    required this.fontSize,
  }) : super(key: key);

  TaleModel taleModel;
  final double fontSize;

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
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 5),
              child: Image.asset(
                "assets/images/${taleModel.image}.jpg",
                fit: BoxFit.fitWidth,
              ),
            ),
            //like
            // Positioned(
            //     top: 10,
            //     right: 10,
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(10),
            //       child: Container(
            //         width: 40,
            //         height: 40,
            //         color: AppColors.whiteLikeColor,
            //         child: Center(
            //           child: SvgPicture.asset(
            //             'assets/icons/like.svg',
            //             color: AppColors.likeColor,
            //             fit: BoxFit.contain,
            //             height: 20,
            //             width: 20,
            //           ),
            //         ),
            //       ),
            //     )),
          ],
        ),
        //title
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: TitleText(taleModel.title),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: BodyText(taleModel.body, fontSize: fontSize)),
      ],
    );
  }
}
