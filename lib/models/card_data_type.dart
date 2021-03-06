class CardDataType {
  String location;

  String confirmed;
  String recovered;
  String deceased;

  String newConfirmed;
  String newRecovered;
  String newDeaths;

  String activeRate;
  String recoveryRate;
  String deathRate;

  String activeCases;

  CardDataType(
      {this.location,
      this.confirmed,
      this.recovered,
      this.deceased,
      this.newConfirmed,
      this.newRecovered,
      this.newDeaths,
      this.activeRate,
      this.recoveryRate,
      this.deathRate,
      this.activeCases});

  void printAllData() {
    print(this.location +
        ' ' +
        this.newConfirmed +
        ' ' +
        this.newRecovered +
        ' ' +
        this.newDeaths +
        ' ' +
        this.confirmed +
        ' ' +
        this.recovered +
        ' ' +
        this.deceased +
        ' ' +
        this.activeCases +
        ' ' +
        this.activeRate +
        ' ' +
        this.deathRate +
        ' ' +
        this.recoveryRate +
        ' ' +
        this.newConfirmed);
  }
}
