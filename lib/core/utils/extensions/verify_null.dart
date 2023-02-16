
extension VerifyNull on dynamic {
  T? notNull<T>() {
    if (this != null) {
      return this;
    }
    return null;
  }
}