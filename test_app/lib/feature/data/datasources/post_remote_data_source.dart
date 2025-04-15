import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_app/core/error/exception.dart';
import 'package:test_app/feature/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<PostModel> getPost(int id);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final dio = Dio();
  @override
  Future<List<PostModel>> getAllPosts() async {
    final responce =
        await dio.get('https://jsonplaceholder.typicode.com/posts');
    if (responce.statusCode == 200) {
      final posts = json.decode(responce.data);
      return (posts as List).map((post) => PostModel.fromJson(post)).toList();
    } else {
      throw ServerExcption();
    }
  }

  @override
  Future<PostModel> getPost(int id) async {
    final responce =
        await dio.get('https://jsonplaceholder.typicode.com/posts/$id');
    if (responce.statusCode == 200) {
      final post = json.decode(responce.data);
      return (post).map((post) => PostModel.fromJson(post));
    } else {
      throw ServerExcption();
    }
  }
}
