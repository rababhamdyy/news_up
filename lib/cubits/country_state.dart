abstract class CountryState {}

class CountryInitial extends CountryState {
  final String selectedCountry;
  final bool isAllCountries;

  CountryInitial({this.selectedCountry = 'US', this.isAllCountries = true});
}

class CountrySelected extends CountryState {
  final String selectedCountry;
  final bool isAllCountries;

  CountrySelected({required this.selectedCountry, this.isAllCountries = false});
}

class AllCountriesSelected extends CountryState {
  AllCountriesSelected();
}
