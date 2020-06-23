class CardDataType {
  String location;

  int confirmed;
  int recovered;
  int deceased;

  int newConfirmed;
  int newRecovered;
  int newDeaths;

  int activeRate;
  int recoveryRate;
  int deathRate;

  int activeCases;

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
}
