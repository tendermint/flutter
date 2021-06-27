// ignore_for_file: avoid_setters_without_getters
#set( $ClassName = ${StringUtils.removeAndHump(${NAME}, "_")})
#set( $parentPackage = "#if(${PARENT.isEmpty()})#else${PARENT}/#end")
import 'package:flutter_app/presentation/${parentPackage}${NAME}/${NAME}_initial_params.dart';

abstract class ${ClassName}ViewModel {}

class ${ClassName}PresentationModel with ${ClassName}PresentationModelBase implements ${ClassName}ViewModel {
 final ${ClassName}InitialParams initialParams;
 
 ${ClassName}PresentationModel(this.initialParams);
}

//////////////////BOILERPLATE
abstract class ${ClassName}PresentationModelBase {

}