import 'package:flutter/material.dart';
import 'package:fortest/alarmTap.dart';
import 'package:fortest/main.dart';
import 'package:fortest/searchTap.dart';

void goToAnotherPage(BuildContext context, String pageName) {
  // 버튼에 따라 그에 해당하는 파일로 이동
  switch (pageName) {
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

void main() {
  runApp(MaterialApp(
    home: CategoryTapScreen(),
  ));
}

class CategoryTapScreen extends StatefulWidget {
  @override
  _CategoryTapScreenState createState() => _CategoryTapScreenState();
}

class _CategoryTapScreenState extends State<CategoryTapScreen> {
  int _currentIndex = 0; // 현재 활성화된 탭 인덱스

  // 각 탭에 해당하는 제목
  List<String> _tabTitles = ["카테고리", "검색", "알림"];

  void _onTabTapped(int index) {
    String pageName;

    switch (index) {
      case 0:
        pageName = "CategoryTab";
        break;
      case 1:
        pageName = "SearchTab";
        break;
      case 2:
        pageName = "AlarmTab";
        break;
      default:
        pageName = "CategoryTab"; // Set a default page if needed
    }
    goToAnotherPage(context, pageName);

    setState(() {
      _currentIndex = index; // 탭 변경 시 _currentIndex 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;
    switch (_currentIndex) {
      case 0:
        currentScreen = Center(
          child: Text('카테고리', style: TextStyle(fontSize: 24)),
        ); // 카테고리 탭 화면
        break;
      case 1:
        currentScreen = Center(
          child: Text('검색', style: TextStyle(fontSize: 24)),
        ); // 검색 탭 화면
        break;
      case 2:
        currentScreen = Center(
          child: Text('알림', style: TextStyle(fontSize: 24)),
        ); // 알림 탭 화면
        break;
      default:
        currentScreen = Container(); // 예외 처리 - 이 부분을 다른 화면으로 대체하거나 적절히 처리
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_tabTitles[_currentIndex]),
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

      body: currentScreen, // 현재 선택된 탭에 대한 화면 표시

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 버튼 크기 고정
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "카테고리",
            backgroundColor: _currentIndex == 0 ? Colors.blue : null,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "검색",
            backgroundColor: _currentIndex == 1 ? Colors.blue : null,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "알림",
            backgroundColor: _currentIndex == 2 ? Colors.blue : null,
          ),
        ],
      ),
    );
  }
}
