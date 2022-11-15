import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:news_app/shared/listitem.dart';

class DetailsScreen extends StatelessWidget {
  final String tag;
  final ListItem item;
  DetailsScreen({Key? key, required this.item, required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                      tag: '${item.newsTitle}' ,
                      child: Image.network(item.imgUrl)),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Text(
                          item.newsTitle,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.person),
                            Text(
                              item.author,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.date_range),
                            Text(
                              item.author,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(lipsum.createParagraph(numParagraphs: 3),style:
                          TextStyle(
                            fontSize: 18,

                          ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
