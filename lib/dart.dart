import 'dart:io';

void main() {
  // for (int i = 2; i <= 10; i++) {
  //   print(i);
  // }
  List<String> languages = [
    'Dart', // 0
    'Kotlin', // 1
    'Java', // 2
    'Swift', // 3
    'Objective-C', // 4
    'Python', // 5
    'JavaScript', // 6
    'TypeScript', // 7
    'C#', // 8
    'C++', // 9
  ];

  // for (int i = 0; i < languages.length; i++) {
  //   print(languages[i]);
  // }

  for (String element in languages) {
    if (element.toUpperCase() == 'swift'.toUpperCase()) {
      // languages.remove(element);
      continue;
    }
    print(element);
  }

  for (var element in languages) {
    print(element);
  }

  String password = 'admin';

  print('Enter Your Password');
  String enterPassword = '';

  do {
    enterPassword = stdin.readLineSync()!;
  }while(enterPassword != password);

  //
  int counter = 1;
  while(enterPassword != password && counter < 3){
    print('Please, Try Again !!!');
    enterPassword = stdin.readLineSync()!;
    counter++;
  }
  // print('Welcome Back After $counter Times');
  print(kareem());
  int x = sumTwoNumber(10, 76);
  print(x);
}

int kareem () {
  print('Say My Name');
  return 123987987;
}
int sumTwoNumber (int first, int second) {
  return first + second;
}

// Parameters vs Arguments.
// Optional Parameters Types.

// KareEM == Kareem
// kareem == kareem
