import 'package:flutter/material.dart';
import '../custom_widgets/myCard.dart';
import '../utils/constants.dart';

class ReadingPage extends StatelessWidget {
  const ReadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              childAspectRatio: 0.7
            ),
            itemCount: 9,
            itemBuilder: (context, int index) {
              return MyCard(
                image: '1.jpg',
                title: 'Turkmen halk ertekileri Shamar',
                press: () {
                  Navigator.pushNamed(context, readingText);
                },);
            }),

    );
  }
}
