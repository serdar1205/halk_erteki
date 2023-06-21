import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../../data/model/tale_model.dart';
import '../../custom_widgets/readingCard.dart';
import '../../utils/constants.dart';

class ReadingPage extends StatelessWidget {
  const ReadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.7),
          itemCount: allTales.length,
          itemBuilder: (context, int index) {
            return MyCard(
              taleModel: allTales[index],
              index: index,
            );
          }),
    );
  }
}
