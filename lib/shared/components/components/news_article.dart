import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../modules/webView.dart';

class NewsArticle extends StatelessWidget {
  final Map model;

  const NewsArticle({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Navigator.push(
             context,
             MaterialPageRoute(builder: (context) =>WebView(url: '${model['url']}') ,
             )
         );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        height: 150.0,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20.0),
              height: 150.0,
              width: 150.0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: CachedNetworkImage(
                imageUrl: '${model['urlToImage']}',
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) =>
                    const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    const Image(image: AssetImage('assets/images/5203299.jpg')),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${model['title']}',
                      style:Theme.of(context).textTheme.bodyLarge,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${model['publishedAt']}',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
