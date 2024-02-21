class Authorization{
  String login = '';
  String _password = '';
  static bool _ifLogged = false;


  Authorization._(String login, String password) :
        this.login = login,
        this._password = password;

  //что-то делает
  static bool _ifCanLogIn(String login, password){
    return true;
  }

  static (bool, String) logIn(String login, String password){
    if(!_ifLogged){
      Authorization._(login, password);
      _ifLogged = true;
      return (true,'Вход выполнен');
    }
    else{
      return (false, 'Вход запрещён. Приложение используется');
    }
  }

  static String logOut(){
    _ifLogged = false;
    return 'Выход из приложения';
  }

}
