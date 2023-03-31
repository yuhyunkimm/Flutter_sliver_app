import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 스크롤이 될때 행동,방향 등... 모두 지시 할 수 있다
      body: CustomScrollView(
        // 계산(스크롤시?)
        slivers: [
          SliverAppBar(
            title: Text("SliverAppbar"),
            // appbar 고정 여부
            pinned: false,
            // appbar 높이를 늘림
            expandedHeight: 250,
          ),
          SliverAppBar(
            title: Text("SliverAppbar"),
            // appbar 고정 여부
            pinned: true,
            // appbar 높이를 늘림
            //expandedHeight: 250,
          ),
          // -> 위에 앱바를 두개 붙혀주면 위에 앱바를 밀어내고 밑에것을 대체된다
          SliverList(
            // SliverChildBuilderDelegate - Builder라서 재활용
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 50,
                  alignment: Alignment.center,
                  // 조도는 1~9 까지 % 를 붙혀줘야한다
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text("List Item $index"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
