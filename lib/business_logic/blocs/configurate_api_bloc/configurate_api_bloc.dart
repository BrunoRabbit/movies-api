import 'package:bloc/bloc.dart';
import 'package:movies_api/business_logic/usecases/get_api_request.dart';
import 'package:movies_api/data/models/config.dart';

part 'configurate_api_event.dart';
part 'configurate_api_state.dart';

class ConfigurateApiBloc
    extends Bloc<ConfigurateApiEvent, ConfigurateApiState> {
  final GetApiRequest getApiRequest;

  ConfigurateApiBloc({required this.getApiRequest})
      : super(ConfigurateApiState()) {
    on<ConfigurateApiLoad>(_onLoad);
  }
  _onLoad(ConfigurateApiEvent event, Emitter<ConfigurateApiState> emit) async {
    emit(ConfigurateApiLoading());
    try {
      final config = await getApiRequest.getApiRequest();
      emit(ConfigurateApiLoaded(config: config));
    } catch (e) {
      emit(ConfigurateApiError(e.toString()));
    }
  }
}
