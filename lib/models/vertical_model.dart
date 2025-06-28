class VerticalModel {
  final String image;
  final String title;
  final String subTitle;
  const VerticalModel(
      {required this.image, required this.title, required this.subTitle});
}

List<VerticalModel> newsCards = [
  const VerticalModel(
      image: 'assets/news_one.jpg',
      title:
          'شركة ناشئة تبتكر حلولاً للتنبؤ بالعواصف الشمسية وتأثيراتها على الشمس',
      subTitle:
          'أعلنت شركة (Ensemble Space Labs) التي انفصلت عن شركة حكومية متخصصة في الخدمات الرقمية، عن تطوير أدوات تنبؤية متقدمة لرصد العواصف الشمسية وتأثيراتها على الأرض'),
  const VerticalModel(
      image: 'assets/news_three.jpg',
      title: '«الأوقاف» : افتتاح 18 مسجدًا الجمعة المقبلة',
      subTitle:
          'تفتتح وزارة الأوقاف الجمعة القادمة 23 أغسطس 18 مسجدًا، في إطار خطتها لإعمار بيوت الله "عز وجل" مبنى ومعنى، منها 15 مسجدًا جديدًا أو إحلالًا وتجديدًا، و 3 مساجد صيانة وتطويرًا'),
  const VerticalModel(
      image: 'assets/news_two.jpg',
      title: 'النباتية وصحة الجسم .. فوائد متعددة ومخاطر نقص العناصر الغذائية',
      subTitle:
          'يعتبر النظام الغذائي النباتي خيارًا صحيًا يعتمد على تناول الأطعمة الغنية بمضادات الأكسدة وحمض الفوليك والمغنيسيوم، مما يعزز صحة الأمعاء ويحسن الرفاهية العقلية. ومع ذلك، يحذر الخبراء من أن الالتزام بنظام غذائي نباتي قد يؤدي إلى نقص بعض العناصر الغذائية الأساسية'),
];
