
import '../../domain/model/photo_model.dart';

abstract class PhotoState {}

class PhotoLoadingState extends PhotoState {}

class PhotoSuccessState extends PhotoState {
  final List<Photo> photos;
  PhotoSuccessState({required this.photos});
}

class PhotoErrorState extends PhotoState {
  final String errorMessage;
  PhotoErrorState({required this.errorMessage});
}
