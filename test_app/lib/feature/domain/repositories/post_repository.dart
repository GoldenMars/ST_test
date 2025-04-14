import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/feature/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getAllPosts();
  Future<Either<Failure, PostEntity>> getPost(int id);
}
