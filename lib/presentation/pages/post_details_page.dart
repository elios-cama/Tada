import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/posts_repository.dart';
import '../../data/users_repository.dart';

class PostDetailsPage extends ConsumerWidget {
  const PostDetailsPage({super.key, required this.postId});

  final int postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(fetchPostProvider(postId));

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Post $postId',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple.shade500,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: postAsync.when(
          data: (post) => SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/profile_picture.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                UserNameWidget(post.userId),
                const SizedBox(height: 32),
                Text(
                  post.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Text(
                  post.body,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child:
                      Image.asset('assets/content.jpg', width: double.infinity),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  child: const Text('Edit'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (e, st) => Center(
            child: Text(
              e.toString(),
            ),
          ),
        ),
      ),
    );
  }
}

class UserNameWidget extends ConsumerWidget {
  const UserNameWidget(
    this.userId, {
    super.key,
  });

  final int userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(fetchUserProvider(userId));
    return userAsync.when(
        data: (user) => Text(
              "User : ${user.name}",
              // Replace with actual logic to get userId
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
        error: (e, st) => Center(
              child: Text(
                e.toString(),
              ),
            ),
        loading: () => const Text("John Doe"));
  }
}
