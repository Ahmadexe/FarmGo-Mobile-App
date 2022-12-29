import 'package:farmgo/models/article.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/material.dart';

import '../configs/custom_colors.dart';
import '../configs/defined_colors.dart';

class NewsCard extends StatelessWidget {
  final bool isMain;
  final Article article;
  const NewsCard({required this.article, this.isMain = false, super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: isMain ? 300 : 100,
      decoration: BoxDecoration(
          color: isMain ? fieldContrastDark : Colors.transparent,
          border: Border.all(
            color: customPrimaryColorDark,
          ),
          borderRadius:
              BorderRadius.all(Radius.circular(app.radius.lightCurve))),
      child: isMain
          ? Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 10,
                      child: SizedBox(
                          width: double.infinity,
                          child: Image.network(
                            article.urlToImage!,
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(height: app.space.y4),
                    Expanded(
                        child: Text(article.title!,
                            style: app.text.t1b,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis)),
                    SizedBox(
                      child: Expanded(
                          child: Text(article.description!,
                              style: app.text.t2.copyWith(color: textColorGrey),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis)),
                    )
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                        height: double.infinity,
                        child: Image.network(
                          article.urlToImage!,
                          fit: BoxFit.fill,
                        )),
                  ),
                  SizedBox(width: app.space.x2),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(article.title!,
                            style: app.text.t1b,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                        SizedBox(
                          width: 300,
                          height: 60,
                          child: Text(article.description!,
                              style: app.text.t2.copyWith(color: textColorGrey),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
