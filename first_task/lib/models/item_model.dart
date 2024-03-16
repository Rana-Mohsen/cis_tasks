class ItemModel {
  final String? name;
  final String? mainImage;
  final List<String> images;
  bool isFavorit;

  ItemModel(this.name, this.mainImage, this.images, this.isFavorit);
}

 List<ItemModel> items = [
    ItemModel("pink", "pink.jpg", ["pink1.jpg", "pink2.jpg"], false),
    ItemModel("white", "white.jpg", ["white1.jpg", "white2.jpg"], false),
    ItemModel("yellow", "yellow.jpg", ["yellow1.jpg", "yellow2.jpg"], false),
    ItemModel("pink", "pink.jpg", ["pink1.jpg", "pink2.jpg"], false),
    ItemModel("white", "white.jpg", ["white1.jpg", "white2.jpg"], false),
    ItemModel("yellow", "yellow.jpg", ["yellow1.jpg", "yellow2.jpg"], false),
  ];