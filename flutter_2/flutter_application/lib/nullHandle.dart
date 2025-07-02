void main() async {
  // String? name;
  // print(name??="win");
  // print(name);

  Employee emp = Employee();
  emp?.showData();
}

class Employee{
  void showData(){
    print("Show data");
  }
}