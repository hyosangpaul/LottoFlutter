import 'package:flutter/material.dart';
// dart의 math 클래스
import 'dart:math';

void main() {
  runApp(const LottoMotto());
}

class LottoMotto extends StatelessWidget {
  const LottoMotto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lotto Motto',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MainPage(title: 'Lotto Motto'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});


  final String title;

  @override
  State<MainPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {
  List<int> lottoSet = [];

  void lottoNumber() {
    setState(() {
      while (true) {
      var rnd = Random().nextInt(45) + 1;
      if (!lottoSet.contains(rnd)) {
        lottoSet.add(rnd);
      }
      if (lottoSet.length == 6) break;
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Container로 여러 widget 추가
            Container(
              margin: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('버튼을 눌러 번호를 확인하세요')
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('$lottoSet')
                ]
              )
            )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: lottoNumber,
        tooltip: 'lottoNumber',
        child: const Icon(Icons.add),
      ),
    );
  }
}
