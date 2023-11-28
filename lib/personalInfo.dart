import 'package:flutter/material.dart';
import 'package:fortest/main.dart';

import 'alarmTap.dart'; // alarmTap.dart 파일
import 'categoryTap.dart'; // categoryTap.dart 파일
import 'login.dart'; // login.dart 파일
import 'searchTap.dart'; // searchTap.dart 파일

void main() {
  runApp(MaterialApp(
    home: PersonalInfoScreen(),
  ));
}

void goToAnotherPage(BuildContext context, String pageName) {
  // 버튼에 따라 그에 해당하는 파일로 이동
  switch (pageName) {
    case "LoginScreen":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      break;

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

class PersonalInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('개인정보'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (Route<dynamic> route) => false,
              );
            },
          )
        ],
      ),
      
      body: Column(
        children: [
          InkWell(
            onTap: () {
              goToAnotherPage(context, "LoginScreen");
            },
            child: Container(
              width: double.infinity,
              height: 400,
              color: Color.fromARGB(255, 121, 203, 250),
              child: Center(
                child: Text(
                  '로그인 해주세요 :)',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          SizedBox(height: 30),

          InkWell(
            onTap: () {
              // '내 게시글 보기' 버튼을 누를 때 실행할 작업
              // 예: goToAnotherPage(context, "MyPosts");
            },
            child: Row(
              children: [
                SizedBox(width:10),
                Icon(Icons.note, size: 40),
                SizedBox(width: 20),
                Text("내 게시글 보기", style: TextStyle(fontSize: 30)),
              ],
            ),
          ),

          SizedBox(height: 20),

          InkWell(
            onTap: () {
              // '프로필 수정' 버튼을 누를 때 실행할 작업
              // 예: goToAnotherPage(context, "EditProfile");
            },
            child: Row(
              children: [
                SizedBox(width:10),
                Icon(Icons.person, size: 40),
                SizedBox(width: 20),
                Text("프로필 수정", style: TextStyle(fontSize: 30)),
              ],
            ),
          ),

          SizedBox(height: 20),

          InkWell(
            onTap: () {
              // '비밀번호 변경' 버튼을 누를 때 실행할 작업
              // 예: goToAnotherPage(context, "ChangePassword");
            },
            child: Row(
              children: [
                SizedBox(width:10),
                Icon(Icons.lock, size: 40),
                SizedBox(width: 20),
                Text("비밀번호 변경", style: TextStyle(fontSize: 30)),
              ],
            ),
          ),

          SizedBox(height: 20),

          InkWell(
            onTap: () {
              // '회원 탈퇴' 버튼을 누를 때 실행할 작업
              // 예: goToAnotherPage(context, "Withdrawal");
            },
            child: Row(
              children: [
                SizedBox(width:10),
                Icon(Icons.account_circle, size: 40),
                SizedBox(width: 20),
                Text("회원 탈퇴", style: TextStyle(fontSize: 30)),
              ],
            ),
          ),
        ],
      ),

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
