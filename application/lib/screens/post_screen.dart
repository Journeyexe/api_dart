import 'dart:convert';
import 'dart:typed_data';

import 'package:application/data/models/post_model.dart';
import 'package:application/data/repositories/post_repository.dart';
import 'package:application/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:application/data/http/http_client.dart';

class PostScreen extends StatefulWidget {
  static const routeName = '/post_screen';
  final PostModel post;

  const PostScreen({
    super.key,
    required this.post,
  });

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final repository = PostRepository(client: HttpClient());

  @override
  Widget build(BuildContext context) {
    Uint8List imageBytes = base64Decode(widget.post.imagem);
    return Scaffold(
      appBar: CustomAppBar(title: widget.post.texto),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.memory(imageBytes),
            Text(
              widget.post.texto,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
