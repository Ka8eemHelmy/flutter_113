import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../model/store.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());

  static StoreCubit get(context) => BlocProvider.of<StoreCubit>(context);

  TextEditingController searchController = TextEditingController();

  List<Store> storesList = [
    Store(
      name: 'Store 1',
      date: '2021-09-01',
      price: 240,
      cardType: 'Debit Card',
    ),
    Store(
      name: 'Store 2',
      date: '2021-09-02',
      price: 230,
      cardType: 'Credit Card',
    ),
    Store(
      name: 'Store 3',
      date: '2021-09-01',
      price: 240,
      cardType: 'Debit Card',
    ),
    Store(
      name: 'Store 4',
      date: '2021-09-04',
      price: 250,
      cardType: 'Credit Card',
    ),
    Store(
      name: 'Store 5',
      date: '2021-09-02',
      price: 240,
      cardType: 'Debit Card',
    ),
  ];

  List<Store> searchStores = [];

  void search(String value) {
    searchStores.clear();
    emit(StoreSearchLoadingState());
    for (Store i in storesList) {
      if ((i.name ?? '').trim().toLowerCase().contains(value.trim().toLowerCase()) ||
          i.price.toString().contains(value.trim().toLowerCase()) ||
          (i.date ?? '').trim().toLowerCase().contains(value.trim().toLowerCase())) {
        searchStores.add(i);
      }
    }
    emit(StoreSearchSuccessState());
  }
}
