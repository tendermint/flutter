#set( $ClassName = ${StringUtils.removeAndHump(${NAME}, "_")})
#set( $parentPackage = "#if(${PARENT.isEmpty()})#else${PARENT}/#end")

import 'package:flutter_app/presentation/${parentPackage}${NAME}/${NAME}_presentation_model.dart';
import 'package:flutter_app/ui/pages/${parentPackage}${NAME}/${NAME}_navigator.dart';

class ${ClassName}Presenter {

  ${ClassName}Presenter(
    this._model, 
    this.navigator,
  );
  
  final ${ClassName}PresentationModel _model;
  final ${ClassName}Navigator navigator;

  ${ClassName}ViewModel get viewModel => _model;
}