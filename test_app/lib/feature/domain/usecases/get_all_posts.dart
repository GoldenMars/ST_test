import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/core/usecases/usecase.dart';
import 'package:test_app/feature/domain/entities/post_entity.dart';
import 'package:test_app/feature/domain/repositories/post_repository.dart';

class GetAllPosts extends Usecase<List<PostEntity>, Null> {
  final PostRepository postRepository;

  GetAllPosts(this.postRepository);

  @override
  Future<Either<Failure, List<PostEntity>>> call(params) async {
    return await postRepository.getAllPosts();
  }
}
