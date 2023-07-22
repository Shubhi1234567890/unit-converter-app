import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unit_converter/Scrollpage.dart';
import 'package:video_player/video_player.dart';
import 'package:unit_converter/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
   // _controller = VideoPlayerController.asset('assets/conanimation.mp4');
    Timer(Duration(seconds: 7), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Scrollpage()));
    });
  }

  /*void _playvideo() async {
    _controller.play();
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushNamed(context, '/');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal,
                Colors.blueGrey,

              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    width: 500,
                    child: Center(child: Text('U-Versify', style: TextStyle(
                        fontSize: 90,
                        color: Colors.black,
                        fontFamily: 'FontSplash'),)),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                   child: Image.asset('assets/images/convertor.png'),
                   /* child: _controller.value.isInitialized
                        ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(
                        _controller,
                      ),
                    )
                        :Container(),*/
                  ),
              ],






              ),
            ),
          ),
        )
    );
  }
}

