class GetApi {
  final results;

  GetApi({this.results});

  factory GetApi.fromJson(Map<String, dynamic> json) {
    return GetApi(results: json['results']);
  }
}
