import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MyAnimatedText extends StatelessWidget {
  const MyAnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text('Animated Text Widget'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedTextKit(
            //   animatedTexts: [
            //     TypewriterAnimatedText("I'm Muhammad Umer"),
            //     TypewriterAnimatedText("I'm Flutter Developer"),
            //     TypewriterAnimatedText("I'm Learning Animated Text"),
            //   ],
            //   totalRepeatCount: 2,
            // ),
            // AnimatedTextKit(animatedTexts: [
            //   RotateAnimatedText('Hello World')
            // ]),
            // AnimatedTextKit(animatedTexts:[
            //   WavyAnimatedText('Mohammad Umer',textStyle: TextStyle(
            //     fontSize: 30,
            //     fontWeight: FontWeight.w700,
            //     color: Colors.indigo
            //   )),
            //
            // ],totalRepeatCount: 2,),
            AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText('do IT!',textStyle: TextStyle(fontSize: 30)),
                FadeAnimatedText('do it RIGHT!!',textStyle: TextStyle(fontSize: 30)),
                FadeAnimatedText('do it RIGHT NOW!!!',textStyle: TextStyle(fontSize: 30)),
              ],
              totalRepeatCount: 3,
            ),
          ],
        ),
      ),
    );
  }
}
