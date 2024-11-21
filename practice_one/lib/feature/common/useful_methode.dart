validator(String? value, String msg) {
  if (value == null || value.isEmpty) {
    return msg;
  }
  return null;
}
