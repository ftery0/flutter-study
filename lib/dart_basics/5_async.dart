// ============================================================
// Dart 기초 5: 비동기 (async / await)
// ============================================================

void main() async {
  // ----------------------------------------------------------
  // 1. 왜 비동기가 필요할까?
  // ----------------------------------------------------------
  print('===== 동기 vs 비동기 =====');

  print('1. 시작');
  await Future.delayed(Duration(seconds: 1));  // 1초 기다리기
  print('2. 1초 후');
  print('3. 끝');

  // ----------------------------------------------------------
  // 2. Future - 미래에 값이 생기는 것
  // ----------------------------------------------------------
  print('\n===== Future =====');

  // await 없이 쓰면 기다리지 않음
  Future<String> futureValue = fetchUserName();

  print('유저 이름 요청 중...');
  String name = await futureValue;  // 완료될 때까지 기다림
  print('유저 이름: $name');

  // ----------------------------------------------------------
  // 3. async 함수 직접 호출
  // ----------------------------------------------------------
  print('\n===== 서버에서 데이터 가져오기 =====');

  String data = await fetchData();
  print(data);

  // ----------------------------------------------------------
  // 4. 여러 비동기 작업 처리
  // ----------------------------------------------------------
  print('\n===== 여러 작업 순서대로 =====');

  // 순서대로 기다리기 (총 3초)
  String step1 = await task('1번 작업', 1);
  String step2 = await task('2번 작업', 1);
  String step3 = await task('3번 작업', 1);
  print('결과: $step1, $step2, $step3');

  // ----------------------------------------------------------
  // 5. 동시에 실행 - Future.wait (시간 절약!)
  // ----------------------------------------------------------
  print('\n===== 여러 작업 동시에 =====');

  // 동시에 실행 (총 1초만 걸림!)
  List<String> results = await Future.wait([
    task('A 작업', 1),
    task('B 작업', 1),
    task('C 작업', 1),
  ]);
  print('결과: $results');

  // ----------------------------------------------------------
  // 6. 에러 처리 - try / catch
  // ----------------------------------------------------------
  print('\n===== 에러 처리 =====');

  try {
    String result = await fetchWithError();
    print('성공: $result');
  } catch (e) {
    print('에러 발생: $e');
  }

  // ----------------------------------------------------------
  // 7. Flutter에서 자주 보이는 패턴
  // ----------------------------------------------------------
  print('\n===== Flutter 패턴 =====');

  // 로딩 → 데이터 가져오기 → 화면 업데이트
  print('로딩 중...');
  Map<String, dynamic> user = await fetchUserData();
  print('이름: ${user['name']}');
  print('이메일: ${user['email']}');
  print('화면 업데이트 완료!');
}

// ============================================================
// 비동기 함수 정의들
// ============================================================

// Future<String>: 나중에 String을 반환하겠다는 약속
Future<String> fetchUserName() async {
  await Future.delayed(Duration(milliseconds: 500));  // 서버 응답 시뮬레이션
  return '홍길동';
}

Future<String> fetchData() async {
  print('서버에 요청 중...');
  await Future.delayed(Duration(seconds: 1));  // 네트워크 대기 시뮬레이션
  return '서버에서 받아온 데이터입니다!';
}

Future<String> task(String name, int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
  print('$name 완료!');
  return name;
}

// 에러를 던지는 함수
Future<String> fetchWithError() async {
  await Future.delayed(Duration(milliseconds: 300));
  throw Exception('서버 연결 실패!');  // 에러 발생
}

// Map을 반환하는 비동기 함수 (API 응답과 유사한 구조)
Future<Map<String, dynamic>> fetchUserData() async {
  await Future.delayed(Duration(milliseconds: 700));
  return {
    'name': '홍길동',
    'email': 'hong@example.com',
    'age': 25,
  };
}
