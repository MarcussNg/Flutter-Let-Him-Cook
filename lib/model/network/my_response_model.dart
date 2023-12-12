class MyResponseModel<T, V> {
  ResponseStatus _status;
  T? _data;
  V? _error;

  MyResponseModel.initial() : _status = ResponseStatus.INITIAL;
  MyResponseModel.loading() : _status = ResponseStatus.LOADING;
  MyResponseModel.complete(data)
      : _status = ResponseStatus.COMPLETE,
        _data = data;
  MyResponseModel.error(error)
      : _status = ResponseStatus.ERROR,
        _error = error;

  V? get error => _error;
  T? get data => _data;
  ResponseStatus get status => _status;
}

enum ResponseStatus { INITIAL, COMPLETE, ERROR, LOADING, CONSUMED }
