class Car {
  final String name;
  final int numberOfDoors;

  Car(this.name, [this.numberOfDoors = 4]);

  @override
  bool operator ==(Object other) =>
      other is Car && runtimeType == other.runtimeType && name == other.name && numberOfDoors == other.numberOfDoors;

  @override
  int get hashCode => name.hashCode + numberOfDoors;
}
