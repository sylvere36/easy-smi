String errorThrow(dynamic response) {
  if (response.data['error'] != null) {
    return response.data['error'];
  }
  if (response.data['type'] == null) {
    return response.data;
  }
  switch (response.data['type']) {
    case 'authentication_error':
    case 'server_error':
    case 'throttled_error':
    case 'invalid_request':
      return response.data['detail'];
    // case "validation_error":
    //   return "${response.data["attr"]} : ${response.data["detail"]}";
    default:
      return response.data['detail'];
  }
}
