import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tada/presentation/pages/user_detail_page.dart';

import '../../data/posts_repository.dart';
import '../widgets/comments_widgets.dart';
import '../widgets/user_name_widget.dart';

class PostDetailsPage extends ConsumerWidget {
  const PostDetailsPage({super.key, required this.postId});

  final int postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(fetchPostProvider(postId));

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        title: Text(
          'Post $postId',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.black,
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: UserDetailsPage(userId: post.userId),
                        ),
                      );
                    },
                    child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage('assets/profile_picture.png'),
                      ),
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
                CommentsWidget(postId: postId),
                const SizedBox(height: 16),
              ],
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (e, st) => Center(
            child: Text(
              e.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
