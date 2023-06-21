import 'package:flutter/material.dart';
import 'package:halk_erteki/data/model/song_model.dart';
import '../../custom_widgets/listeningCard.dart';

class ListeningPage extends StatelessWidget {
  const ListeningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SongModel> tales = SongModel.songs;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.7),
            itemCount: tales.length,
            itemBuilder: (context, int index) {
              return ListeningCard(
                song: tales[index],
                index: index,
              );
            }),
      ),
    );
  }
}
