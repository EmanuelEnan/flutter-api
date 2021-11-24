import 'dart:convert';
import 'package:apis/model/person.dart';
import 'package:http/http.dart' as http;

const String randomAPI = 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c38709e1d3104a15a089ac0e5a2d04db';

class QuoteService{
  Future<List<Quote>> fetchQuotes()async{
    http.Response response = await http.get(Uri.parse(randomAPI));
    if(response.statusCode == 200){
      Map peopleQuote = jsonDecode(response.body);
      List<dynamic> quotes = peopleQuote['articles'];
      return quotes.map((json) => Quote.fromJson(json)).toList();

    }else{
      throw Exception('Something went wrong, ${response.statusCode}');
    }
  }


  
}