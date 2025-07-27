import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:task_photo/data/datasources/photo_online_source.dart';


import '../../data/datasources/photo_offline_data_source.dart';
import '../model/photo_model.dart';
import 'Photo_epository.dart';

@Injectable(as: PhotoRepository)
class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoOnlineDataSource onlineDataSource;
  final PhotoOfflineDataSource offlineDataSource;

  PhotoRepositoryImpl({
    required this.onlineDataSource,
    required this.offlineDataSource,
  });

  @override
  Future<List<Photo>> getPhotos(int page, int perPage) async {
    final connectivity = await Connectivity().checkConnectivity();

    if (connectivity.contains(ConnectivityResult.wifi) ||
        connectivity.contains(ConnectivityResult.mobile)) {
      // يوجد إنترنت
      final photos = await onlineDataSource.getCuratedPhotos(
        page: page,
        perPage: perPage,
      );
      // احفظهم في التخزين المؤقت
      await offlineDataSource.savePhotos(photos, page);
      return photos;
    } else {
      // لا يوجد إنترنت => جلب من التخزين المؤقت
      final cachedPhotos = await offlineDataSource.getPhotos(page);
      return cachedPhotos;
    }
  }
}
