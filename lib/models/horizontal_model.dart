class HorizontalModel {
  final String title;
  final String image;
  const HorizontalModel({required this.title, required this.image});
}

final List<HorizontalModel> imageCards = [
  const HorizontalModel(title: 'business', image: 'assets/business.avif'),
  const HorizontalModel(title: 'technology', image: 'assets/technology.jpeg'),
  const HorizontalModel(title: 'science', image: 'assets/science.avif'),
  const HorizontalModel(
      title: 'entertaiment', image: 'assets/entertaiment.avif'),
  const HorizontalModel(title: 'general', image: 'assets/general.avif'),
  const HorizontalModel(title: 'health', image: 'assets/health.avif'),
  const HorizontalModel(title: 'sports', image: 'assets/sports.avif'),
];
