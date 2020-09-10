void main() {

List<int> iterable = [1, 2, 3];

  //
  final data = Data();
  final myFriends = data.myFriends;
  // print(myFriends[0].name);

  final r = myFriends.where((e) {
    print(e.name);

    return e.originCountry.contains('Germany');
  }).forEach((e) {
    print(e.name);
    return e.originCountry.contains('Germany');
  });

  // print(r);
}

class Data {
  final myFriends = <Friend>[
    Friend('David', 'England'),
    Friend('Max', 'Germany'),
    Friend('Sara', 'USA'),
    Friend('Daniel', 'Germany'),
  ];
}

class Friend {
  final String name;
  final String originCountry;

  Friend(this.name, this.originCountry);
}
