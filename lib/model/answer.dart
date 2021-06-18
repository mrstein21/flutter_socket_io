import 'dart:convert';
List<Answer> listAnswerFromJson(String response) {
  final jsonData = json.decode(response);
  final data = jsonData["data"];
  return new List<Answer>.from(data.map((x) => Answer.fromJson(x)));
}

class Answer{
  int question_id;
  int id;
  String answer;
  String date;
  String name;

  Answer({
    this.question_id,
    this.id,
    this.answer,
    this.date,
    this.name
  });

  factory Answer.fromJson(Map<String,dynamic>json)=>Answer(
      question_id: json["question_id"],
      id:  json["id"],
      date: json["date"],
      answer: json["answer"],
      name: json["name"]
  );

}