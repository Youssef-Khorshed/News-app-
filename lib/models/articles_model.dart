class ArticlesModel {
  final String? image;
  final String title;
  final String? description;
  final String url;

  ArticlesModel(
      {required this.image,
      required this.title,
      required this.description,
      required this.url});

  factory ArticlesModel.fromJson({required jsonData}) {
    return ArticlesModel(
      image: jsonData['urlToImage'],
      title: jsonData['title'],
      description: jsonData['description'],
      url: jsonData['url'],
    );
  }
}
