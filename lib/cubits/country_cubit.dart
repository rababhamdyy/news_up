import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_up/cubits/country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryInitial());

  void selectCountry(String countryCode) {
    emit(CountrySelected(selectedCountry: countryCode));
  }

  void selectAllCountries() {
    emit(AllCountriesSelected());
  }

  String get currentCountry {
    if (state is CountrySelected) {
      return (state as CountrySelected).selectedCountry;
    }
    return 'US';
  }

  bool get isAllCountries {
    return state is AllCountriesSelected || 
           (state is CountryInitial && (state as CountryInitial).isAllCountries);
  }
}
