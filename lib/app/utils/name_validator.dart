
bool isValidName(String text) {
  return RegExp(r"^[a-zA-ZñÑ]+( [a-zA-ZñÑ]+)*$").hasMatch(text);
}