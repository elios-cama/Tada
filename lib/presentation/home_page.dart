import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tada/presentation/widgets/filter_button.dart';
import 'package:tada/presentation/widgets/post_form_widget.dart';
import 'package:tada/presentation/widgets/posts_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showPostForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Dialog(
        child: PostForm(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorizeColors = [
      Colors.deepPurple.shade700,
      Colors.purpleAccent.shade100
    ];
    const colorizeTextStyle = TextStyle(
      fontSize: 30.0,
      fontFamily: 'Horizon',
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'TA',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
            ColorizeAnimatedText(
              'TA-DA',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
          ],
          isRepeatingAnimation: true,
        ),
        backgroundColor: Colors.black,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterButton(),
          Expanded(
            child: PostsList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPostForm(context),
        elevation: 2,
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          color: Colors.deepPurple.shade500,
        ),
      ),
    );
  }
}
