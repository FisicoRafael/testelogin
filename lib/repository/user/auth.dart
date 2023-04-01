import 'package:dartz/dartz.dart';
import 'package:testelogin/DTO/user/user_dto.dart';
import '../../datasource/auth/data_source.dart';
import '../../entities/user/user.dart';
import '../../errors/exceptions.dart';
import '../../errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({required String cpf});
}

class AuthRepositoryIMP implements AuthRepository {
  final AuthDatasource authDatasource;

  AuthRepositoryIMP({required this.authDatasource});

  @override
  Future<Either<Failure, User>> login({required String cpf}) async {
    try {
      final resp = await authDatasource.login(cpf: cpf);
      User user = UserDTO.fromMap(resp.data.first);
      return Right(user);
    } on RequestException catch (e) {
      return Left(RequestFailure(e.message ?? "Erro"));
    } catch (e) {
      return Left(GeneralFailure(message: "$e"));
    }
  }
}
