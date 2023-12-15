import 'package:dartz/dartz.dart';

import '../entities/enities.dart';
import '../error/error.dart';

abstract class IPlayersRepository {
  Future<Either<PlayersError, List<PlayersEntity>>> getAll();
}
