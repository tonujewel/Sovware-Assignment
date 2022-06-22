import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sovware_assignment/AppStyle/app_style.dart';
import 'package:sovware_assignment/screens/splash_screen/splash_screen.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sovware_assignment/services/home_service.dart';
import 'AppStyle/pallate.dart';
import 'resources/api_provider.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ApiProvider()),
        RepositoryProvider(create: (context) => HomeService()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Palette.kToDark,
          primaryColor: AppStyle.backgroundColor,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
