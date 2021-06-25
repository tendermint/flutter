#set( $ClassName = ${StringUtils.removeAndHump(${NAME}, "_")})

import 'package:flutter_app/domain/model/failures/displayable_failure.dart';

enum _${ClassName}FailureType {
  Unknown,
}

class ${ClassName}Failure {
  final _${ClassName}FailureType _type;

  // ignore: avoid_field_initializers_in_const_classes
  const ${ClassName}Failure.unknown() : _type = _${ClassName}FailureType.Unknown;

  DisplayableFailure displayableFailure() {
    switch (_type) {
      case _${ClassName}FailureType.Unknown:
        return DisplayableFailure.commonError();
    }
    throw StateError("Cannot parse \$_type into DisplayableFailure");
  }
}
