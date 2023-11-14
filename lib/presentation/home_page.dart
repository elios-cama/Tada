import 'package:flutter/material.dart';
import 'package:tada/presentation/widgets/posts_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "TA-DA TEST",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFE300FF),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 8),
        child: PostsList(),
      ),
    );
  }
}
