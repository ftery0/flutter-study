import 'package:flutter/material.dart';
import '../widgets/widget_basics.dart';

// 기존 위젯 기초 화면을 탭으로 감싸는 래퍼
class WidgetsScreen extends StatelessWidget {
  const WidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WidgetBasicsScreen();
  }
}
