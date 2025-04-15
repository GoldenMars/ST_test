import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/feature/data/datasources/post_local_data_source.dart';
import 'package:test_app/feature/data/datasources/post_remote_data_source.dart';
import 'package:test_app/feature/domain/entities/post_entity.dart';
import 'package:test_app/feature/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;

  PostRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PostEntity>> getPost(int id) {
    // TODO: implement getPost
    throw UnimplementedError();
  }
}
