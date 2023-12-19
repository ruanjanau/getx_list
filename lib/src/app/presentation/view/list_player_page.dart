import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_list/src/app/data/datasource/datasource.dart';
import 'package:getx_list/src/app/dio/mock_api.dart';
import '../controller/controller.dart';
import 'components/details.dart';

class ListPlayerPage extends StatefulWidget {
  const ListPlayerPage({super.key});

  @override
  State<ListPlayerPage> createState() => _ListPlayerPageState();
}

class _ListPlayerPageState extends State<ListPlayerPage> {
  late final PlayersController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PlayersController(
      dataSource: PlayersDataSource(
        playersApi: PlayersApi(),
      ),
    );
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
            if (_controller.loading.value) {
              return const CircularProgressIndicator();
            }
            return ListView.builder(
                itemCount: _controller.allPlayers.length,
                itemBuilder: (_, index) {
                  final player = _controller.allPlayers[index];
                  return PlayersTile(
                    name: player.name!,
                    profession: player.profession!,
                    image: player.image!,
                  );
                });
          }),
        ));
  }
}
