import 'package:newsapp_self/data/models/news/newsmodel.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {
  NewsInitial();
}

class NewsLoading extends NewsState {
  NewsLoading();
}

class NewsLoaded extends NewsState {
  final NewsModel newsModel;
  final String? category;
  NewsLoaded(this.newsModel, {this.category});
}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);
}
