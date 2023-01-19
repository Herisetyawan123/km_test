bool checkPalindrome(text) {
  if (text.split('').reversed.join('') == text) {
    return true;
  }
  return false;
}
