import 'dart:convert';
import 'package:application/data/http/http_client.dart';
import 'package:application/data/models/post_model.dart';

abstract class IPostRepository {
  Future<List<PostModel>> getPosts();
  Future<void> createPost(PostModel post);
}

class PostRepository implements IPostRepository {
  static const url = 'http://10.0.2.2:8080/posts';
  // static const url = 'http://10.8.13.219:8080/posts';

  final IHttpClient client;

  PostRepository({
    required this.client,
  });

  @override
  Future<List<PostModel>> getPosts() async {
    final List<PostModel> postList = [];

    try {
      final response = await client.get(url: url);
      final data = jsonDecode(response.body);
      data.forEach((post) => postList.add(PostModel.fromMap(post)));
      return postList;
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    }
  }

  @override
  Future<void> createPost(PostModel post) async {
    try {
      final response = await client.post(
        url: url,
        body: post.toMap(),
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to create post: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to create post: $e');
    }
  }
}
