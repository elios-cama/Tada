import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tada/presentation/widgets/post_tiles.dart';

import '../../data/posts_repository.dart';
import '../../domain/post.dart';

class PostsList extends ConsumerWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(fetchPostsProvider);
    final newPostAsync = ref.watch(createPostProvider);

    return postsAsync.maybeWhen(
      data: (posts) {
        final List<Post> allPosts = [...posts];

        newPostAsync.maybeWhen(
          data: (newPost) {
            allPosts.insert(0, newPost);
          },
          orElse: () {},
        );

        return ListView.builder(
          itemCount: allPosts.length,
          itemBuilder: (context, index) {
            final post = allPosts[index];
            return PostTile(post: post);
          },
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      orElse: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
