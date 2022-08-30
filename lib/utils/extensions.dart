extension Extension on String? {
  bool isNullOrEmpty() => this == null || this?.isEmpty == true;

  bool isNullOrEqual(String value) =>
      this == null || value.toLowerCase() == this!.toLowerCase();
}
