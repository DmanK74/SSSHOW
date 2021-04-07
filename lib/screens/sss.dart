// import 'dart:convert';
// import 'dart:html';

// import 'package:admibka/api/hello.dart';
// import 'package:admibka/themes/themes.dart';
// import 'package:felix_ui/components/components.dart';
// import 'package:felix_ui/felix_ui.dart';
// import 'package:flutter/foundation.dart';
// import 'package:admibka/screens/poster_card_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// ////////////
// import 'package:basic_utils/basic_utils.dart';
// import 'package:pin_code_view/pin_code_view.dart';

// class SliverGridWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           ///First sliver is the App Bar
//           SliverAppBar(
//             ///Properties of app bar
//             backgroundColor: Colors.white,
//             floating: false,
//             pinned: true,
//             expandedHeight: 200.0,

//             ///Properties of the App Bar when it is expanded
//             flexibleSpace: FlexibleSpaceBar(
//               centerTitle: true,
//               title: Text(
//                 "SliverGrid Widget",
//                 style: TextStyle(
//                     color: Colors.black87,
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: Utils.ubuntuRegularFont),
//               ),
//               background: Container(
//                 decoration: BoxDecoration(
//                   border: Border(
//                     top: BorderSide(
//                       color: Colors.black26,
//                       width: 1.0,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             actions: <Widget>[
//               IconButton(
//                 icon: Icon(Icons.code),
//                 onPressed: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CodeScreen(code: Code.sliverGridCode),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           SliverGrid(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               ///no.of items in the horizontal axis
//               crossAxisCount: 4,
//             ),

//             ///Lazy building of list
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 /// To convert this infinite list to a list with "n" no of items,
//                 /// uncomment the following line:
//                 /// if (index > n) return null;
//                 return listItem(
//                     Utils.getRandomColor(), "Sliver Grid item: index");
//               },

//               /// Set childCount to limit no.of items
//               /// childCount: 100,
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget listItem(Color color, String title) => Container(
//         height: 100.0,
//         color: color,
//         child: Center(
//           child: Text(
//             "title",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 10.0,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: Utils.ubuntuRegularFont),
//           ),
//         ),
//       );
// }
