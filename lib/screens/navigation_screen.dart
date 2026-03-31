import 'package:flutter/material.dart';

// 화면 이동(Navigation) 공부 화면

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('화면 이동'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Navigator로 화면 이동하기',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Navigator.push()로 새 화면을 쌓고,\nNavigator.pop()으로 돌아옵니다.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // push 이동 버튼
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DetailScreen()),
                );
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('상세 화면으로 이동 (push)'),
            ),
          ],
        ),
      ),
    );
  }
}

// 상세 화면 (push로 이동되는 화면)
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상세 화면'),
        // 자동으로 뒤로가기 버튼이 생김
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.info, size: 80, color: Colors.blue),
            const SizedBox(height: 16),
            const Text(
              '상세 화면입니다!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('AppBar의 ← 버튼 또는 아래 버튼으로 돌아가세요'),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context); // 이전 화면으로 돌아가기
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('돌아가기 (pop)'),
            ),
          ],
        ),
      ),
    );
  }
}
