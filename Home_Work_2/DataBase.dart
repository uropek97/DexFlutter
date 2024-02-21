class User{
  String login = '';
  String _password = '';
  final DateTime creationDate;
  DateTime lastEnter;

  User.create(String login, String password) :
        this.login = login,
        this._password = password,
        this.creationDate = DateTime.now(),
        this.lastEnter = DateTime.parse('0000-01-01 00:00:00');
  
  void changeLogin(String login){
    this.login = login;
  }
  
  void changePassword(String oldPass,String newPass, String repeatNewPass){
    if(newPass != repeatNewPass){
      print('Вы должны дважды верно написать новый пароль');
      return;
    }
    if(oldPass != this._password){
      print('Неверно указан старый пароль');
      return;
    }
    this._password = newPass;
    print('Пароль успешно изменён');
  }

  @override
  String toString() {
    return 'Login: ${this.login}, Password: ${this._password.hashCode}, сreation time: ${this.creationDate} lastEnter: ${this.lastEnter}';
  }
}

class UserDataBase{
  Map<int, User> users = {
    0 : User.create('Login1', 'Pass1'),
    1 : User.create('Login2', 'Pass2'),
    2 : User.create('Login3', 'Pass3')
  };

  User? addUser(String login, String pass){
    if(!users.values.contains(login)){
      var newUser = User.create(login, pass);
      this.users[users.length] = newUser;
      return newUser;
    }
    return null;
  }

  List<User> getInfo(){
    List<User> users = [];
    for(var user in this.users.values)
      users.add(user);
    return users;
  }
}
