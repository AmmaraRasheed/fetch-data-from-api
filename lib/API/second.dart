import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserList extends StatelessWidget{

  final String apiUrl = "http://ninanews.com/NinaNewsService/api/values/GetLastXBreakingNews?rowsToReturn=10";

  Future<List<dynamic>> fetchUsers() async {

    var result = await http.get(apiUrl);
    return json.decode(result.body)['Data'];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
//              print(_age(snapshot.data[0]));
              return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return
                      Card(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(snapshot.data[index]['Pic'])),
                              title: Text(
                                snapshot.data[index]['Khabar_Title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(snapshot.data[index]['Khabar_Details']),
                            )
                          ],
                        ),
                      );
                  });
            }else {
              return Center(child: CircularProgressIndicator());
            }
          },


        ),
      ),
    );
  }

}