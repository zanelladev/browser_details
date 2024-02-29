import 'base_exception.dart';

class PlataformNotImplementedException extends BaseException {
  PlataformNotImplementedException({
    super.message =
        'Browser Details: Plataform not implemented, only support Android',
    super.stackTrace,
  });
}
