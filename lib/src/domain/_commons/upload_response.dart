class UploadResponse {
  final String path;
  final String url;

  UploadResponse({required this.path, required this.url});

  factory UploadResponse.fromJson(Map<String, dynamic> json) => UploadResponse(
    path: (json['path'] as String?) ?? '',
    url: (json['url'] as String?) ?? '',
  );
}
