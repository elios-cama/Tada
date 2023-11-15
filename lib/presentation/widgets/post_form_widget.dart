import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tada/application/new_post_provider.dart';

import '../../domain/post.dart';

class PostForm extends ConsumerStatefulWidget {
   const PostForm({super.key});

  @override
  ConsumerState createState() => _PostFormState();
}

class _PostFormState extends ConsumerState {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  void _submitForm(WidgetRef ref) async {
    final title = _titleController.text;
    final body = _bodyController.text;

    final newPost = Post(userId: 1, id: 101, title: title, body: body);
    ref.read(newPostProvider.notifier).state = newPost;

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add a New Post',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextFormField(
            controller: _bodyController,
            decoration: const InputDecoration(labelText: 'Body'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _submitForm(ref),
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
