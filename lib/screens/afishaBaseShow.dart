// import 'dart:convert';

// import 'package:admibka/api/visitors.dart';
// import 'package:flutter/material.dart';

// class AfishaBaseShowPage extends StatefulWidget {
//   @override
//   _AfishaBaseShowPageState createState() => _AfishaBaseShowPageState();
// }

// class _AfishaBaseShowPageState extends State<AfishaBaseShowPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('widget.title'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 200),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               FutureBuilder(
//                 future: VisitorsApi().getHello(null, 'tom', '40031'),
//                 builder: (data, snapshot) {
//                   if (snapshot.hasData) {
//                     return Column(
//                       children: [
//                         Container(
//                             child: Text(snapshot.data.name ?? 'not foun1')),
//                         Text(snapshot.data.country ?? 'not foun2'),
//                         Text(snapshot.data.gender ?? 'not foun3'),
//                       ],
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text('Ошибка');
//                   } else {
//                     return Text('Загрузка');
//                   }
//                 },
//               ),
//               FutureBuilder(
//                 future: VisitorsApi().getServ(),
//                 builder: (data, snapshot) {
//                   if (snapshot.hasData) {
//                     print(jsonEncode(snapshot.data));
//                     return Expanded(
//                       child: ListView.builder(
//                           itemCount: snapshot.data.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Container(
//                               child: Row(
//                                 children: [
//                                   Container(
//                                       decoration: BoxDecoration(
//                                         border: Border(
//                                           bottom: BorderSide(
//                                             color:
//                                                 Color.fromRGBO(70, 70, 70, 100),
//                                           ),
//                                           top: BorderSide(
//                                             color:
//                                                 Color.fromRGBO(70, 70, 70, 100),
//                                           ),
//                                         ),
//                                       ),
//                                       child: Text(snapshot.data[index]['name']
//                                           .toString())),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text(snapshot.data[index]['country']
//                                       .toString()),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text(snapshot.data[index]['gender']
//                                       .toString()),
//                                 ],
//                               ),
//                             );
//                           }),
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text('Ошибка');
//                   } else {
//                     return Text('Загрузка');
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
