import 'package:flutter/material.dart';

// ============================================================
// Flutter 위젯 기초
// ============================================================

class WidgetBasicsScreen extends StatelessWidget {
  const WidgetBasicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(------
      // AppBar단 타이틀 바------
      appBar: AppB
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('위젯 기초'),
      ),
----      // body: 화면의 본문 영역------
      body: SingleChildScrolew(  // 스크롤 가능하게
        padding: const EdgeInsets.all(16),  // 사방에 16px 여백
        child: Column(  // 세로로 쌓기
          crossAxisAlignment: CrossAxisAlignment.start,  // 왼쪽 정렬
          children: [

            // 1. Text - 글자 표시
            const SectionTitle('1. Text 위젯'),

            const Text('기본 텍스트'),

            const Text(
              '스타일 있는 텍스트',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const Text(
              '색깔 텍스트',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),

            const SizedBox(height: 24),  // 세로 간격

            // 2. Container - 박스, 여백, 색상
            const SectionTitle('2. Container 위젯'),

            Container(
              width: 200,
              height: 80,
              color: Colors.blue[100],
              child: const Center(child: Text('기본 Container')),
            ),

            const SizedBox(height: 8),

            Container(
              width: double.infinity,  // 가로 꽉 채우기
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(12),  // 둥근 모서리
                border: Border.all(color: Colors.green),  // 테두리
              ),
              child: const Text('꾸민 Container (둥근 모서리 + 테두리)'),
            ),

            const SizedBox(height: 24),

            // 3. Row - 가로로 나열
            const SectionTitle('3. Row 위젯 (가로 나열)'),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,  // 균등 배치
              children: [
                Container(width: 60, height: 60, color: Colors.red[200],
                    child: const Center(child: Text('A'))),
                Container(width: 60, height: 60, color: Colors.blue[200],
                    child: const Center(child: Text('B'))),
                Container(width: 60, height: 60, color: Colors.green[200],
                    child: const Center(child: Text('C'))),
              ],
            ),

            const SizedBox(height: 24),

            // 4. Column - 세로로 나열
            const SectionTitle('4. Column 위젯 (세로 나열)'),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: double.infinity, height: 40,
                    color: Colors.orange[200],
                    child: const Center(child: Text('첫 번째'))),
                const SizedBox(height: 4),
                Container(width: double.infinity, height: 40,
                    color: Colors.orange[300],
                    child: const Center(child: Text('두 번째'))),
                const SizedBox(height: 4),
                Container(width: double.infinity, height: 40,
                    color: Colors.orange[400],
                    child: const Center(child: Text('세 번째'))),
              ],
            ),

            const SizedBox(height: 24),

            // 5. Image & Icon
            const SectionTitle('5. Icon 위젯'),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.home, size: 40, color: Colors.blue),
                Icon(Icons.search, size: 40, color: Colors.red),
                Icon(Icons.favorite, size: 40, color: Colors.pink),
                Icon(Icons.settings, size: 40, color: Colors.grey),
              ],
            ),

            const SizedBox(height: 24),

            // 6. Button 종류들
            const SectionTitle('6. Button 위젯들'),

            ElevatedButton(
              onPressed: () {},
              child: const Text('ElevatedButton (튀어나온 버튼)'),
            ),

            const SizedBox(height: 8),

            OutlinedButton(
              onPressed: () {},
              child: const Text('OutlinedButton (외곽선 버튼)'),
            ),

            const SizedBox(height: 8),

            TextButton(
              onPressed: () {},
              child: const Text('TextButton (텍스트 버튼)'),
            ),

            const SizedBox(height: 8),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.thumb_up),
              label: const Text('아이콘 버튼'),
            ),

            const SizedBox(height: 24),

            // 7. Card - 그림자 있는 카드
            const SectionTitle('7. Card 위젯'),

            Card(
              elevation: 4,  // 그림자 높이
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.person, size: 48, color: Colors.deepPurple),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('홍길동',
                            style: TextStyle(fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text('Flutter 개발자',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// 섹션 제목용 재사용 위젯
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
