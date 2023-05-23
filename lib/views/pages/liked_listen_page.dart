import 'package:flutter/material.dart';
import 'package:halk_erteki/views/utils/constants.dart';
import '../custom_widgets/myCard.dart';

class LikedListenPage extends StatelessWidget {
  const LikedListenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  image: '1.jpg',
                  title: 'Turkmen halk ertekileri Shamar',
                  press: () {
                    Navigator.pushNamed(context, songPage);
                  },);
              }),
        ),

    );
  }
}
