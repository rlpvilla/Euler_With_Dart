library prime_factor_generator_lib;

bool divisor_not_target_factor (num target, int divisor){
  return target % divisor != 0;
}

bool target_not_factorable (int target, List number_list){
  var n = 2;
  for (var i in number_list) {
   if (divisor_not_target_factor (target, i) == false) {
     return false;
   }
    if (i >= (target/n + 1)) {
   return true;
    }
    n=i;
  }
}

void prime_list_expansion (int maximum, List prime_list) {
  var start = prime_list[prime_list.length - 1];
  var i = start+2;
  while (prime_list.length < maximum){
    if (target_not_factorable (i, prime_list) == true) {
      prime_list.add(i);
    }
    i+=2;
  }
}

void prime_list_expansion_up_to (int maximum, List prime_list) {
  var start = prime_list[prime_list.length - 1];
  var i = start+2;
  while (i < maximum){
    if (target_not_factorable (i, prime_list) == true) {
      prime_list.add(i);
    }
    i+=2;
  }
}

target_prime_in_sequence (int target, List prime_list) {
   return (prime_list[target-1]);
}

target_gcf (int start, List prime_list) {
  var target = start;
  var gcf = 0;
  for (var i in prime_list) {
    if (target != 1) {
      while (divisor_not_target_factor(target, i) == false) {
        target = (target/i);
        gcf = i;
      }
    }
  }
  if (target != 1) {
    throw 'Error - Divisor list insufficient for factoring';
  }
  return (gcf);
}

int sum_to(int target, List prime_list) {
  var sum = 0;
  for (var i in prime_list) {
    if (i < target) {
      sum += i;
    }
  }
  return (sum);
}