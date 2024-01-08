import 'dart:developer'; // Импортирование утилиты logger для ведения журнала разработки.
import 'package:bloc/bloc.dart'; // Импортирование пакета bloc, который предоставляет паттерн управления состоянием.
// Класс SimpleBlocObserver наследует от BlocObserver для перехвата событий жизненного цикла BLoC.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc); // Вызов родительского конструктора onCreate.
    log('onCreate -- bloc: ${bloc.runtimeType}'); // Логирование информации о создании BLoC.
    }
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event); // Вызов родительского метода onEvent.
// Логирование информации о событии, включая тип BLoC и детали события.
    log('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change); // Вызов родительского метода onChange.
// Логирование изменений состояния BLoC с деталями предыдущего и текущего состояния.
    log('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition); // Вызов родительского метода onTransition.
// Логирование перехода состояния с деталями о событии, предыдущем и текущем состоянии.
    log('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
// Логирование информации об ошибке, включая тип BLoC и данные об ошибке.
    log('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace); // Вызов родительского метода onError для дальнейшей обработки ошибки.
  }
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc); // Вызов родительского метода onClose.
// Логирование информации о закрытии BLoC.
    log('onClose -- bloc: ${bloc.runtimeType}');
  }
}