//Написать функцию, принимающую год (int), возвращающую bool.
//Результат функции должен отражать является ли год високосным.
bool task4(int year){
  if(year % 4 != 0){
    print('Год не високосный');
    return false;
  }
  else if(year % 100 != 0 ){
    print('Год високосный');
    return true;
  }
  else if(year % 400 != 0){
    print('Год не високосный');
    return false;
  }
  else{
    print('Год високосный');
    return true;
  }
}

void main(){
  task4(2100);
  task4(2000);
}
