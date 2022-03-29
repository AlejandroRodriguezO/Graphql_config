class Query {
  List getQuery({String lang= "en"}) {
    const String _query = r"""
      query Faq($lang:Language) {
          faq(lang: $lang) {
              id
              questions {
                  question
                  answer
              }
          }
      }
    """;

     final Map<String, dynamic> _variables = {
      "lang": lang,
      
    };

    return [_query, _variables];
  }
}
