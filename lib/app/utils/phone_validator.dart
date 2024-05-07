

bool isValidPhone(String text) {
  return RegExp(r"^[0-9]+$").hasMatch(text);
}