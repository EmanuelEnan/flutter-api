

class Quote{
  late String source;
  
  late String author;
  late String title;

  Quote({required this.source,required this.author,required this.title});

  Quote.fromJson(Map<String, dynamic> json): 
  source = '${json['source'] ['id']} ${json['source'] ['name']}',
  author = '${json['author']}',
  title = '${json['title']}';
  
  

}