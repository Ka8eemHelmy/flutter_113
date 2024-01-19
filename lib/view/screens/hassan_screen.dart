import 'package:flutter/material.dart';

class HassanScreen extends StatelessWidget {
  const HassanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.directions_sharp),
        actions: [
          Icon(Icons.settings),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          // width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: Image.network(
                  'https://scontent.fcai19-4.fna.fbcdn.net/v/t39.30808-6/393187606_2019220641794018_1355246045978106041_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=AjckLVSUXSEAX8jB6gC&_nc_ht=scontent.fcai19-4.fna&oh=00_AfAlsbOkVINSBQhgKN_xvJTXEGdX67B3f4YD-W8EFbq7uA&oe=656C658D',
                  fit: BoxFit.contain,
                ).image,
              ),
              Text(
                'MOHAMED HASSAN',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'MOHAMED3@hootline.com',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'UPGRADE TO PRO',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  print('yes');
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'PLess',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Material(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    print('Esraa');
                  },
                  child: Container(
                    padding: EdgeInsetsDirectional.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // width: 250,
                    // height: 100,
                    child: Row(
                      children: [
                        Icon(
                          Icons.privacy_tip,
                          color: Colors.red,
                          size: 20,
                        ),
                        Expanded(
                          child: Text(
                            'Privacy',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 40,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.offline_pin_rounded,
                          color: Colors.red,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.all(50),
                margin: EdgeInsetsDirectional.all(50),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                width: 250,
                height: 100,
                child: Row(
                  children: [
                    Icon(
                      Icons.access_alarm,
                      color: Colors.red,
                      size: 20,
                    ),
                    Text(
                      'Purchase History',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                      ),
                    ),
                    Icon(
                      Icons.offline_pin_rounded,
                      color: Colors.red,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.all(50),
                margin: EdgeInsetsDirectional.all(50),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                width: 250,
                height: 100,
                child: Row(
                  children: [
                    Icon(
                      Icons.help,
                      color: Colors.red,
                      size: 20,
                    ),
                    Text(
                      'Help & Support',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                      ),
                    ),
                    Icon(
                      Icons.offline_pin_rounded,
                      color: Colors.red,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.all(50),
                margin: EdgeInsetsDirectional.all(50),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                width: 250,
                height: 100,
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.red,
                      size: 20,
                    ),
                    Text(
                      'Setting',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                      ),
                    ),
                    Icon(
                      Icons.offline_pin_rounded,
                      color: Colors.red,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.all(50),
                margin: EdgeInsetsDirectional.all(50),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                width: 250,
                height: 100,
                child: Row(
                  children: [
                    Icon(
                      Icons.people_alt_outlined,
                      color: Colors.red,
                      size: 20,
                    ),
                    Text(
                      'Invite A Friend',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                      ),
                    ),
                    Icon(
                      Icons.offline_pin_rounded,
                      color: Colors.red,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.all(50),
                margin: EdgeInsetsDirectional.all(50),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                width: 250,
                height: 100,
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.red,
                      size: 20,
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                      ),
                    ),
                    Icon(
                      Icons.offline_pin_rounded,
                      color: Colors.red,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
