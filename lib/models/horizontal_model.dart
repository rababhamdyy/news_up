class HorizontalModel {
  final String title;
  final String image;
  const HorizontalModel({required this.title, required this.image});
}

final List<HorizontalModel> imageCards = [
  const HorizontalModel(title: 'General', image: 'assets/general.avif'),
  const HorizontalModel(title: 'Technology', image: 'assets/technology.jpeg'),
  const HorizontalModel(title: 'Business', image: 'assets/business.jpeg'),
  const HorizontalModel(title: 'Science', image: 'assets/science.avif'),
  const HorizontalModel(title: 'Health', image: 'assets/health.avif'),
  const HorizontalModel(title: 'Sports', image: 'assets/sports.avif'),
];
