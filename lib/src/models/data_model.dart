class DataModel {
  DataModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
  });

  int page;
  int perPage;
  int total;
  int totalPages;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
      };
}
