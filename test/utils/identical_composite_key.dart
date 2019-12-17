class IdenticalCompositeKey {
  final Object _obj;

  IdenticalCompositeKey(this._obj);

  @override
  bool operator ==(Object other) {
    if (other is IdenticalCompositeKey) {
      return identical(_obj, other._obj);
    }

    return false;
  }

  @override
  int get hashCode => _obj.hashCode;
}
