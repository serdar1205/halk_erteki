import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../../data/model/tale_model.dart';
import '../../custom_widgets/reading_screen_widget.dart';
import '../../utils/constants.dart';

class ReadingScreen extends StatefulWidget {
  final TaleModel taleModel;

  const ReadingScreen({super.key, required this.taleModel});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  double fontSize = 16;
  Box<TaleModel> box = Hive.box<TaleModel>(favoritesBox);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        actions: [
          buildTextSize(),
        ],
      ),
      body: SingleChildScrollView(
        child: ReadingScreenWidget(
          taleModel: widget.taleModel, //allTales[widget.index],
          fontSize: fontSize,
        ),
      ),
    );
  }

  PopupMenuButton buildTextSize() {
    return PopupMenuButton<double>(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<double>>[
        const PopupMenuItem<double>(
          value: 16,
          child: Text('Kiçi tekst'),
        ),
        const PopupMenuItem<double>(
          value: 20,
          child: Text('Uly tekst'),
        ),
      ],
      onSelected: (double item) {
        setState(() {
          fontSize = item;
        });
        print(fontSize);
      },
    );
  }
}
