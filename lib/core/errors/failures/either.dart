abstract class Either<L, R> {
  Either._();
  factory Either.left(L l) = Left<L, R>;
  factory Either.right(R e) = Right<L, R>;

  dynamic fold({required Function(L) left, required Function(R) right}) {
    if (this is Left) {
      return left((this as Left).value);
    } else {
      return right((this as Right).value);
    }
  }
}

class Left<L, R> extends Either<L, R> {
  final L value;
  Left(this.value) : super._();
}

class Right<L, R> extends Either<L, R> {
  final R value;
  Right(this.value) : super._();
}
