class ApiUrl {
  static String baseUrl = 'http://localhost:3000';
  static String getAllItem = '$baseUrl/todos';
  static String createItem = '$baseUrl/todos';
  static String updateItem = '$baseUrl/todos/';
  static String deleteItem = '$baseUrl/todos/';
  static String getItemByTitle = '$baseUrl/todos/search?title=';
}
