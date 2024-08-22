class Api {
  final dynamic header = {
    "Content-Type": "application/json",
  };
  final String basePath = 'https://10.0.2.2:7266/api';

  final getUsers = '/users';
  final storeUser = '/users/store';
}
