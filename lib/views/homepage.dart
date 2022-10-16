
import 'package:dailynews/models/newsmodel.dart';
import 'package:flutter/material.dart';
import '../models/category_tile.dart';
import '../models/categorymodel.dart';
import '../models/newsdata.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  // We get our Category list
  List<CategoryModel> categories = [];

  // We also get our newsList
  List<ArticleModel> articles= [];
  bool loading = true;

  getNews() async{
    News newsdata = News();
    await newsdata.getNews();
    articles  = newsdata.articlesToSaveIn;
    setState(() {
      loading = false;
    });

}

  @override
  void initState() {
    super.initState();
     categories = categories;
     getNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  const <Widget>[
            Text(
                "Naija",
              style: TextStyle(
                fontFamily: "Lobster",
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.green,
              ),
            ),
            SizedBox( width: 10 ),
            Text(
              "News",
              style: TextStyle(
                fontFamily: "Lobster",
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: loading? const Center(
        child: CircularProgressIndicator()
      ): SingleChildScrollView(
          child: Column(
           children: <Widget> [
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index){
                    return CategoryTile(
                      categoryName: categories[index].categoryName,
                      images: categories[index].images,
                    );
                  },
                ),
              ),

              ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder:(BuildContext context, int index){
                    return NewsTemplate(
                        title: articles[index].title,
                        description: articles[index].description,
                        urlToImage: articles[index].urlToImage,
                         url: '',
                    );
                  }

              ),
            ],
          ),
        ),
      );
  }
}
// We create a class for news
class NewsTemplate extends StatelessWidget {
  String title, description,urlToImage,url;
   NewsTemplate({
     Key? key,
      required this.title,
      required this.description,
     required this.urlToImage,
      required this.url
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: <Widget> [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(imageUrl: urlToImage, width: 380, height: 200, fit: BoxFit.cover,)),
          const  SizedBox(height: 10),
          Text(
            title,
            style:const TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          const  SizedBox(height: 10),
          Text(
            description,
            style:const TextStyle(
              fontStyle: FontStyle.normal,
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
