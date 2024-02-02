import 'package:flutter/material.dart';
import 'package:flutter_113/view/components/widgets/text_custom.dart';
import 'package:flutter_113/view_model/cubit/news_cubit/news_cubit.dart';
import 'package:flutter_113/view_model/cubit/news_cubit/news_cubit.dart';
import 'package:flutter_113/view_model/data/local/shared_helper.dart';
import 'package:flutter_113/view_model/data/local/shared_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/new_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchBar(
              controller: NewsCubit.get(context).searchController,
              onSubmitted: (value) async {
                // NewsCubit.get(context).callApiRequest();
                var asd = await SharedHelper.get(key: SharedKeys.token);
                print(asd);
              },
            ),
            Expanded(
              child: BlocBuilder<NewsCubit, NewsState>(
                builder: (context, state) {
                  var cubit = NewsCubit.get(context);
                  return Visibility(
                    visible: state is! GetNewsLoadingState,
                    replacement: Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: Visibility(
                      visible: cubit.news.isNotEmpty,
                      replacement: Center(
                        child: TextCustom(
                          text: 'No Data Found!',
                        ),
                      ),
                      child: ListView.separated(
                        padding: EdgeInsets.all(12),
                        itemCount: cubit.news.length,
                        itemBuilder: (context, index) {
                          return NewWidget(
                            article: cubit.news[index],
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 12,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
