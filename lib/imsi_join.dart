import 'package:flutter/material.dart';
import 'package:fortest/main.dart';

import 'join.dart';

class ImsiJoinScreen extends StatelessWidget {
  final UserData userData;

  ImsiJoinScreen({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('가입 정보 확인'),
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
            Text('이름: ${userData.name}', style: TextStyle(fontSize: 20)),
            Text('ID: ${userData.id}', style: TextStyle(fontSize: 20)),
            Text('PW: ${userData.password}', style: TextStyle(fontSize: 20)),
            Text('이메일: ${userData.email}', style: TextStyle(fontSize: 20)),
            Text('닉네임: ${userData.nickname}', style: TextStyle(fontSize: 20)),
            // Add other fields as needed
          ],
        ),
      ),
    );
  }
}
