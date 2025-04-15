import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/core/error/exception.dart';
import 'package:test_app/feature/data/models/post_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getLastPostFromCache();
  Future<void> postsToCache(List<PostModel> posts);
}

const cachedPostsList = 'CACHED_POSTS_LIST';

class PostLocalDataSourceImpl implements PostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<List<PostModel>> getLastPostFromCache() {
    final jsonPostsList = sharedPreferences.getStringList(cachedPostsList);
    if (jsonPostsList!.isNotEmpty) {
      return Future.value(jsonPostsList
          .map((post) => PostModel.fromJson(json.decode(post)))
          .toList());
    } else {
      throw CacheExcption();
    }
  }

  @override
  Future<void> postsToCache(List<PostModel> posts) {
    final List<String> jsonPostsList =
        posts.map((post) => json.encode(post.toJson())).toList();

    sharedPreferences.setStringList(cachedPostsList, jsonPostsList);
    print('Posts to cache: ${jsonPostsList.length}');
    return Future.value(jsonPostsList);
  }
}
