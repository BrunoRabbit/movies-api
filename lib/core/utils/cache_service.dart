// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// class CacheService {
//   String get getCacheKey {
//     return dotenv.get('CACHE_KEY');
//   }

//   CacheManager get getCacheInstance {
//     CacheManager instance = CacheManager(
//       Config(
//         getCacheKey,
//         stalePeriod: const Duration(days: 7),
//         maxNrOfCacheObjects: 30,
//         repo: JsonCacheInfoRepository(databaseName: getCacheKey),
//         fileService: HttpFileService(),
//       ),
//     );
//     return instance;
//   }
// }
