
class CategoryModel{
  String images;
  String categoryName;

  CategoryModel({
    required this.categoryName,
    required this.images

});
}

List<CategoryModel> categories = [
  CategoryModel(
      images: "assets/images/business image.jpg",
      categoryName: "Business news"
  ),

  CategoryModel(
      images: "assets/images/entertainment image.jpg",
      categoryName: "Entertainment news"
  ),

  CategoryModel(
      images: "assets/images/health image.png",
      categoryName: "Health news"
  ),
  CategoryModel(
      images: "assets/images/science image.jpg",
      categoryName: "Science news"
  ),
  CategoryModel(
      images: "assets/images/sport image.jpg",
      categoryName: "Sport news"
  ),
  CategoryModel(
      images: "assets/images/technology image.jpg",
      categoryName: "Technology news"
  ),

];