import 'package:flutter/material.dart';
import 'package:halk_erteki/views/pages/liked_read_page.dart';
import 'package:halk_erteki/views/pages/listening_page.dart';
import 'package:halk_erteki/views/pages/reading_page.dart';
import 'package:halk_erteki/views/utils/constants.dart';
import '../pages/home_page.dart';
import '../pages/liked_listen_page.dart';
import '../pages/reading_screen.dart';
import '../pages/song_page.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case likedListenPage:
        return MaterialPageRoute(builder: (_) => LikedListenPage());
      case likedReadPage:
        return MaterialPageRoute(builder: (_) => LikedReadPage());
      case listeningPagee:
        return MaterialPageRoute(builder: (_) => ListeningPage());
      case readingPagee:
        return MaterialPageRoute(builder: (_) => ReadingPage());
      case readingText:
        return MaterialPageRoute(builder: (_) => ReadingScreen());
      case songPage:
        return MaterialPageRoute(builder: (_) => SongScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
