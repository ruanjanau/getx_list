import 'package:flutter/material.dart';

class ListPlayer extends StatelessWidget {
  const ListPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Jogadores'),
      ),
      body: const Center(child: Text('Olha a Lista aí!!!')),
    );
  }
}
