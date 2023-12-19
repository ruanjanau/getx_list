import 'dart:async';

import 'package:getx_list/src/app/dio/mock_api.dart';

import '../model/model.dart';

abstract class IPlayersDataSource {
  FutureOr<List<PlayersModel>> getPlayers();
}

class PlayersDataSource implements IPlayersDataSource {
  final PlayersApi playersApi;

  PlayersDataSource({required this.playersApi});
  @override
  FutureOr<List<PlayersModel>> getPlayers() async {
    final response =
        await playersApi.dioClient.get('${playersApi.baseUrl}users/');

    return (response.data as List).map(PlayersModel.fromJson).toList();
  }
}
