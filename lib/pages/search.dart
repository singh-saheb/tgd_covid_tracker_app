import 'package:flutter/material.dart';


class Search extends SearchDelegate{

  final List countryList;

  Search(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
   return [
     IconButton(icon: Icon(Icons.clear), onPressed: (){
       query='';

     })
   ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    final suggestionList
         =
           query.isEmpty?
           countryList:
           countryList.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();

   return ListView.builder(
       itemCount: suggestionList.length,
       itemBuilder: (context,index){
     return Card(
       child: Container(
         height: 130,
         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
         child: Row(
           children: <Widget>[
             Container(
               width: 200,
               margin: EdgeInsets.symmetric(horizontal: 10),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text(
                     suggestionList[index]['country'],
                     style: TextStyle(fontWeight: FontWeight.bold),
                   ),
                   Image.network(
                     suggestionList[index]['countryInfo']['flag'],
                     height: 50,
                     width: 60,
                   ),
                 ],
               ),
             ),
             Expanded(
                 child: Container(
                   child: Column(
                     children: <Widget>[
                       Text(
                         'CONFIRMED:' +
                             suggestionList[index]['cases'].toString(),
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.red),
                       ),
                       Text(
                         'ACTIVE:' +
                             suggestionList[index]['active'].toString(),
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.blue),
                       ),
                       Text(
                         'RECOVERED:' +
                             suggestionList[index]['recovered'].toString(),
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.green),
                       ),
                       Text(
                         'DEATHS:' +
                             suggestionList[index]['deaths'].toString(),
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color:  Theme.of(context).brightness==Brightness.dark?Colors.grey[100]:Colors.grey[900]),
                       ),
                     ],
                   ),
                 ))
           ],
         ),
       ),
     );
   });
  }

}