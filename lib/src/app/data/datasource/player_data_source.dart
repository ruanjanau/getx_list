import 'dart:async';
import '../../dio/dio.dart';
import '../model/model.dart';

abstract class IPlayersDataSource {
  FutureOr<List<PlayersModel>> getPlayers();
}

class PlayersDataSource implements IPlayersDataSource {
  final MockApi mockApi;

  PlayersDataSource(this.mockApi);
  @override
  FutureOr<List<PlayersModel>> getPlayers() async {
    final response = await mockApi.dioClient.get('${mockApi.baseUrl}users/');

    return (response.data as List).map(PlayersModel.fromJson).toList();
  }
}
