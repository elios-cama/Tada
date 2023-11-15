import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/selected_user_provider.dart';

class FilterButton extends ConsumerWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUserId = ref.watch(selectedUserIdProvider);

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
        left: 8,
      ),
      child: DropdownButton<int?>(
        value: selectedUserId,
        onChanged: (userId) {
          ref.read(selectedUserIdProvider.notifier).state = userId;
        },
        icon: const Icon(
          Icons.filter_list,
          color: Colors.white,
        ),
        style: const TextStyle(color: Colors.white),
        underline: const SizedBox(),
        dropdownColor: Colors.black,
        items: [
          const DropdownMenuItem<int?>(
            value: null,
            child: Text('All Users'),
          ),
          for (int userId = 1; userId <= 10; userId++)
            DropdownMenuItem<int>(
              value: userId,
              child: Text('User $userId'),
            ),
        ],
      ),
    );
  }
}
