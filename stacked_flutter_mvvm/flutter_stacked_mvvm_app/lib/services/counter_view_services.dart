class Counterservice {
  var countValue = 0;

  addCounterValue() {
    countValue++;
    print(countValue);
  }

  getValue() {
    return countValue;
  }
}
