import 'package:get/get.dart';
import 'package:infinite_scroll_getx/models/pagination_filter.dart';
import 'package:infinite_scroll_getx/models/user_model.dart';

import 'package:infinite_scroll_getx/repositories/user_repository.dart';

class HomeController extends GetxController {
  
  final UserRepository _userRepository;
  final _users = <UserModel>[].obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;

  List<UserModel> get users => _users.toList();
  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;

  HomeController(
    this._userRepository,
  );

  @override
  void onInit() {
    ever(_paginationFilter, (_) => _findUsers());
    _changePaginationFilter(1, 15);
    super.onInit();
  }

  Future<void> _findUsers() async {
    print('_findUsers $_paginationFilter');
    final usersData = await _userRepository.findAll(_paginationFilter.value);
    if(usersData.isEmpty){
      _lastPage.value = true;
    }
    _users.addAll(usersData);
  }

  void changeTotalPerPage(int limitValue){
    _users.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) { 
      val.page = page;
      val.limit = limit;
    });
  }

  void nextPage() => _changePaginationFilter(_page + 1 , limit);


}
