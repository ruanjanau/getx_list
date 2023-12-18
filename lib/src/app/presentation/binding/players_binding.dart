import 'package:get/get.dart';
import 'package:getx_list/src/app/data/datasource/datasource.dart';
import 'package:getx_list/src/app/data/repository/repository.dart';
import 'package:getx_list/src/app/dio/mock_api.dart';

import '../../domain/usecase/usecase.dart';

class PlayersBinding implements Bindings {
  @override
  void dependencies() {
    final MockApi mockApi = MockApi();

    final playersRepository =
        PlayersRepository(dataSource: PlayersDataSource(mockApi));

    Get.lazyPut<PlayersUseCase>(() => PlayersUseCase(playersRepository));
  }
}
