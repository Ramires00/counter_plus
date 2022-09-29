import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  int generateNumber() {
    Random random = new Random();
    int randomNumber = random.nextInt(6);
    return randomNumber;
  }

  Rx<Color> backgroundColor = Color(0xff70dcff).obs;

  final List colorList = [
    Color(0xff005180),
    Color(0xff6aff00),
    Color(0xffffa600),
    Color(0xff00ff83),
    Color(0xfff30d0d),
    Color(0xffd363ff)
  ];

  void backGroundColor() {}

  final RxInt counter = RxInt(0);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: backgroundColor.value,
        appBar: AppBar(
            title: Text(
              "Counter++",
              style: TextStyle(
                color: backgroundColor.value,
              ),
            ),
            backgroundColor: Colors.white),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () => Text(
                  counter.value.toString(),
                  style: TextStyle(fontSize: 45, color: Colors.white),
                ),
              ),
              FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  counter.value++;
                  backgroundColor.value = colorList[generateNumber()];
                },
                child: Icon(Icons.add, color: backgroundColor.value),
              )
            ],
          ),
        ),
      ),
    );
  }
}
