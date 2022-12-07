import 'package:bloc/bloc.dart';
import 'package:movies_api/business_logic/usecases/get_api_request.dart';
import 'package:movies_api/core/utils/use_case.dart';
import 'package:movies_api/data/models/config.dart';

part 'configurate_api_event.dart';
part 'configurate_api_state.dart';

class ConfigurateApiBloc
    extends Bloc<ConfigurateApiEvent, ConfigurateApiState> {
  final GetApiRequest getApiRequest;

  ConfigurateApiBloc({required this.getApiRequest})
      : super(ConfigurateApiLoading()) {
    on<ConfigurateApiLoad>(_onLoad);
  }
  _onLoad(ConfigurateApiEvent event, Emitter<ConfigurateApiState> emit) async {
    emit(ConfigurateApiLoading());
    final errorOrConfig = await getApiRequest(NoParams());

    errorOrConfig.fold((error) {
      emit(ConfigurateApiError(error.toString()));
    }, (config) {
      emit(ConfigurateApiLoaded(config: config));
    });
  }
}
