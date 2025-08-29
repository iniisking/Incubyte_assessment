# String Calculator

A simple Dart project that implements a String Calculator. The calculator parses a string of numbers separated by delimiters and returns their sum. This project is suitable for learning Dart, practicing TDD, and understanding basic string manipulation.

## Getting Started

### Prerequisites

- Dart SDK (>=2.12.0)
- A terminal or IDE with Dart support

### Installation

1. Clone the repository:

   ```sh
   git clone <repo-url>
   cd string_calculator
   ```

2. Get dependencies:
   ```sh
   dart pub get
   ```

### Usage

Run the calculator from the command line:

```sh
dart run bin/string_calculator.dart
```

You can modify `bin/string_calculator.dart` to test different input strings.

### Running Tests

To run all unit tests:

```sh
dart test
```

For detailed output:

```sh
dart test -r expanded
```

### Project Structure

- `lib/string_calculator.dart`: Main calculator logic.
- `bin/string_calculator.dart`: Command-line entry point.
- `test/string_calculator_test.dart`: Unit tests.
- `pubspec.yaml`: Project dependencies and metadata.

## Contributing

Feel free to fork the repo, open issues, or submit pull requests.

<!-- ## License

This project is licensed under the MIT License. -->
