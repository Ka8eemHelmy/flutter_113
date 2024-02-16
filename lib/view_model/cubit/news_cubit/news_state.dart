part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class GetNewsLoadingState extends NewsState {}

class GetNewsSuccessState extends NewsState {}

class GetNewsErrorState extends NewsState {}