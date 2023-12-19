import 'package:get/get.dart';
import 'package:getx_list/src/app/data/datasource/datasource.dart';
import 'package:getx_list/src/app/data/model/model.dart';

class PlayersController extends GetxController {
  final RxBool loading = false.obs;
  final RxList<PlayersModel> allPlayers = <PlayersModel>[].obs;

  final PlayersDataSource dataSource;
  PlayersController({required this.dataSource});

  getPlayers() async {
    loading.value = true;
    final players = await dataSource.getPlayers();
    allPlayers.addAll(players);

    loading.value = false;
  }
}
