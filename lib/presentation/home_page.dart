import 'package:flutter/material.dart';
import 'package:tada/presentation/widgets/post_tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            PostTile(
              name: "Jean",
              title: "Title test",
            ),
            PostTile(
              name: "Jean",
              title: "Title test",
            ),
            PostTile(
              name: "Jean",
              title: "Title test",
            ),
            PostTile(
              name: "Jean",
              title: "Title test",
            ),
            PostTile(
              name: "Jean",
              title: "Title test",
            ),
            PostTile(
              name: "Jean",
              title: "Title test",
            ),
            PostTile(
              name: "Jean",
              title: "Title test",
            ),
            PostTile(
              name: "Jean",
              title: "Title test",
            ),
          ],
        ),
      ),
    );
  }
}
