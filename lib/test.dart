import 'dart:io';
import 'dart:math';

void main() {
  People kareem = People(
    name: 'kareem',
    age: 25,
  );
  kareem.printData();
  Teacher ahmed = Teacher();
  ahmed.printData();
  print(People.counter);
  
  // Kareem kareem2 = Kareem(); 
}

class People {
  String? name;
  int? age;
  String? id;
  String? gender;
  static int counter = 0;

  People({
    this.name,
    this.gender,
    this.id,
    this.age,
  }){
    counter++;
  }
  void printData() {
    print('Your Name $name, your age $age, id is $id, and your gender is $gender');
  }
}

class Teacher extends People {
  String? schoolName;
  String? position;
  double? salary;

  Teacher({
    this.schoolName,
    this.position,
    this.salary,
    super.age,
    super.gender,
    super.id,
    super.name,
  });


  @override
  void printData() {
    super.printData();
    print('Polymorphism');
  }
}
 abstract class Kareem {
  int counter = 0;
  
  void contract();
  void printDate(){}
  void sayMyName();
}

class Ahmed extends Kareem {
  @override
  void contract() {}

  void sayMyNjame() {}

  @override
  void sayMyName() {
    // TODO: implement sayMyName
  }
}







abstract class Bird extends Animal {
  void canFly();
}

abstract class Animal {
  void sound();
  void sound2(){}
}


class Cat extends Animal {
  @override
  void sound() => print('Meaw Meaw');
}

class Dog extends Animal {
  @override
  void sound() {
    print('How How');
  }

  @override
  void canFly() {
    // TODO: implement canFly
  }
}

class Duck extends Animal{
  @override
  void sound() {
    print('Quack Quack');
  }

  @override
  void canFly() {
    // TODO: implement canFly
  }
  
}






