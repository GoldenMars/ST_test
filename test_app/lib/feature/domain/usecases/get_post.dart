import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/core/usecases/usecase.dart';
import 'package:test_app/feature/domain/entities/post_entity.dart';
import 'package:test_app/feature/domain/repositories/post_repository.dart';

class GetPosts extends Usecase<PostEntity, PostIdParams> {
  final PostRepository postRepository;

  GetPosts(this.postRepository);

  Future<Either<Failure, PostEntity>> call(PostIdParams params) async {
    return await postRepository.getPost(params.id);
  }
}

class PostIdParams extends Equatable {
  final int id;

  PostIdParams({required this.id});
  @override
  List<Object> get props => [id];
}
