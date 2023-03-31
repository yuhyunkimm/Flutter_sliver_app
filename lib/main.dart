import 'package:flutter/material.dart';
import 'package:sliver_app/ad.dart';
import 'package:sliver_app/diary.dart';

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
            // snap은 floating과 함께 쓴다
            snap: true,
            floating: true,
            title: Text("SliverAppbar"),
            // appbar 고정 여부
            pinned: false,
            // appbar 높이를 늘림
            expandedHeight: 250,
            // 기본 appbar 높이 60이다
            flexibleSpace: Container(
              child: Text(
                "FlexiblaSpace",
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          SliverAppBar(
            title: Text("SliverAppbar"),
            // appbar 고정 여부
            pinned: true,
            // appbar 높이를 늘림
            //expandedHeight: 250,
          ),
          // SliverChildListDelegate : 무조건
          // Sliver사이에 박스를 넣고 싶을 때 사용
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              height: 200,
            ),
          ),
          // CustomScrollView(
          //   scrollDirection: Axis.horizontal,
          //   slivers: [
          //     SliverList(delegate: SliverChildListDelegate(
          //       [
          //         Text("1"),
          //         Text("2"),
          //         Text("3"),
          //       ]
          //     ),
          //     ),
          //   ],
          // ),
          SliverFixedExtentList(
            itemExtent: 100,
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
              (context, index) {
                if (index % 4 == 0 && index != 0) {
                  return Ad(index: (index / 4).toInt());
                } else {
                  return Diary(index: index);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  SliverList buildSliverList() {
    return SliverList(
      // SliverChildBuilderDelegate - Builder라서 재활용
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            height: 100,
            alignment: Alignment.center,
            // 조도는 1~9 까지 % 를 붙혀줘야한다
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text("List Item $index"),
          );
        },
      ),
    );
  }
}
