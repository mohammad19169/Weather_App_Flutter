import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prcticeflutter/widgets/ProductModel.dart';

// class Api_Integration extends StatefulWidget {
//   const Api_Integration({super.key});
//
//   @override
//   State<Api_Integration> createState() => _Api_IntegrationState();
// }
//
// class _Api_IntegrationState extends State<Api_Integration> {
//   Future<List>? posts;
//
//   Future<List> getuserdata() async {
//     var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
//     var response = await http.get(url);
//     return jsonDecode(response.body);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text(
//             'API Integration',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         backgroundColor: Theme.of(context).primaryColorDark,
//       ),
//       body: Center(
//         child: posts == null
//             ? ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     posts = getuserdata();
//                   });
//                 },
//                 child: const Text('Get Data'),
//               )
//             : FutureBuilder(
//                 future: posts,
//                 builder: (context, AsyncSnapshot snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const CircularProgressIndicator(
//                       backgroundColor: Colors.amber,
//                     );
//                   } else if (snapshot.hasError) {
//                     return const AlertDialog(
//                       content: Text('Error fetching data'),
//                     );
//                   } else if (!snapshot.hasData || snapshot.data.isEmpty) {
//                     return const AlertDialog(
//                       content: Text('No Data available'),
//                     );
//                   } else {
//                     return ListView.builder(
//                       itemCount: snapshot.data.length,
//                       itemBuilder: (context, index) => ListTile(
//                         title: Text(snapshot.data[index]['title']),
//                       ),
//                     );
//                   }
//                 },
//               ),
//       ),
//     );
//   }
// }
class Api_Integration extends StatefulWidget {
  const Api_Integration({super.key});

  @override
  State<Api_Integration> createState() => _Api_IntegrationState();
}

class _Api_IntegrationState extends State<Api_Integration> {
  //Future <List>? posts;

  Future<ProductModel> GetUserData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    var response = await http.get(url);
    var responsebody=jsonDecode(response.body);
    //return responsebody;
    return ProductModel.fromJson(responsebody);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Integration'),
        backgroundColor: Theme
            .of(context)
            .primaryColorDark,
      ),
      body: FutureBuilder(future: GetUserData(), builder: (context,AsyncSnapshot<ProductModel> snapshot) {
        if(snapshot.hasData){
          return ListTile(
            title: Text("${snapshot.data!.title}"),
          );
        }
        else{
          return const CircularProgressIndicator();
        }
      },),
    );
  }
}

