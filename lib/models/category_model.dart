class CategoryModel {
  String img;
  String title;
  String desc;
  List<String> optionsTitleList;
  double rate;

  CategoryModel(
      {required this.title,
        required this.desc,
        required this.img,
        required this.optionsTitleList,
        required this.rate});
}

List<CategoryModel> categoryScreenList = [
  CategoryModel(
      title: 'Chicken Fila',
      desc: 'Chicken Burger, Fast Food',
      img: 'assets/images/test/chicken_fila_logo.jpeg',
      optionsTitleList: ['delivery', 'indoor'],
      rate: 2),
  CategoryModel(
      title: 'KFC',
      desc: 'Chicken Broast',
      img: 'assets/images/test/kfc_logo.png',
      optionsTitleList: ['delivery', 'Take Out', 'indoor', 'Out door'],
      rate: 4),
  CategoryModel(
      title: 'Chicken Fila',
      desc: 'Chicken Burger, Fast Food',
      img: 'assets/images/test/chicken_fila_logo.jpeg',
      optionsTitleList: ['delivery', 'indoor'],
      rate: 2.5),
  CategoryModel(
      title: 'KFC',
      desc: 'Chicken Broast',
      img: 'assets/images/test/kfc_logo.png',
      optionsTitleList: ['delivery', 'Take Out', 'indoor', 'Out door'],
      rate: 4.5),
];
