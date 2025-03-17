import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              // backgroundImage: AssetImage('assets/profile_image.png'), // 替换为您的头像图片路径
            ),
            SizedBox(height: 20),
            Text(
              'Username',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 800,
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.home),
                                    title: Text('Home'),
                                    onTap: () {
                                      // 处理点击事件
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.settings),
                                    title: Text('Settings'),
                                    onTap: () {
                                      // 处理点击事件
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text('Profile'),
                                    onTap: () {
                                      // 处理点击事件
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text('Vehicle Pass'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 800,
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.home),
                                    title: Text('Home'),
                                    onTap: () {
                                      // 处理点击事件
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.settings),
                                    title: Text('Settings'),
                                    onTap: () {
                                      // 处理点击事件
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text('Profile'),
                                    onTap: () {
                                      // 处理点击事件
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text('Vehicle Details'),
                    ),


                  ],
                ),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 800,
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.home),
                                title: Text('Home'),
                                onTap: () {
                                  // 处理点击事件
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.settings),
                                title: Text('Settings'),
                                onTap: () {
                                  // 处理点击事件
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.person),
                                title: Text('Profile'),
                                onTap: () {
                                  // 处理点击事件
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)
                      )
                    ),
                    side: MaterialStateProperty.all(
                      BorderSide(color: Colors.grey, width: 2),
                    ),
                  ),
                  child: Text(
                    'TOKEN',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.white),
                  ),

                ),
              ],
            )

          ],
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: Colors.black, // 设置黑色背景
    //   appBar: AppBar(
    //     backgroundColor: Colors.black,
    //     actions: [
    //       IconButton(
    //         icon: Icon(Icons.settings, color: Colors.white),
    //         onPressed: () {},
    //       ),
    //     ],
    //   ),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           _buildProfileHeader(),
    //           SizedBox(height: 20),
    //           _buildStatsCards(),
    //           SizedBox(height: 20),
    //           _buildRankProgress(),
    //           SizedBox(height: 20),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}


Widget _buildProfileHeader() {
  return Column(
    children: [
      Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[800],
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          Icon(Icons.edit, color: Colors.white, size: 20),
        ],
      ),
      SizedBox(height: 10),
      Text(
        'ezi',
        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget _buildStatsCards() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatCard("5 (1)", "Friends", Icons.people),
          _buildStatCard("6 (24)", "Emotes", Icons.emoji_emotions),
        ],
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatCard("2 (20)", "Card Backs", Icons.style),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text("ADD FRIENDS", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    ],
  );
}

Widget _buildStatCard(String value, String label, IconData icon) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey[900],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        SizedBox(height: 5),
        Text(value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    ),
  );
}

Widget _buildRankProgress() {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey[900],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Shrimp", style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(height: 5),
        LinearProgressIndicator(
          value: 0.3,
          backgroundColor: Colors.grey[700],
          color: Colors.orange,
        ),
      ],
    ),
  );
}