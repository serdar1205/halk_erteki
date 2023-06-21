import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:halk_erteki/views/utils/custom_text.dart';
import 'package:halk_erteki/views/utils/theme.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import '../../data/model/tale_model.dart';
import '../../examples/testLike.dart';
import '../pages/read/reading_screen.dart';
import '../utils/constants.dart';

class MyCard extends StatelessWidget {
  TaleModel taleModel;
  final int index;

  MyCard({Key? key, required this.taleModel, required this.index})
      : super(key: key);

  Box<TaleModel> box = Hive.box<TaleModel>(favoritesBox);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ReadingScreen(
                taleModel: taleModel,
              ),
            ));
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
          children: [
            ///image
            Stack(
              children: [
                Container(
                  width: 175,
                  height: 175,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.asset(
                      'assets/images/' + taleModel.image + '.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                /// like
                Positioned(
                  top: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: Container(
                        width: 40,
                        height: 40,
                        color: AppColors.whiteLikeColor,
                        child: Center(
                            child: ValueListenableBuilder(
                          valueListenable: box.listenable(),
                          builder: (context, Box<TaleModel> value, _) {
                            return IconButton(
                              onPressed: () {
                                if (value.containsKey(taleModel.title)) {
                                  value.delete(taleModel.title);
                                } else {
                                  value.put(taleModel.title, taleModel);
                                }
                              },
                              icon: Icon(
                                value.containsKey(taleModel.title)
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: Colors.red,
                              ),
                            );
                          },
                        ))),
                  ),
                ),
              ],
            ),

            ///body
            Container(
              padding: EdgeInsets.all(10),
              child: CardTitleText(
                taleModel.title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
