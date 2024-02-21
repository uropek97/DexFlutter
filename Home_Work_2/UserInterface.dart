import 'dart:io';

abstract class UserInterface{
  void write(String message, bool ifNewWin);
  String? read();
  int chooseAction();
}

class ConsoleUserInterface implements UserInterface{
  void write(String message, bool ifNewLine){
    if(ifNewLine)
      print(message);
    else
      stdout.write(message);
  }

  String? read(){
    return stdin.readLineSync();
  }

  int chooseAction(){
    write('0 - Выход', true);
    write('1 - Вывести список пользователей', true);
    write('2 - Добавить пользователя', true);
    write('3 - Запись в файл', true);
    write('4 - Что-то пятое', true);
    write('Выберите действие: ', false);

    return int.tryParse(read() ?? '-1') ?? -1;
  }
}
