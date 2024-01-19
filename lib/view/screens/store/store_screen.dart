import 'package:flutter/material.dart';
import 'package:flutter_113/view/components/widgets/text_form_field_custom.dart';
import 'package:flutter_113/view_model/cubit/store_cubit/store_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/store_widget.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.blue,
        width: 350,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: Image.asset(
                      'assets/images/profile.jpg',
                      fit: BoxFit.cover,
                    ).image,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kareem Ahmed Helmy'),
                      Text('Kareem@gmail.com'),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey[600]!.withOpacity(0.4),
                    child: Icon(
                      Icons.confirmation_number_sharp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_add_alt_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'People',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_add_alt_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'People',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_add_alt_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'People',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_add_alt_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'People',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_add_alt_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'People',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_add_alt_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'People',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_add_alt_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'People',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<StoreCubit, StoreState>(
        builder: (context, state) {
          var cubit = StoreCubit.get(context);
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SearchBar(
                  controller: cubit.searchController,
                  onChanged: (value) {
                    print(value);
                    cubit.search(value);
                  },
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: (cubit.searchController.text.trim().isEmpty && cubit.storesList.isNotEmpty) ||
                      (cubit.searchController.text.trim().isNotEmpty && cubit.searchStores.isNotEmpty),
                  replacement: const Center(
                    child: Text('Data Not Found'),
                  ),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemBuilder: (context, index) {
                      return StoreWidget(
                        store: cubit.searchController.text.trim().isEmpty
                            ? cubit.storesList[index]
                            : cubit.searchStores[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: cubit.searchController.text.trim().isEmpty
                        ? cubit.storesList.length
                        : cubit.searchStores.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
