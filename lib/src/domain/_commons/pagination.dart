class Pagination {
  final int total;
  final int perPage;
  final int currentPage;
  final int lastPage;

  Pagination({
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
  });
}

class Paginated<T> {
  final List<T> items;
  final Pagination pagination;

  Paginated({required this.items, required this.pagination});
}
