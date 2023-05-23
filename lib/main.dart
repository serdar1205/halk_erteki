import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:halk_erteki/logic/cubit/read_cubit.dart';
import 'package:halk_erteki/views/pages/home_page.dart';
import 'package:halk_erteki/views/routes/router.dart';
import 'package:halk_erteki/views/utils/constants.dart';
import 'package:halk_erteki/views/utils/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReadCubit>(
      create: (context) => ReadCubit(),
      child: GetMaterialApp(
        title: 'Turkmen halk ertekileri',
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

