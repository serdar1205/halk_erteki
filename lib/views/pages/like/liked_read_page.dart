import 'package:flutter/material.dart';
import 'package:halk_erteki/examples/testLike.dart';
import 'package:halk_erteki/views/utils/constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import '../../../data/model/tale_model.dart';
import '../../custom_widgets/readingCard.dart';

class LikedReadPage extends StatelessWidget {
  LikedReadPage({Key? key}) : super(key: key);

  Box<TaleModel> box = Hive.box<TaleModel>(favoritesBox);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halanlarym"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, Box<TaleModel> value, _) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.7),
                itemCount: box.values.length,
                itemBuilder: (context, int index) {
                  // final currentLikeIndex = likedlist[index];
                  return MyCard(
                    taleModel: value.getAt(index)!,
                    index: index,
                  );
                });
          },
        ),
      ),
    );
  }
}
