import 'package:flutter/material.dart';
import 'package:halk_erteki/views/pages/listen/listening_page.dart';
import 'package:halk_erteki/views/pages/read/reading_page.dart';
import 'package:halk_erteki/views/utils/constants.dart';
import '../pages/home_page.dart';
import '../pages/like/liked_listen_page.dart';
import '../pages/like/liked_read_page.dart';


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


      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
