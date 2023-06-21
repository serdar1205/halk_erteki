import 'package:flutter/material.dart';
import 'package:halk_erteki/views/utils/constants.dart';
import '../../../data/model/tale_model.dart';
import '../../custom_widgets/readingCard.dart';

class LikedListenPage extends StatelessWidget {
  const LikedListenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //List<TaleModel> tales = TaleModel.allTales;
    return Scaffold(
      appBar: AppBar(
        title: Text("Halanlarym"),
      ),
      body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7
              ),
              itemCount: 3,
              itemBuilder: (context, int index) {
                return MyCard(
                  taleModel: TaleModel(
                      image: allTales[index].image,
                      title: allTales[index].title,
                      body: allTales[index].body),
                  index: index,
                );
              }),
        ),

    );
  }
}
