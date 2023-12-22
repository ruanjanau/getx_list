import 'package:get/instance_manager.dart';
import '../../data/datasource/datasource.dart';
import '../../dio/players_api.dart';
import '../controller/controller.dart';

bindingPlayer() {
  Get.put<PlayersController>(
    PlayersController(
      dataSource: PlayersDataSource(
        playersApi: PlayersApi(),
      ),
    ),
  );
}
