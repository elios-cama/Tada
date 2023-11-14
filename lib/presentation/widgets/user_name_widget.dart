import '../../data/users_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
