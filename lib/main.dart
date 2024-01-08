import 'package:flutter/material.dart'; // Импорт библиотеки flutter для создания пользовательского интерфейса.
import 'package:flutter_bloc/flutter_bloc.dart'; // Импорт библиотеки flutter_bloc для управления состояниями.
import 'package:todo_bloc/home.dart'; // Импорт файла home.dart.
import 'package:todo_bloc/simple_bloc_observer.dart'; // Импорт файла simple_bloc_observer.dart для отслеживания состояний.
import 'package:hydrated_bloc/hydrated_bloc.dart'; // Импорт библиотеки hydrated_bloc для сохранения состояний бизнес-логики.
import 'package:path_provider/path_provider.dart'; // Импорт библиотеки path_provider для работы с файловой системой.
import 'todo_bloc/todo_bloc.dart'; // Импорт файла todo_bloc.dart для управления состояниями задач.
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Гарантирует, что Flutter-система готова к работе.
  HydratedBloc.storage = await HydratedStorage.build( // Инициализация хранилища для сохранения состояний.
    storageDirectory: await getTemporaryDirectory(), // Установка временной директории для хранения состояний.
  );
  Bloc.observer = SimpleBlocObserver(); // Установка объекта, отслеживающего состояние.
  runApp(const MainApp()); // Запуск главного виджета MainApp в виде приложения.
}
class MainApp extends StatelessWidget {
  const MainApp({super.key}); // Конструктор класса MainApp.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Отключение отображения баннера отладки.
      title: 'Todo App', // Установка заголовка приложения.
      theme: ThemeData(
        colorScheme: const ColorScheme.light( // Настройка цветовой схемы для светлой темы.
            background: Colors.white, // Фоновый цвет - белый.
            onBackground: Colors.black, // Цвет текста на фоне - черный.
            primary: Colors.deepPurpleAccent, // Основной цвет - фиолетовый.
            onPrimary: Colors.black, // Цвет текста в основном цвете - черный.
            secondary: Color.fromARGB(202, 142, 100, 255), // Вторичный цвет.
            onSecondary: Colors.white // Цвет текста во вторичном цвете - белый.
        ),
      ),
      home: BlocProvider<TodoBloc>( // Предоставление TodoBloc для всего поддерева виджетов.
        create: (context) => TodoBloc()..add( // Создание экземпляра TodoBloc и добавление TodoStarted.
            TodoStarted()
        ),
        child: const HomeScreen(), // Главный экран - HomeScreen.
      ),
    );
  }
}