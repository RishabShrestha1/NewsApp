import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsapp_self/core/config/assets/app_vectors.dart';
import 'package:newsapp_self/core/constants/screen_dimensions.dart';
import 'package:newsapp_self/presentation/Homepage/bloc/home_bloc.dart';
import 'package:newsapp_self/presentation/Homepage/bloc/home_event.dart';
import 'package:newsapp_self/presentation/Homepage/bloc/home_state.dart';
import 'package:newsapp_self/presentation/Homepage/widgets/category_tab.dart';
import 'package:newsapp_self/presentation/Homepage/widgets/news_tile.dart';
import 'package:newsapp_self/presentation/Homepage/widgets/shimmer_homescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onCategoryTap(String category) {
    if (category == 'All') {
      context.read<NewsBloc>().add(FetchNews());
    } else {
      context.read<NewsBloc>().add(FetchNewsByCategory(category));
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(FetchNews());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 24,
        scrolledUnderElevation: 0,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 45,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              height: 32.sp,
              width: 32.sp,
              margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/notification.svg',
                  height: 20,
                  width: 18.sh,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Text(
                    'Latest',
                    style: TextStyle(
                      fontSize: deviceHeight * 0.02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: deviceHeight * 0.02,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.sp),
            CategoryTab(onCategorySelected: onCategoryTap),
            SizedBox(height: 8.sp),
            Expanded(
              child: BlocConsumer<NewsBloc, NewsState>(
                listener: (context, state) {
                  if (state is NewsError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is NewsLoading) {
                    return const LoadingHomescreen();
                  } else if (state is NewsError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else if (state is NewsLoaded) {
                    return ListView.builder(
                      itemCount: state.newsModel.articles.length,
                      itemBuilder: (context, index) {
                        final article = state.newsModel.articles[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 14.0.sp),
                          child: NewsTile(
                            title: article.title,
                            imageUrl: article.urlToImage ?? '',
                            source: article.source.name,
                            time: (DateTime.now()
                                        .difference(article.publishedAt)
                                        .inHours) >
                                    24
                                ? '${DateTime.now().difference(article.publishedAt).inDays}d'
                                : '${DateTime.now().difference(article.publishedAt).inHours}h',
                            content: article.content,
                            description: article.description ?? '',
                            categorylabel: state.category ?? 'All',
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('No Data'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
