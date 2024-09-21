// Abstraction: Abstract class
abstract class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  // Abstract method
  void makeSound();

  // Common method
  void displayInfo() {
    print('Name: $name, Age: $age');
  }
}

// Inheritance: Dog class inherits from Animal
class Dog extends Animal {
  // Encapsulation: Private variable
  String _breed;

  // Constructor
  Dog(String name, int age, this._breed) : super(name, age);

  // Encapsulation: Getter method
  String get breed => _breed;

  // Encapsulation: Setter method
  set breed(String value) {
    if (value.isNotEmpty) {
      _breed = value;
    }
  }

  // Polymorphism: Implementing the abstract method
  @override
  void makeSound() {
    print('$name barks: Woof! Woof!');
  }

  // Polymorphism: Overriding the common method
  @override
  void displayInfo() {
    super.displayInfo();
    print('Breed: $_breed');
  }
}

// Inheritance: Cat class inherits from Animal
class Cat extends Animal {
  bool _isIndoor;

  Cat(String name, int age, this._isIndoor) : super(name, age);

  // Encapsulation: Getter method
  bool get isIndoor => _isIndoor;

  // Polymorphism: Implementing the abstract method
  @override
  void makeSound() {
    print('$name meows: Meow! Meow!');
  }

  // Additional method specific to Cat
  void scratch() {
    print('$name scratches the furniture');
  }
}

void main() {
  // Creating instances
  var dog = Dog('Buddy', 3, 'Golden Retriever');
  var cat = Cat('Whiskers', 2, true);

  // Using encapsulated methods
  dog.breed = 'Labrador'; // Using setter
  print(dog.breed); // Using getter

  // Demonstrating polymorphism
  List<Animal> animals = [dog, cat];

  for (var animal in animals) {
    animal.displayInfo(); // Polymorphic method call
    animal.makeSound(); // Polymorphic method call

    if (animal is Cat) {
      animal.scratch(); // Cat-specific method
    }

    print('---');
  }
}
