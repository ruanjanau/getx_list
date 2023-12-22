// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import 'components/details.dart';
import 'package:get/instance_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PlayersController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.find<PlayersController>();
    _controller.getPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Jogadores'),
        ),
        body: Center(
          child: Obx(() {
            return _controller.loading.value
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: _controller.allPlayers.length,
                    itemBuilder: (_, index) {
                      final player = _controller.allPlayers[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/player_details/',
                            arguments: player,
                          );
                        },
                        child: PlayersTile(
                          name: player.name!,
                          profession: player.profession!,
                          image: player.image!,
                        ),
                      );
                    });
          }),
        ));
  }
}
