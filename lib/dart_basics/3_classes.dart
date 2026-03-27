// ============================================================
// Dart 기초 3: 클래스
// ============================================================

void main() {
  // ----------------------------------------------------------
  // 1. 클래스 인스턴스 만들기
  // ----------------------------------------------------------

  Person person1 = Person(name: '홍길동', age: 25);
  Person person2 = Person(name: '김철수', age: 30);

  person1.introduce();
  person2.introduce();

  // 필드에 직접 접근
  print('\n이름: ${person1.name}');
  print('나이: ${person1.age}');

  // 메서드 호출
  person1.birthday();
  print('생일 후 나이: ${person1.age}');

  // ----------------------------------------------------------
  // 2. getter / setter
  // ----------------------------------------------------------

  print('\n--- getter / setter ---');
  BankAccount account = BankAccount(owner: '홍길동', balance: 10000);
  print('잔액: ${account.balance}원');

  account.deposit(5000);
  account.withdraw(3000);
  print('최종 잔액: ${account.balance}원');

  // ----------------------------------------------------------
  // 3. 상속 - 부모 클래스를 확장
  // ----------------------------------------------------------

  print('\n--- 상속 ---');
  Student student = Student(name: '이영희', age: 20, school: '서울대');
  student.introduce();   // 오버라이드된 메서드
  student.study();       // Student만의 메서드

  // ----------------------------------------------------------
  // 4. 추상 클래스 - 직접 인스턴스 만들 수 없는 설계도
  // ----------------------------------------------------------

  print('\n--- 추상 클래스 ---');
  Animal dog = Dog(name: '멍멍이');
  Animal cat = Cat(name: '야옹이');

  dog.sound();
  cat.sound();
  dog.breathe();  // 부모에서 공통으로 정의
  cat.breathe();
}

// ============================================================
// 클래스 정의들
// ============================================================

// ----------------------------------------------------------
// 1. 기본 클래스
// ----------------------------------------------------------
class Person {
  // 필드 (멤버 변수)
  String name;
  int age;

  // 생성자
  Person({required this.name, required this.age});

  // 메서드
  void introduce() {
    print('안녕하세요! 저는 $name이고 $age살입니다.');
  }

  void birthday() {
    age++;  // 나이 1 증가
    print('$name 생일 축하해요! 이제 $age살이에요.');
  }
}

// ----------------------------------------------------------
// 2. getter / setter가 있는 클래스
// ----------------------------------------------------------
class BankAccount {
  String owner;
  int _balance;  // _ 로 시작하면 외부에서 직접 접근 불가 (private)

  BankAccount({required this.owner, required int balance})
      : _balance = balance;

  // getter: 값을 읽을 때
  int get balance => _balance;

  // 입금
  void deposit(int amount) {
    _balance += amount;
    print('$amount원 입금 → 잔액: $_balance원');
  }

  // 출금
  void withdraw(int amount) {
    if (amount > _balance) {
      print('잔액 부족!');
      return;
    }
    _balance -= amount;
    print('$amount원 출금 → 잔액: $_balance원');
  }
}

// ----------------------------------------------------------
// 3. 상속
// ----------------------------------------------------------
class Student extends Person {
  String school;

  Student({required super.name, required super.age, required this.school});

  // 부모 메서드를 덮어씌움 (오버라이드)
  @override
  void introduce() {
    print('안녕하세요! 저는 $school에 다니는 $name이고 $age살입니다.');
  }

  // Student만의 메서드
  void study() {
    print('$name이 공부하고 있어요.');
  }
}

// ----------------------------------------------------------
// 4. 추상 클래스 - 공통 설계도 역할
// ----------------------------------------------------------
abstract class Animal {
  String name;

  Animal({required this.name});

  // 추상 메서드: 자식 클래스에서 반드시 구현해야 함
  void sound();

  // 일반 메서드: 모든 자식이 공통으로 씀
  void breathe() {
    print('$name이 숨을 쉬어요.');
  }
}

class Dog extends Animal {
  Dog({required super.name});

  @override
  void sound() {
    print('$name: 왈왈!');
  }
}

class Cat extends Animal {
  Cat({required super.name});

  @override
  void sound() {
    print('$name: 야옹~');
  }
}
