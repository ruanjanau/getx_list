import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/app/data/model/model.dart';
import 'src/app/presentation/view/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/home': (_) => const HomePage(),
        '/player_details/': (context) {
          final player =
              ModalRoute.of(context)!.settings.arguments as PlayersModel;
          return PlayerDetails(player: player);
        }
      },
    );
  }
}
