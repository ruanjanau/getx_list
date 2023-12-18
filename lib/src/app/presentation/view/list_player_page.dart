import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';
import 'components/details.dart';

class ListPlayerPage extends StatelessWidget {
  final PlayersController _playersController = Get.find<PlayersController>();
  ListPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Jogadores'),
        ),
        body: Center(
          child: Obx(() {
            if (_playersController.loading.value) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                  itemCount: _playersController.allPlayers.length,
                  itemBuilder: (_, index) {
                    final player = _playersController.allPlayers[index];
                    return PlayersTile(
                      name: player.name,
                      profession: player.profession,
                      image: player.image,
                    );
                  });
            }
          }),
        ));
  }
}
