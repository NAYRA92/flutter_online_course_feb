import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedWidgetPage extends StatefulWidget {
  const AnimatedWidgetPage({super.key});

  @override
  State<AnimatedWidgetPage> createState() => _AnimatedWidgetPageState();
}

class _AnimatedWidgetPageState extends State<AnimatedWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text("Here is the animations of text"),
            Container(
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(width: 20.0, height: 100.0),
                  const Text(
                    'Be',
                    style: TextStyle(fontSize: 43.0),
                  ),
                  const SizedBox(width: 20.0, height: 100.0),
                  DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: 43.0,
                        fontFamily: 'Gilroy',
                        color: Colors.green),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        RotateAnimatedText('AWESOME'),
                        RotateAnimatedText('OPTIMISTIC'),
                        RotateAnimatedText('DIFFERENT'),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ],
              ),
            ),

            //second animated text
            SizedBox(
              width: 250.0,
              height: 100,
              child: DefaultTextStyle(
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[600]),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FadeAnimatedText('do IT!'),
                    FadeAnimatedText('do it RIGHT!!'),
                    FadeAnimatedText('do it RIGHT NOW!!!'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),

            //animate a flutter widget
            Container(
              height: 100,
              width: 100,
              color: Colors.blueGrey,
            )
                .animate()
                .fade(duration: 1000.ms)
                .scale()
          ],
        ),
      ),
    );
  }
}
