import 'package:dartz/dartz.dart';

import '../../domain/entities/players_entity.dart';
import '../../domain/error/error.dart';
import '../../domain/repository/repository.dart';
import '../datasource/datasource.dart';

class PlayersRepository implements IPlayersRepository {
  final IPlayersDataSource dataSource;

  PlayersRepository({required this.dataSource});
  @override
  Future<Either<PlayersError, List<PlayersEntity>>> getAll() async {
    try {
      var result = await dataSource.getPlayers();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(PlayersError.unexpected());
    }
  }
}
