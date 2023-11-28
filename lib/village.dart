import 'package:flutter/material.dart';
import 'package:fortest/main.dart';

import 'alarmTap.dart'; // alarmTap.dart 파일
import 'categoryTap.dart'; // categoryTap.dart 파일
import 'searchTap.dart'; // searchTap.dart 파일

void main() {
  runApp(MaterialApp(
    home: VillageScreen(),
  ));
}

void goToAnotherPage(BuildContext context, String pageName){
  // 버튼에 따라 그에 해당하는 파일로 이동
  switch(pageName){
    case "CategoryTap":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CategoryTapScreen()),
      );
      break;

    case "SearchTap":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchTapScreen()),
      );
      break;

    case "AlarmTap":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AlarmTapScreen()),
      );
      break;
  }
}

class VillageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 동네 설정'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: (){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (Route<dynamic> route) => false,
              );
            },
          )
        ],
      ),

      body: Center(
        child: Text(
          '내 동네 설정',
          style: TextStyle(fontSize: 24),
        ),
      ),

     // 하단 탭바 (카테고리, 검색, 알림)
    bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "카테고리",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "검색",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "알림",
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0: // 카테고리 탭
              goToAnotherPage(context, "CategoryTap");
              break;
            case 1: // 검색 탭
              goToAnotherPage(context, "SearchTap");
              break;
            case 2: // 알림 탭
              goToAnotherPage(context, "AlarmTap");
              break;
          }
        },
      ),

    );
  }
}
