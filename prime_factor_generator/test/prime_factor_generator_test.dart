library prime_factor_generator_lib_test;

import 'package:unittest/unittest.dart';
import 'package:prime_factor_generator/prime_factor_generator.dart';
import 'package:prime_factor_generator/prime_list.dart';

main() {
  run_tests();
}

run_tests() {
  group('-prime factor generator- should', () {
    test('evaluate if divisor is not a factor of the target', () {
      // Arrange
      var target = 10;
      var list = [2,5,7];
      var i = 1;
      var divisor = list[i];
      // Act
      var result = divisor_not_target_factor (target, divisor);
      // Assert
      expect(result, false);
    });

    test('evaluate if target is not factorable', () {
      // Arrange
      var target = 1999993;
      // Act
      var result = target_not_factorable (target, list_of_primes);
      // Assert
      expect (result, true);
    });

    test('evaluate whether list of primes is grown', () {
      // Arrange
      var maximum = 1001;
      var control_list_of_primes = <int>[2,3,5,7,11];
      var test_list_of_primes = <int>[2,3,5,7,11];
      // Act
      prime_list_expansion(maximum, test_list_of_primes);
      // Assert
      expect(control_list_of_primes != test_list_of_primes, true);
      expect(test_list_of_primes[test_list_of_primes.length-1] == 7927, true);
      expect(test_list_of_primes.length == 1001, true);
    });
    
    test('evaluate whether list of primes is grown (up to target value)', () {
      // Arrange
      var maximum = 1001;
      var control_list_of_primes = <int>[2,3,5,7,11];
      var test_list_of_primes = <int>[2,3,5,7,11];
      // Act
      prime_list_expansion_up_to(maximum, test_list_of_primes);
      // Assert
      expect(test_list_of_primes[test_list_of_primes.length-1] <= 1001, true);
    });
    
    test('evaluate expected sequentially indexed prime', () {
      // Arrange
      var target = 17;
      // Act
      var result = target_prime_in_sequence (target, list_of_primes);
      // Assert
      expect (result, 59);
    });
    test('evaluate the greatest prime factor of target prime', () {
      // Arrange
      var target = 1178655;
      // Act
      var result = target_gcf (target, list_of_primes);
      // Assert
      expect (result, 78577);
    });
    test('throw error for insufficient divisor list of primes', () {
      // Arrange
      var target = 8755454778893209;
      // Act
      var result = target_gcf (target, list_of_primes);
      // Assert
      expect (target_gcf(target, list_of_primes),throwsUnsupportedError);
    });
    test('sum all primes under target number', () {
      // Arrange
      var target = 1000;
      // Act
      var result = sum_to (target, list_of_primes);
      // Assert
      expect (result, 76127);
    });
  });
}

void name() {
  
}
