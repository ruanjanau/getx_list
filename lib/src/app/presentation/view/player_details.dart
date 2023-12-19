import 'package:flutter/material.dart';
import 'components/details.dart';

import '../../data/model/model.dart';

class PlayerDetails extends StatelessWidget {
  final PlayersModel player;
  const PlayerDetails({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Detalhes do Jogador'),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: 300.0,
            child: Image.network(
              fit: BoxFit.cover,
              player.image!,
              width: double.maxFinite,
              height: 300.0,
            ),
          ),
          const SizedBox(height: 20.0),
          DetailsPlayerItem(label: 'Nome do Jogador', value: player.name!),
          DetailsPlayerItem(label: 'Idade', value: player.idade!),
          DetailsPlayerItem(
              label: 'Data de Nascimento', value: player.aniversario!),
          DetailsPlayerItem(label: 'Profissão', value: player.profession!),
          DetailsPlayerItem(label: 'Time Atual', value: player.team!),
          DetailsPlayerItem(label: 'País de Origem', value: player.country!),
        ],
      ),
    );
  }
}
