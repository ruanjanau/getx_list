import 'package:dartz/dartz.dart';

import '../entities/players_entity.dart';
import '../error/error.dart';
import '../repository/repository.dart';

abstract class IGetPlayersUseCase {
  Future<Either<PlayersError, List<PlayersEntity>>> call();
}

class PlayersUseCase implements IGetPlayersUseCase {
  final IPlayersRepository repository;

  PlayersUseCase(this.repository);
  @override
  Future<Either<PlayersError, List<PlayersEntity>>> call() {
    return repository.getAll();
  }
}
