void main() async {
  //login
  print(await loginUser());
  print("working");
}

Future<String> loginUser() async {
  //fetchdata
  var user = await getUserFromDatabase();
  return user;
}

Future <String> getUserFromDatabase () {
  return Future.delayed(Duration(seconds: 5),() => "witthawin");
}