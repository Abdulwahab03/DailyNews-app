
import 'dart:convert';

import 'package:dailynews/models/newsmodel.dart';
import 'package:http/http.dart' as http;

class News {

  List<ArticleModel> articlesToSaveIn = [];

  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=us&"
        "category=business&apiKey=957a4eeac8de40d0acb4217956ebddfb";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: 'element[title]',
              description: 'element[description]',
              urlToImage: 'element[urlToImage]',
              url: 'element[url]'

          );
          articlesToSaveIn.add(articleModel);
        }
      });
    }
  }
}
// fetching news by category

class NewsCategory{
  List<ArticleModel> articlesToSaveIn = [];

  Future<void> getNews(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&"
        "category=$category&business&apiKey=957a4eeac8de40d0acb4217956ebddfb";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){

      jsonData['articles'].forEach((element){

        if(element['urlToImage']!=null && element['description']!=null){

          ArticleModel articleModel = ArticleModel(
              title: 'element[title]',
              description: 'element[description]',
              urlToImage: 'element[urlToImage]',
              url: 'element[url]'

          );
          articlesToSaveIn.add(articleModel);


        }

      });

    }
  }
}