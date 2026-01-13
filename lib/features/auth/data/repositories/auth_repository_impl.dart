import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> loginWithEmail(
      String email, String password) async {
    try {
      final user = await remoteDataSource.loginWithEmail(email, password);
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected Error'));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmail(
      String email, String password) async {
    try {
      final user = await remoteDataSource.signUpWithEmail(email, password);
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected Error'));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      final user = await remoteDataSource.signInWithGoogle();
      return Right(user);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(ServerFailure(message: 'Unexpected Error'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();
      if (user != null) {
        return Right(user);
      } else {
        return const Left(CacheFailure(message: 'No user logged in'));
      }
    } catch (e) {
      return const Left(ServerFailure(message: 'Error getting current user'));
    }
  }
}
