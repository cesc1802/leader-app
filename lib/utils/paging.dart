class Paging {
  final int? page;
  final int? limit;
  final int? total;

  const Paging({
    this.limit,
    this.page,
    this.total,
  });

  factory Paging.fromJSON(Map<String, dynamic> json) {
    return Paging(
      page: json['page'],
      limit: json['limit'],
      total: json['total'],
    );
  }
}
