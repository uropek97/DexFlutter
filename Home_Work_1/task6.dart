//Написать функцию, которая принимает список чисел и возвращает список,
//содержащий только четные числа из исходного списка.
List<int> task6(List<int> array){
  List<int> evenNumbers = [];
  for(int i = 0; i < array.length; i++){
    if(array[i].isEven)
      evenNumbers.add(array[i]);
  }
  return evenNumbers;
}

void main(){
  print(task6([10, 5, 20, 33, 30, 128, 129]));
}
