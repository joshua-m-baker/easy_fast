class EatingHistory {
  List<DateTime> history = [];

  newEntry(){
    history.add(DateTime.now());
  } 

  DateTime lastEntry(){
    return history.last;
  }

  int length(){
    return history.length;
  }

  DateTime atIndex(int index){
    return history[index];
  }
}