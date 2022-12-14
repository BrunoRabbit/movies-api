import 'package:bloc/bloc.dart';
import 'package:movies_api/app/business_logic/usecases/get_configuration_api.dart';
import 'package:movies_api/app/data/models/config.dart';
import 'package:movies_api/core/utils/use_case.dart';

part 'configurate_api_event.dart';
part 'configurate_api_state.dart';

class ConfigurateApiBloc
    extends Bloc<ConfigurateApiEvent, ConfigurateApiState> {
  final GetConfigurationApi getConfigurationApi;

  ConfigurateApiBloc({required this.getConfigurationApi})
      : super(ConfigurateApiLoading()) {
    on<ConfigurateApiLoad>(_onLoad);
  }
  _onLoad(ConfigurateApiEvent event, Emitter<ConfigurateApiState> emit) async {
    emit(ConfigurateApiLoading());
    final errorOrConfig = await getConfigurationApi(NoParams());

    errorOrConfig.fold((error) {
      emit(ConfigurateApiError(error.toString()));
    }, (config) {
      emit(ConfigurateApiLoaded(config: config));
    });
  }
}
