import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:halk_erteki/logic/cubit/read_cubit.dart';
import 'package:halk_erteki/logic/cubit/read_state.dart';
import 'package:halk_erteki/views/pages/listen/listening_page.dart';
import 'package:halk_erteki/views/pages/read/reading_page.dart';
import 'package:halk_erteki/views/utils/constants.dart';
import 'package:halk_erteki/views/utils/theme.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: buildMainAppBar(width, context),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: BlocBuilder<ReadCubit, ReadState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  height: screenheight * 0.8 + 20,
                  child: state.isRead == true ? ReadingPage() : ListeningPage(),
                ),
                //bottom button
                Container(
                  // height: 50,
                  width: width - 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)),
                  child: CupertinoSlidingSegmentedControl<bool>(
                    backgroundColor: Theme.of(context).backgroundColor,
                    thumbColor: AppColors.mainbuttonColor,
                    children: {
                      true: Container(
                        height: 50,
                        child: Center(
                          child: Text(
                            "Okamak",
                            style: TextStyle(
                                fontSize: 17,
                                color: state.isRead == false
                                    ? AppColors.mainbuttonColor
                                    : AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      false: Container(
                        height: 40,
                        child: Center(
                          child: Text(
                            "Diňlemek",
                            style: TextStyle(
                                fontSize: 17,
                              color: state.isRead == false
                                    ? AppColors.whiteColor
                                    : AppColors.mainbuttonColor3,
                            ),
                          ),
                        ),
                      ),
                    },
                    onValueChanged: (bool? value) {
                      context.read<ReadCubit>().readToListen();
                    },
                    groupValue: state.isRead,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  AppBar buildMainAppBar(double width, BuildContext context) {
    return AppBar(
      actions: [
        GestureDetector(
          onTap: (){
            ThemeServices().switchTheme();
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mainbuttonColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            // height: 40,
            width: 40,
            child: SvgPicture.asset(
              'assets/icons/moon.svg',
              fit: BoxFit.contain,
            ),
          ),
        ),
        //title
        Container(
          margin: EdgeInsets.all(8),
          width: width - 140,
          child: Center(
              child: Text(
                "Turkmen halk ertekileri",
                style: Theme.of(context).appBarTheme.titleTextStyle,
              )),
        ),
        //like
        BlocBuilder<ReadCubit, ReadState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                //if (state.isRead == true)
                  Navigator.pushNamed(context, likedReadPage);
                //else
                 // Navigator.pushNamed(context, likedListenPage);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.likeColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.all(8),
                margin:
                EdgeInsets.only(right: 15, left: 8, bottom: 8, top: 8),
                // height: 40,
                width: 40,

                child: SvgPicture.asset(
                  'assets/icons/like.svg',
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
