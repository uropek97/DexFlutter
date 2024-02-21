import 'UserInterface.dart';
import 'Authorization.dart';
import 'WorkWithDB.dart';
import 'Document.dart';

abstract class _Logger{
  void _writeLog(String message, _Type type);
}


class FacadeApp implements _Logger{
  UserDataBase userDataBase;
  Document document;
  UserInterface userInterface;

  FacadeApp() :
      this.userDataBase = UserDataBase(),
      this.document = DocumentFactory(),
      this.userInterface = ConsoleUserInterface(){
    _work();
  }

  void _writeLog(String message, _Type type){
    print('** ${type.name} : $message **');
  }

  void _work(){
    userInterface.write('Логин: ', false);
    String login = userInterface.read() ?? 'guest';
    userInterface.write('Пароль: ', false);
    String pass = userInterface.read() ?? 'guest';

    while(true){
      var info = Authorization.logIn(login, pass);
      userInterface.write(info.$2, true);
      if(info.$1){
        _writeLog(info.$2, _Type.Info);
        break;
      }
      else
        _writeLog(info.$2, _Type.Warning);
    }



    var input = -1;
    while(input != 0){
      input = userInterface.chooseAction();
      if(input == 1 )
        printInfo();
      else if(input == 2)
        addUser();
      else if(input == 3){
        userInterface.write('Имя и/или путь к файлу: ', false);
        var path = userInterface.read() ?? 'exaple.txt';
        document.save(path, _getInfo().toString());
        _writeLog('Запись в файл $path', _Type.Info);
      }
      else if(input == 4)
        userInterface.write('что-то четвёртое', true);
      else if(input == 0){
        Authorization.logOut();
        _writeLog('Выход из приложения', _Type.Info);
      }
      else
        userInterface.write('Неизвестная команда',true);
    }
  }

  bool addUser(){
    userInterface.write('Добавление нового пользователя:', true);
    userInterface.write('Логин: ', false);
    var login = userInterface.read() ?? 'unknown';
    userInterface.write('Пароль: ', false);
    var pass = userInterface.read() ?? 'unknown';
    var user = userDataBase.addUser(login, pass);

    if(user != null){
      _writeLog('added user $user', _Type.Info);
      return true;
    }
    else{
      _writeLog('user was null', _Type.Warning);
      return true;
    }
  }
    List<String> _getInfo(){
    var a = userDataBase.getInfo();
    List<String> info = a.map((user) => user.toString()).toList();
    return info;
  }

  void printInfo(){
    var users = _getInfo();
    for(var user in users)
      userInterface.write(user, true);
  }

}
enum _Type{
  Info,
  Warning,
  ERROR
}
