import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:dailynews/models/newsmodel.dart';
import '../models/newsdata.dart';

class CategoryFragment extends StatefulWidget {
  String category;
   CategoryFragment({Key? key,required this.category}) : super(key: key);

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  bool loading = true;

  // We also get our newsList
  List<ArticleModel> articles= [];
  getNews() async{
  NewsCategory newsdata = NewsCategory();
  await newsdata.getNews(widget.category);
  articles  = newsdata.articlesToSaveIn;
  setState(() {
    loading = false;
  });

  }

  @override
  void initState() {
    super.initState();
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
          children:  <Widget>[
            Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                widget.category.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: loading? const Center(
        child: CircularProgressIndicator()
      ):
      SingleChildScrollView(
          child: ListView.builder(
              itemCount: articles.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder:(BuildContext context, int index){
                return NewsTemplate(
                    title: articles[index].title,
                    description: articles[index].description,
                    urlToImage: articles[index].urlToImage
                );
              }
              ),
         ),
      );
  }
}

class NewsTemplate extends StatelessWidget {
  String title, description, urlToImage;
  NewsTemplate({
    Key? key,
    required this.title,
    required this.description,
    required this.urlToImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: <Widget> [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child:  CachedNetworkImage( imageUrl: urlToImage, width: 300, height: 200, fit: BoxFit.cover,),
          ),
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

