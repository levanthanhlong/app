// // import 'package:app/utls/use_token.dart';
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // class UserPage extends StatelessWidget {
// //   static const routeName = "/userPage";
// //
// //   const UserPage({super.key});
// //
// //   // Hàm để xóa token trong SharedPreferences
// //   Future<void> _logout(BuildContext context) async {
// //     final prefs = await SharedPreferences.getInstance();
// //     await prefs.setString('token', '0');// Xóa token
// //     print('remove success');
// //     final token = await getToken();
// //     print(token);
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       const SnackBar(content: Text('Logged out successfully')),
// //     );
// //
// //     // Điều hướng về trang đăng nhập (hoặc trang nào đó)
// //     Navigator.pushReplacementNamed(context, '/login');
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('User Page'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             const Text(
// //               'Welcome to the User Page!',
// //               style: TextStyle(fontSize: 24),
// //             ),
// //             const SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () => _logout(context), // Xử lý logout
// //               child: const Text('Logout'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../help_support/help_support_widget.dart';
//
// class UserPage extends StatelessWidget {
//   static const routeName = "/userPage";
//
//   const UserPage({super.key});
//
//   Future<void> _logout(BuildContext context) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('token', '0');
//     print('remove success');
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Logged out successfully')),
//     );
//     Navigator.pushReplacementNamed(context, '/login');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Profile',
//           style: TextStyle(
//               fontSize: 40, fontWeight: FontWeight.bold, color: Colors.grey),
//         ),
//         backgroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             // Header section
//             Container(
//               width: 400,
//               padding: const EdgeInsets.all(20),
//               decoration: const BoxDecoration(
//                 color: Colors.blueAccent,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(30),
//                 ),
//               ),
//               child: const Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: AssetImage('assets/images/avatar.png'),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'John Doe',
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Info cards
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 children: [
//                   Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: ListTile(
//                       leading: const Icon(Icons.settings, color: Colors.blue),
//                       title: const Text('Settings'),
//                       onTap: () {
//                         // Navigate to settings
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const SizedBox(height: 10),
//                   Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: ListTile(
//                       leading: const Icon(Icons.help, color: Colors.blue),
//                       title: const Text('Help & Support'),
//                       onTap: () {
//                         Navigator.pushNamed(context, HelpSupportPage.routeName);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 180),
//             // Logout button
//             ElevatedButton.icon(
//               onPressed: () => _logout(context),
//               icon: const Icon(Icons.logout),
//               label: const Text('Logout'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.redAccent,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 30,
//                   vertical: 15,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../help_support/help_support_widget.dart';
import 'bloc/user_bloc.dart';


class UserPage extends StatelessWidget {
  static const routeName = "/userPage";

  const UserPage({super.key});

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', '0');
    print('remove success');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logged out successfully')),
    );
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(GetUserInfoEvent()), // Khởi tạo Bloc và gọi sự kiện
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // Header section
              Container(
                width: 400,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserLoading) {
                      return const CircularProgressIndicator(color: Colors.white);
                    } else if (state is GetUserInfoSuccess) {
                      return Column(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/images/avatar.png'),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            state.fullName, // Hiển thị tên người dùng từ state
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    } else if (state is UserError) {
                      return Text(
                        state.error,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      );
                    } else {
                      return const Text(
                        'Unknown state',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Info cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.settings, color: Colors.blue),
                        title: const Text('Settings'),
                        onTap: () {
                          // Navigate to settings
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.area_chart, color: Colors.blue),
                        title: const Text('Analysis'),
                        onTap: () {

                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.help, color: Colors.blue),
                        title: const Text('Help & Support'),
                        onTap: () {
                          Navigator.pushNamed(context, HelpSupportPage.routeName);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 180),
              // Logout button
              ElevatedButton.icon(
                onPressed: () => _logout(context),
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
