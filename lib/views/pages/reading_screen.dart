import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:halk_erteki/views/utils/theme.dart';
import '../../data/myData.dart';
import '../custom_widgets/reading_screen_widget.dart';
import '../utils/custom_text.dart';

class ReadingScreen extends StatefulWidget {

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  double fontSize = 16;

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
        child: ReadingScreenWidget(image: '1.jpg', titleText: 'titleText', fontSize: fontSize, bodyText: bodyText),
      ),
    );
  }

  PopupMenuButton buildTextSize() {
    return PopupMenuButton<double>(
      itemBuilder: (BuildContext context) =>
      <PopupMenuEntry<double>>[
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


