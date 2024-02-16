import 'package:flutter/material.dart';
import '../../../../model/new.dart';
import '../../../components/widgets/text_custom.dart';

class NewWidget extends StatelessWidget {
  final New article;

  const NewWidget({required this.article, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.purpleAccent.withOpacity(0.1),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          Image.network(
            article.urlToImage ?? '',
            errorBuilder: (context, error, stackTrace) {
              return SizedBox();
            },
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextCustom(
                        text: article.author ?? '',
                        fontSize: 12,
                      ),
                    ),
                    TextCustom(
                      text: article.publishedAt ?? '',
                      fontSize: 12,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                TextCustom(
                  text: article.title ?? '',
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
