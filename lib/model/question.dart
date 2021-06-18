import 'dart:convert';

List<Question> listQuestionFromJson(String response) {
  final jsonData = json.decode(response);
  final data = jsonData["data"];
  return new List<Question>.from(data.map((x) => Question.fromJson(x)));
}

class Question{
  int id;
  String name;
  String date;
  String question;
  int comment;

  Question({
   this.id,
   this.name,
   this.date,
   this.question,
   this.comment
  });

  factory Question.fromJson(Map<String,dynamic>json)=>Question(
    id: json["id"],
    name: json["name"],
    date: json["date"],
    question: json["title"],
    comment: json["total_answer"]
  );

}