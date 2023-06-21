import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:halk_erteki/data/model/tale_model.dart';
import 'package:halk_erteki/logic/cubit/read_cubit.dart';
import 'package:halk_erteki/views/routes/router.dart';
import 'package:halk_erteki/views/utils/constants.dart';
import 'package:halk_erteki/views/utils/theme.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'logic/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await GetStorage.init();
  await Hive.initFlutter();
  Hive.registerAdapter<TaleModel>(TaleModelAdapter());
  await Hive.openBox<TaleModel>(favoritesBox);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReadCubit>(
      create: (context) => ReadCubit(),
      child: GetMaterialApp(
        title: 'Türkmen halk ertekileri',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: ThemeServices().theme,
        onGenerateRoute: Routers.generateRoute,
        initialRoute: homeRoute,
      ),
    );
  }
}
