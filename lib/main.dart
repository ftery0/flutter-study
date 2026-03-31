import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/widgets_screen.dart';
import 'screens/navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 위젯 공부',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainScreen(),
    );
  }
}

// ============================================================
// 하단 네비게이션 바 메인 화면
// ============================================================
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // 탭에 해당하는 화면 목록
  final List<Widget> _screens = [
    const HomeScreen(),
    const WidgetsScreen(),
    const NavigationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: '위젯 기초',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: '화면 이동',
          ),
        ],
      ),
    );
  }
}
