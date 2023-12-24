/// Remove the comment to active

// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// class MockClassNameUsecase extends Mock
//     implements ClassNameUsecase  {}

// void main() {
  // late MockClassNameUsecase _mockClassNameUsecase;
  // late ExampleBloc _exampleBloc;
  // setUp(() {
  //   _mockClassNameUsecase = MockClassNameUsecase();
  //    _exampleBloc = ExampleBloc(
  //     classNameUsecase: _mockClassNameUsecase,
  //   );
  // });

  // group('ExampleBloc =>', () {
  //   test('bloc should have initial state as [StateExampleInitial]', () {
  //     expect(_exampleBloc.state.runtimeType, StateExampleInitial);
  //   });

  //   blocTest<ExampleBloc, ExampleState>(
  //     'emits [StateExample,] when EventExample is added.',
  //     build: () => _exampleBloc,
  //     act: (exampleBloc) => {
  //       //arrange
  //       when(() => _mockClassNameUsecase.call(
  //             exampleEntity: ExampleEntity(),
  //           )).thenAnswer((_) async => "response"),
  //       //act

  //       exampleBloc
  //           .add(EventExample(exampleEntity: ExampleEntity())),
  //     },
  //     expect: () => [
  //       isA<StateExample>(),

  //     ],
  //     verify: ((exampleBloc) => {
  //           verify(() => _mockClassNameUsecase.call(
  //               exampleEntity: ExampleEntity())).called(1),
  //         }),
  //     tearDown: () => {
  //       _exampleBloc.close(),
  //     },
  //   );
  // });
// }
