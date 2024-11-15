import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기차 예매'),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectStation('출발역'),
                    SizedBox(
                      width: 2,
                      height: 50,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                    SelectStation('도착역'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('좌석 선택'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column SelectStation(String startEnd) {
    return Column(
      children: [
        Text('$startEnd'),
        TextButton(onPressed: () {}, child: Text('선택')),
      ],
    );
  }
}
