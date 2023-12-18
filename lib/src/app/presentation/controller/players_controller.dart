import 'package:get/get.dart';
import 'package:getx_list/src/app/domain/usecase/get_player_use_case.dart';
import '../../domain/entities/enities.dart';

class PlayersController extends GetxController {
  final RxBool loading = false.obs;
  final RxList<PlayersEntity> allPlayers = <PlayersEntity>[].obs;

  final PlayersUseCase _playersUseCase;

  PlayersController(this._playersUseCase);

  @override
  void onInit() {
    super.onInit();
    getPlayers();
  }

  Future<void> getPlayers() async {
    try {
      loading.value = true;
      final players = await _playersUseCase.call();

      allPlayers.assignAll(players as Iterable<PlayersEntity>);
      loading.value = false;
    } catch (e) {
      loading.value = false;
      print('Erro ao carregar items da list de players $e');
    }
  }
}
