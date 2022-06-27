class NewResponse {
  String? status;
  int? totalHits;
  int? page;
  int? totalPages;
  int? pageSize;
  List<Articles>? articles;
  UserInput? userInput;

  NewResponse(
      {this.status,
      this.totalHits,
      this.page,
      this.totalPages,
      this.pageSize,
      this.articles,
      this.userInput});

  NewResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalHits = json['total_hits'];
    page = json['page'];
    totalPages = json['total_pages'];
    pageSize = json['page_size'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
    userInput = json['user_input'] != null
        ? new UserInput.fromJson(json['user_input'])
        : null;
  }
}

class Articles {
  String? title;
  String? author;
  String? publishedDate;
  String? publishedDatePrecision;
  String? link;
  String? cleanUrl;
  String? excerpt;
  String? summary;
  String? rights;
  int? rank;
  String? topic;
  String? country;
  String? language;
  List<String>? authors;
  String? media;
  bool? isOpinion;
  String? twitterAccount;
  double? dScore;
  String? sId;

  Articles(
      {this.title,
      this.author,
      this.publishedDate,
      this.publishedDatePrecision,
      this.link,
      this.cleanUrl,
      this.excerpt,
      this.summary,
      this.rights,
      this.rank,
      this.topic,
      this.country,
      this.language,
      this.authors,
      this.media,
      this.isOpinion,
      this.twitterAccount,
      this.dScore,
      this.sId});

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    author = json['author'];
    publishedDate = json['published_date'];
    publishedDatePrecision = json['published_date_precision'];
    link = json['link'];
    cleanUrl = json['clean_url'];
    excerpt = json['excerpt'];
    summary = json['summary'];
    rights = json['rights'];
    rank = json['rank'];
    topic = json['topic'];
    country = json['country'];
    language = json['language'];
    authors = json['authors'].cast<String>();
    media = json['media'];
    isOpinion = json['is_opinion'];
    twitterAccount = json['twitter_account'];
    dScore = json['_score'];
    sId = json['_id'];
  }
}

class UserInput {
  String? q;
  List<String>? searchIn;
  Null? lang;
  Null? notLang;
  List<String>? countries;
  Null? notCountries;
  String? from;
  Null? to;
  String? rankedOnly;
  Null? fromRank;
  Null? toRank;
  String? sortBy;
  int? page;
  int? size;
  Null? sources;
  Null? notSources;
  Null? topic;
  Null? publishedDatePrecision;

  UserInput(
      {this.q,
      this.searchIn,
      this.lang,
      this.notLang,
      this.countries,
      this.notCountries,
      this.from,
      this.to,
      this.rankedOnly,
      this.fromRank,
      this.toRank,
      this.sortBy,
      this.page,
      this.size,
      this.sources,
      this.notSources,
      this.topic,
      this.publishedDatePrecision});

  UserInput.fromJson(Map<String, dynamic> json) {
    q = json['q'];
    searchIn = json['search_in']?.cast<String>();
    lang = json['lang'];
    notLang = json['not_lang'];
    countries = json['countries']?.cast<String>();
    notCountries = json['not_countries'];
    from = json['from'];
    to = json['to'];
    rankedOnly = json['ranked_only'];
    fromRank = json['from_rank'];
    toRank = json['to_rank'];
    sortBy = json['sort_by'];
    page = json['page'];
    size = json['size'];
    sources = json['sources'];
    notSources = json['not_sources'];
    topic = json['topic'];
    publishedDatePrecision = json['published_date_precision'];
  }
}
