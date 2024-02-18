//Написать функцию, которая принимает строку и возвращает строку
//со словами в обратном порядке.
String task5(String data){
  return data.split(' ').reversed.join(' ');
}

void main(){
  print(task5('Amicus Plato, sed magis amica veritas'));
}
