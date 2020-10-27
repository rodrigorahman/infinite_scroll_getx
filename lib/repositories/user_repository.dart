import 'package:dio/dio.dart';
import 'package:infinite_scroll_getx/models/pagination_filter.dart';
import 'package:infinite_scroll_getx/models/user_model.dart';

class UserRepository {
  Dio _dio;

  UserRepository(
    this._dio,
  );

  Future<List<UserModel>> findAll(PaginationFilter filter) {
    return _dio.get('/users', queryParameters: {
      'page': filter.page,
      'limit': filter.limit,
    }).then(
      (res) => res?.data
          ?.map<UserModel>(
            (u) => UserModel.fromMap(u),
          )
          ?.toList(),
    );
  }
}
