import '../../resourses/app_images.dart';

class CategoryData {
  final String text;
  final String icon;

  const CategoryData({required this.text, required this.icon});
}

List<CategoryData> categories = const [
  CategoryData(text: "Clothes", icon: AppImages.clothes),
  CategoryData(text: "Bag", icon: AppImages.bag),
  CategoryData(text: "Laptop", icon: AppImages.laptop),
  CategoryData(text: "Shoes", icon: AppImages.shoes),
];
