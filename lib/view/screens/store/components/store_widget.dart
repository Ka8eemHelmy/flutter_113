import 'package:flutter/material.dart';
import 'package:flutter_113/model/store.dart';
import '../../instagram/instagram_screen.dart';

class StoreWidget extends StatelessWidget {
  final Store store;

  const StoreWidget({required this.store, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InstagramScreen(),
            ));
      },
      borderRadius: BorderRadius.circular(
        12,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12,
              ),
              color: Colors.grey[600],
            ),
            child: Icon(
              Icons.apple_rounded,
              color: Colors.white,
              size: 40,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        store.name ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      '${store.price}\$',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        store.date ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      store.cardType ?? '',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
