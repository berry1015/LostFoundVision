import 'package:flutter/material.dart';
import 'package:fortest/main.dart';

import 'alarmTap.dart'; // alarmTap.dart
import 'categoryTap.dart'; // categoryTap.dart 파일
import 'join.dart';
import 'searchTap.dart'; // searchTap.dart 파일

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
  ));
}

void goToAnotherPage(BuildContext context, String pageName){
  // 버튼에 따라 그에 해당하는 파일로 이동
  switch(pageName){
    case "JoinScreen":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => JoinScreen()),
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

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  UserData? registeredUser; // Store the registered user data

  @override
  Widget build(BuildContext context) {

    TextEditingController _idController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    void login() {
      String logId = _idController.text;
      String logPassword = _passwordController.text;

      if (registeredUser != null &&
          logId == registeredUser!.id &&
          logPassword == registeredUser!.password) {
        // Navigate to the home screen or any other screen upon successful login
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (Route<dynamic> route) => false,
        );
      } else {
        // Display an error message or handle unsuccessful login
        print("Invalid ID or password");
      }
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              child: TextField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'ID'),
                maxLines: 1,
              ),
            ),
            Container(
              width: 200,
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'PW'),
                maxLines: 1,
                obscureText: true, // Hide the password
              ),
            ),

            SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                // 로그인 함수 호출
                // 로그인 함수 만들어야함 
                login();
              },
              child: Container(
                width: 150, height: 40,
                alignment: Alignment.center,
                child: Text('로그인', style: TextStyle(fontSize: 25)),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    goToAnotherPage(context, "JoinScreen");
                  },
                  child: Text('회원가입', style: TextStyle(fontSize: 20, decoration: TextDecoration.underline)),
                ),

                SizedBox(width: 10),

                TextButton(
                  onPressed: () {
                    // 비밀번호 찾기 버튼을 눌렀을 때 실행할 작업
                    // 비밀번호 찾기 페이지로 이동
                  },
                  child: Text('비밀번호 찾기', style: TextStyle(fontSize: 20, decoration: TextDecoration.underline)),
                ),
              ],
            ),
          ],
        ),
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