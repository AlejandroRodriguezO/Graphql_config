
class Data {
    Data({
       required this.faq,
    });

    final Faq faq;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        faq: Faq.fromJson(json["faq"]),
    );

    Map<String, dynamic> toJson() => {
        "faq": faq.toJson(),
    };
}

class Faq {
    Faq({
       required this.id,
       required this.questions,
    });

    final String id;
    final List<Question> questions;

    factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        id: json["id"],
        questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
    };
}

class Question {
    Question({
        this.question,
        this.answer,
    });

    final String? question;
    final String? answer;

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json["question"],
        answer: json["answer"],
    );

    Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
    };
}
