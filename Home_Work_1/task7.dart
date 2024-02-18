//Написать функцию, которая выводит на консоль все степени двойки
//от 2 до 64 включительно, чтобы получился следующий вывод:
void task7([int number = 2, int degree = 6]){
  int secNumb = number;
  print(number);
  for(int i = 1; i < degree; i++){
   number *= secNumb;
   print(number);
 }
}

void main(){
  task7();
}
