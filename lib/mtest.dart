import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:halk_erteki/views/pages/listening_page.dart';
import 'package:halk_erteki/views/pages/reading_page.dart';
import 'package:halk_erteki/views/utils/constants.dart';
import 'package:halk_erteki/views/utils/theme.dart';
import 'logic/cubit/read_cubit.dart';
import 'logic/cubit/read_state.dart';

class HomePageTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
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
          //title
          Container(
            margin: EdgeInsets.all(8),
            width: width - 140,
            child: Center(
                child: Text(
              "Turkmen halk ertekileri",
              style: TextStyle(color: Colors.black, fontSize: 20),
            )),
          ),
          //like
          BlocBuilder<ReadCubit, ReadState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  if (state.isRead == true)
                    Navigator.pushNamed(context, likedListenPage);
                  else
                    Navigator.pushNamed(context, songPage);
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
      ),
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
                      //color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: CupertinoSlidingSegmentedControl<bool>(
                    backgroundColor: Colors.white,
                    //padding: EdgeInsets.symmetric(vertical: 10),
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
                                    : AppColors.whiteColor),
                          ),
                        ),
                      ),
                      false: Container(
                        height: 40,
                        child: Center(
                          child: Text(
                            "Dinlemek",
                            style: TextStyle(
                                fontSize: 17,
                                color: state.isRead == false
                                    ? AppColors.whiteColor
                                    : AppColors.mainbuttonColor),
                          ),
                        ),
                      ),
                    },
                    onValueChanged: (bool? value) {
                      context.read<ReadCubit>().readToListen();
                      // setState(
                      //       () {
                      //     grvalue = value!;
                      //   },
                      // );
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
}
