
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailynews/views/categorypage.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String categoryName, images;
   const CategoryTile({Key? key,
    required this.categoryName,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder:(context) => CategoryFragment(
              category: categoryName.toLowerCase(),
            ),
          ),
        );
      },

      child: Container(
        margin: const EdgeInsets.all(16),
        child: Stack(
          children: <Widget> [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(  imageUrl:
                images,
                width: 180,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: 180,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black38
              ),
              child: Text(
                categoryName,
                style: const TextStyle(
                  color:Colors.white,
                  fontSize: 18,
                  fontWeight:FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
