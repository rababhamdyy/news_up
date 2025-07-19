import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flag/flag.dart';
import 'package:news_up/cubits/country_cubit.dart';
import 'package:news_up/cubits/country_state.dart';
import 'package:news_up/cubits/news_cubit.dart';
import 'package:news_up/views/home_view.dart';

class CountryView extends StatefulWidget {
  const CountryView({super.key});

  @override
  State<CountryView> createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
  final TextEditingController _searchController = TextEditingController();
  List<MapEntry<String, String>> _filteredCountries = [];
  String? _selectedCountry;

  final Map<String, String> countries = {
    'AE': 'United Arab Emirates',
    'AR': 'Argentina',
    'AT': 'Austria',
    'AU': 'Australia',
    'BE': 'Belgium',
    'BG': 'Bulgaria',
    'BR': 'Brazil',
    'CA': 'Canada',
    'CH': 'Switzerland',
    'CN': 'China',
    'CO': 'Colombia',
    'CU': 'Cuba',
    'CZ': 'Czech Republic',
    'DE': 'Germany',
    'EG': 'Egypt',
    'FR': 'France',
    'GB': 'United Kingdom',
    'GR': 'Greece',
    'HK': 'Hong Kong',
    'HU': 'Hungary',
    'ID': 'Indonesia',
    'IE': 'Ireland',
    'IL': 'Israel',
    'IN': 'India',
    'IT': 'Italy',
    'JP': 'Japan',
    'KR': 'South Korea',
    'LT': 'Lithuania',
    'LV': 'Latvia',
    'MA': 'Morocco',
    'MX': 'Mexico',
    'MY': 'Malaysia',
    'NG': 'Nigeria',
    'NL': 'Netherlands',
    'NO': 'Norway',
    'NZ': 'New Zealand',
    'PH': 'Philippines',
    'PL': 'Poland',
    'PT': 'Portugal',
    'RO': 'Romania',
    'RS': 'Serbia',
    'RU': 'Russia',
    'SA': 'Saudi Arabia',
    'SE': 'Sweden',
    'SG': 'Singapore',
    'SI': 'Slovenia',
    'SK': 'Slovakia',
    'TH': 'Thailand',
    'TR': 'Turkey',
    'TW': 'Taiwan',
    'UA': 'Ukraine',
    'US': 'United States',
    'VE': 'Venezuela',
    'ZA': 'South Africa',
  };

  @override
  void initState() {
    super.initState();
    _filteredCountries = countries.entries.toList();
    _searchController.addListener(_filterCountries);
    // Initialize with current country from cubit
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final countryCubit = context.read<CountryCubit>();
      setState(() {
        _selectedCountry = countryCubit.isAllCountries ? 'ALL' : countryCubit.currentCountry;
      });
    });
  }

  void _filterCountries() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredCountries = countries.entries.toList();
      } else {
        _filteredCountries =
            countries.entries
                .where((entry) => entry.value.toLowerCase().contains(query))
                .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CountryCubit, CountryState>(
      listener: (context, state) {
        if (state is CountrySelected) {
          // Reload news with new country when country changes
          context.read<NewsCubit>().loadNews(country: state.selectedCountry);
        } else if (state is AllCountriesSelected) {
          // Reload news for all countries
          context.read<NewsCubit>().loadNews(country: null);
        }
      },
      child: Scaffold(
        body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Select Country',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search country',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredCountries.length + 1, // +1 for "All Countries"
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // "All Countries" option
                    return ListTile(
                      leading: const Icon(Icons.public, size: 30),
                      title: const Text('All Countries'),
                      trailing: _selectedCountry == 'ALL'
                          ? const Icon(Icons.check, color: Colors.green)
                          : null,
                      onTap: () {
                        setState(() {
                          _selectedCountry = 'ALL';
                        });
                        context.read<CountryCubit>().selectAllCountries();
                      },
                    );
                  }
                  
                  final countryIndex = index - 1;
                  final countryCode = _filteredCountries[countryIndex].key;
                  final countryName = _filteredCountries[countryIndex].value;
                  return ListTile(
                    leading: _getCountryFlag(countryCode),
                    title: Text(countryName),
                    trailing: _selectedCountry == countryCode
                        ? const Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () {
                      setState(() {
                        _selectedCountry = countryCode;
                      });
                      context.read<CountryCubit>().selectCountry(countryCode);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: _selectedCountry != null
                    ? () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeView()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Continue to News'),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }

  Widget _getCountryFlag(String countryCode) {
    return Flag.fromString(
      countryCode,
      height: 20,
      width: 30,
      replacement: const Icon(Icons.flag),
    );
  }
}
