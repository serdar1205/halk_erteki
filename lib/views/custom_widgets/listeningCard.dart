import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:halk_erteki/data/model/song_model.dart';
import 'package:halk_erteki/views/utils/custom_text.dart';
import 'package:halk_erteki/views/utils/theme.dart';
import '../pages/listen/music_test.dart';
import '../pages/listen/song_page.dart';
import '../pages/read/reading_screen.dart';

class ListeningCard extends StatelessWidget {
  final SongModel song;
  final int index;

  ListeningCard({Key? key, required this.song, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => MTest(
                  songModel: song,

                )));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 175,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.7), width: 0.3),
          //color: AppColors.cardBodyColor,
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///image
            Stack(
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 150
                  ),
                  width: 175,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.asset(
                      'assets/images/' + song.image + '.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                /// like
                Positioned(
                    top: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
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
                      ),
                    )),
              ],
            ),

            ///body
            Container(
              padding: EdgeInsets.all(10),
              child: CardTitleText(
                song.title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
