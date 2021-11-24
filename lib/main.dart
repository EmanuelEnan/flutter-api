
import 'package:flutter/material.dart';

import 'model/person.dart';
import 'service/person_network_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen()
        
        
      
    
      
    );
  }
}

class HomeScreen extends StatelessWidget {
  final QuoteService personService = QuoteService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1352&q=80"),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: FutureBuilder(
            future: personService.fetchQuotes(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Quote>> snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Card(
                          color: Colors.black.withOpacity(0.5),
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var currentPerson = snapshot.data![index];

                                return ListTile(
                                  title: Text(currentPerson.source),
                                 
                                  subtitle: Text(
                                      "Author: ${currentPerson.author}",
                                      
                                      
                                      
                                      ),
                                      trailing: Text(
                                        'Title: ${currentPerson.title}'
                                      ),
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (snapshot.hasError) {
                return const Center(
                    child: Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 82.0,
                ));
              }

              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Loading at the moment, please hold the line.")
                ],
              ));
            },
          ),
        ),
      ),
    );
  }
}
