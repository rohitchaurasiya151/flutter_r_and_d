// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       onGenerateRoute: (settings) {
//         switch (settings.name) {
//           case HomePage.route:
//             return MaterialPageRoute(
//                 builder: (context) => Scaffold(
//                       body: Container(
//                         color: Colors.amber,
//                         child: const Text("home"),
//                       ),
//                     ),
//                 settings: const RouteSettings(name: HomePage.route));
//         }
//       },
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   static const String route = "/home";
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _pageIndex = 0;
//   List<int> screenStack = [0];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("page $_pageIndex"),
//       ),
//       body: SafeArea(
//         child: WillPopScope(
//           onWillPop: () async {
//             if (screenStack.length > 1) {
//               setState(() {
//                 screenStack.removeLast();
//                 _pageIndex = screenStack[screenStack.length - 1];
//               });
//               return false;
//             }
//             return true;
//           },
//           child: IndexedStack(
//             index: _pageIndex,
//             children: <Widget>[
//               Container(
//                 color: Colors.amber,
//                 child: Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const Scaffold(
//                                         body: Center(
//                                           child: Text("DetailsPage"),
//                                         ),
//                                       )));
//                         },
//                         child: const Text("navigate"),
//                       ),
//                       const Text('Home'),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 color: Colors.green,
//                 child: const Text('Business'),
//               ),
//               Container(
//                 color: Colors.blueAccent,
//                 child: const Text('Technology'),
//               ),
//               Container(
//                 color: Colors.blueAccent,
//                 child: const Text('Education'),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Business',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.computer),
//             label: 'Technology',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'Education',
//           ),
//         ],
//         currentIndex: _pageIndex,
//         onTap: (int index) {
//           setState(
//             () {
//               _pageIndex = index;
//               if (_pageIndex == 0) {
//                 screenStack = [0];
//               } else if (!screenStack.contains(_pageIndex)) {
//                 screenStack.add(_pageIndex);
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// // ignore: must_be_immutable
// class DetailRoute extends StatelessWidget {
//   late TextEditingController? textEditingController;
//   int? index;
//
//   DetailRoute({Key? key, this.textEditingController, this.index})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
