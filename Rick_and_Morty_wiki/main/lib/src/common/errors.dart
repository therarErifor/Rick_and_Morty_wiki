class Both<Tdata> {
  final Tdata? data;
  final Object? error;

  Both(this.data, this.error);

  factory Both.fromError(Object error) => Both(null, error);

  factory Both.fromData(Tdata data) => Both(data, null);

  bool get isSuccessTheBoth {
    return error == null;
  }
}
