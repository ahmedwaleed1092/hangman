import 'dart:io';

void main() {
  final game = Hangman(word: 'dart', maxWrongGuesses: 7);
  game.start();

  Room room1 = Room(101, 'Single', 100.0, true);
  Room room2 = Room(102, 'Double', 150.0, true);

}

class Hangman {
  String word;
  int maxWrongGuesses;
  late List<String> _displayWord;
  Set<String> _guessedLetters = {};
  int _wrongGuesses = 0;


  Hangman({required this.word, required this.maxWrongGuesses}) {
    _displayWord = List<String>.filled(word.length, '_');
  }

  void start() {
    print('Welcome to Hangman!');
    print('You have $maxWrongGuesses wrong guesses allowed.');

    while (_wrongGuesses < maxWrongGuesses && _displayWord.contains('_')) {
      _showGameStatus();
      final guess = _getPlayerInput();
      if (_guessedLetters.contains(guess)) {
        print('You already guessed "$guess". Try again.');
        continue;
      }
      
      _guessedLetters.add(guess);
      if (word.contains(guess)) {
        print('Good job! "$guess" is correct!');
        _revealLetter(guess);
      } else {
        print('Oops! "$guess" is wrong!');
        _wrongGuesses++;
      }
    }

    _showGameResult();
  }

  void _showGameStatus() {
    print('Word: ${_displayWord.join(' ')}');
    print('Wrong guesses: $_wrongGuesses/$maxWrongGuesses');
    print('Guessed letters: ${_guessedLetters.join(', ')}');
  }

  String _getPlayerInput() {
    stdout.write('Guess a letter: ');
    final input = stdin.readLineSync()?.toUpperCase();

    if (input == null || input.isEmpty || input.length != 1) {
      print('Please enter a single valid letter.\n');
      return _getPlayerInput();
    }

    return input;
  }

  void _revealLetter(String guess) {
    for (int i = 0; i < word.length; i++) {
      if (word[i].toUpperCase() == guess) {
        _displayWord[i] = guess;
      }
    }
  }

  void _showGameResult() {
    if (!_displayWord.contains('_')) {
      print('\nCongratulations! You guessed the word: $word');
    } else {
      print('\nGame Over! The word was: $word');
    }
  }
}
class hotel {
  int sngRoom =50;
  int dbRoom =50;

String ? name ;
information <dynamic> info_host ;
 late String kind_room ; 
int ? numberOfDays  ;

hotel({this.info_host,this.name,this.numberOfDays})

void book_room () {
  print (  ${sngRoom} available single room /n );
  print (  ${dbRoom} available single room /n );


}


void choose_kind_room (num_family )
{
  if (num_family <2 )
  {
    kind_room= 'single '
  }
  else
  {
 kind_room= 'double '
  }
}
}
class information {

  String ? email ;
  int ? phoneNum ; 
  int ?age ;
  int numOf_days =1; //booking room should be 1 day at least 
  information({this.age,this.email,this.phoneNum , this.num_family})

  void upDateInfo ({required  String email , required  int phone , required int age  })
  {
    this.email = email;
    this.phoneNum = phone;
    this.age = age;
  }



}
class Room {
  int roomNumber;
  String type;
  double price;
  bool isAvailable;

  Room(this.roomNumber, this.type, this.price, this.isAvailable);

  void changeStatus(bool status) {
    isAvailable = status;
    print('Room $roomNumber status updated to: ${isAvailable? 'Available' : 'Occupied'}');
  }

}
class Employee {
  String name;
  String position;
  double salary;

  Employee(this.name, this.position, this.salary);

  void displayInfo() {
    print('Employee Name: $name, Position: $position, Salary: $salary');
  }
}
class Manager {
  String name;
  List<Employee> employees = [];

  Manager(this.name);

  void addEmployee(Employee employee) {
    employees.add(employee);
    print('Employee ${employee.name} added by Manager $name.');
  }

  void displayEmployees() {
    print('Employees under Manager $name:');
    for (var employee in employees) {
      employee.displayInfo();
    }
  }
}


