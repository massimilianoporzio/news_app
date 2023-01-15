//* QUESTO SERVIZIO RESITUISCE IL JSON COME MAP<String,dynamic>
abstract class ApiService {
  Future<Map<String, dynamic>> getData();
}
