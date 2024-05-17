
bool isValidName(String text) {
  return RegExp(r"^[a-zA-ZñÑ]+( [a-zA-ZñÑ]+)*$").hasMatch(text);
}

bool isValidNameResult(String text) {
  return RegExp(r"^[a-zA-ZñÑ0-9]+([ -]?[a-zA-ZñÑ0-9]+)*$").hasMatch(text);
}