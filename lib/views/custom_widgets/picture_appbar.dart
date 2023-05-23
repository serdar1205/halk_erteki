import 'package:flutter/material.dart';
import 'package:halk_erteki/views/utils/theme.dart';


class MainPicture extends StatelessWidget {
  const MainPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250,
      pinned: true,
     // primary: true,
      backgroundColor: AppColors.mainbuttonColor,
      flexibleSpace: FlexibleSpaceBar(
        //title: Text("Shamar"),
        background: Image.asset(
          "assets/images/c.jpg",
          fit: BoxFit.cover,
        ),
        centerTitle: true,
      ),
    );
  }
}