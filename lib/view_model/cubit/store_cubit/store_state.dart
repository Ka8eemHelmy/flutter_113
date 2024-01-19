part of 'store_cubit.dart';

@immutable
abstract class StoreState {}

class StoreInitial extends StoreState {}

class StoreSearchLoadingState extends StoreState {}

class StoreSearchSuccessState extends StoreState {}

class StoreSearchErrorState extends StoreState {}
