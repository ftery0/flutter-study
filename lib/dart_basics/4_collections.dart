// ============================================================
// Dart 기초 4: 컬렉션 (List, Map, Set)
// ============================================================

void main() {
  // ----------------------------------------------------------
  // 1. List - 순서 있는 목록
  // ----------------------------------------------------------
  print('===== List =====');

  List<String> fruits = ['사과', '바나나', '오렌지'];

  print(fruits);           // 전체 출력
  print(fruits[0]);        // 인덱스로 접근 (0부터 시작)
  print('길이: ${fruits.length}');

  // 추가 / 삭제
  fruits.add('포도');
  print('추가 후: $fruits');

  fruits.remove('바나나');
  print('삭제 후: $fruits');

  // 반복
  for (String fruit in fruits) {
    print('  - $fruit');
  }

  // 유용한 메서드들
  List<int> numbers = [5, 3, 8, 1, 9, 2];
  print('\n원본: $numbers');

  numbers.sort();
  print('정렬: $numbers');

  print('포함 여부: ${numbers.contains(8)}');
  print('첫번째: ${numbers.first}');
  print('마지막: ${numbers.last}');

  // ----------------------------------------------------------
  // 2. Map - 키-값 쌍의 데이터
  // ----------------------------------------------------------
  print('\n===== Map =====');

  Map<String, dynamic> person = {
    'name': '홍길동',
    'age': 25,
    'city': '서울',
  };

  print(person);
  print('이름: ${person['name']}');
  print('나이: ${person['age']}');

  // 추가 / 수정
  person['job'] = '개발자';      // 새 키 추가
  person['age'] = 26;            // 기존 값 수정
  print('수정 후: $person');

  // 키/값 목록
  print('키 목록: ${person.keys.toList()}');
  print('값 목록: ${person.values.toList()}');

  // 반복
  person.forEach((key, value) {
    print('  $key: $value');
  });

  // ----------------------------------------------------------
  // 3. Set - 중복 없는 목록
  // ----------------------------------------------------------
  print('\n===== Set =====');

  Set<String> tags = {'flutter', 'dart', 'mobile'};
  tags.add('flutter');  // 이미 있으면 추가 안 됨
  tags.add('web');

  print('태그: $tags');
  print('포함 여부: ${tags.contains('dart')}');

  // ----------------------------------------------------------
  // 4. 자주 쓰는 List 변환 메서드
  // ----------------------------------------------------------
  print('\n===== List 변환 =====');

  List<int> nums = [1, 2, 3, 4, 5];

  // map: 각 요소를 변환
  List<int> doubled = nums.map((n) => n * 2).toList();
  print('2배: $doubled');

  // where: 조건에 맞는 것만 필터
  List<int> evens = nums.where((n) => n % 2 == 0).toList();
  print('짝수만: $evens');

  // reduce: 전체를 하나의 값으로
  int sum = nums.reduce((acc, n) => acc + n);
  print('합계: $sum');

  // ----------------------------------------------------------
  // 5. Flutter에서 자주 보이는 패턴
  // ----------------------------------------------------------
  print('\n===== Flutter 패턴 =====');

  List<String> menuItems = ['홈', '검색', '즐겨찾기', '설정'];

  // 리스트를 위젯 목록으로 바꿀 때 이런 식으로 써요
  List<String> menuWidgets = menuItems
      .map((item) => '[$item 버튼]')  // 실제로는 Widget을 반환
      .toList();

  print('메뉴 위젯들: $menuWidgets');
}
