# Iterable collections


##  What are collections?

> A collection is **an object that represents a group of objects**, which are called *elements*. Iterables are a kind of collection.
>

A collection can be empty, or it can contain many elements. Depending on the purpose, collections can have different structures and implementations. These are some of the most common collection types:

- [List:](https://api.dart.dev/stable/dart-core/List-class.html) Used to read elements by their indexes.
- [Set:](https://api.dart.dev/stable/dart-core/Set-class.html) Used to contain elements that can occur only once.
- [Map:](https://api.dart.dev/stable/dart-core/Map-class.html) Used to read elements using a key.

## What is an Iterable?

An `Iterable` is a collection of elements that can be accessed sequentially.

> In Dart, an `Iterable` is an abstract class, meaning that you can’t instantiate it directly. However, you can create a new `Iterable` by creating a new `List` or `Set`.
>

- Both `List` and `Set` are `Iterable`, so they have the same methods and properties as the `Iterable` class.
- Elements of a `Map` can also be read as `Iterable` objects by using the map’s `entries` or `values` property.

> A `Map` uses a different data structure internally, depending on its implementation. For example, [HashMap](https://api.dart.dev/stable/dart-collection/HashMap-class.html) uses a hash table in which the elements (also called *values*) are obtained using a key.

This example shows a `List` of `int`, which is also an `Iterable` of `int`:

```dart
Iterable<int> iterable = [1, 2, 3];
```

The difference with a `List` is that with the `Iterable`, you can’t guarantee that reading elements by index will be efficient. `Iterable`, as opposed to `List`, doesn’t have the `[]` operator.

For example, consider the following code, which is **invalid**:

```dart
Iterable<int> iterable = [1, 2, 3];
int value = iterable[1];
// error The operator '[]' isn't defined for the type 'Iterable<int>' -
```

If you read elements with `[]`, the compiler tells you that the operator `'[]'` isn’t defined for the class `Iterable`, which means that you can’t use `[index]` in this case.

You can instead read elements with `elementAt()`, which steps through the elements of the iterable until it reaches that position.

```dart
Iterable<int> iterable = [1, 2, 3];
int value = iterable.elementAt(1);
```

Continue to the next section to learn more about how to access elements of an [Iterable](https://dart.dev/codelabs/iterables#reading-elements).

## Reading elements

You can read the elements of an iterable sequentially, using a `for-in` loop.

### for-in loop

The following example shows you how to read elements using a `for-in` loop.

```dart
  Iterable<String> iterable = [
    'Salad',
    'Popcorn',
    'Toast',
  ];

  print(iterable);

  for (var i in iterable) {
    print(i);
  }
```

```dart
Console------>
[Salad, Popcorn, Toast]
Salad
Popcorn
Toast
```

### first and last

In some cases, you want to access only the first or the last element of an `Iterable`.

With the `Iterable` class, you can’t access the elements directly, so you can’t call `iterable[0]` to access the first element. Instead, you can use `first`, which gets the first element.

Also, with the `Iterable` class, you can’t use the operator `[]` to access the last element, but you can use the `last` property.

> Because accessing the last element of an Iterable requires stepping through all the other elements, **`last` can be slow.** Using `first` or `last` on an **empty `Iterable`** results in a [StateError.](https://api.dart.dev/stable/dart-core/StateError-class.html)



```dart
  print(iterable.first);
  print(iterable.last);
  // Salad
  // Toast
```

In this example you saw how to use `first` and `last` to get the first and last elements of an `Iterable`. It’s also possible to find the first element that satisfies a condition. The next section shows how to do that using a method called `firstWhere()`.

### firstWhere()

Now, you learn how to use `firstWhere()` to find the first element that satisfies certain conditions. This method requires you to pass a *predicate*, which is a function that returns true if the input satisfies a certain condition.

```dart
String element = iterable.firstWhere((element) => element.length > 5);
```

For example, if you want to find the first `String` that has more than 5 characters, you must pass a *predicate* that returns true when the element size is greater than 5.

Run the following example to see how `firstWhere()` works. Do you think all the functions will give the same result?

```dart
bool predicate(String element) {
  return element.length > 5;
}

main() {
  var items = ['Salad', 'Popcorn', 'Toast', 'Lasagne'];

  // You can find with a simple expression:
  var element1 = items.firstWhere((element) => element.length > 5);
  print(element1);

  // Or try using a function block:
  var element2 = items.firstWhere((element) {
    return element.length > 5;
  });
  print(element2);

  // Or even pass in a function reference:
  var element3 = items.firstWhere(predicate);
  print(element3);

  // You can also use an `orElse` function in case no value is found!
  var element4 = items.firstWhere(
    (element) => element.length > 10,
    orElse: () => 'None!',
  );
  print(element4);
}

/*
Popcorn
Popcorn
Popcorn
None!
*/
```

In this example, you can see three different ways to write a predicate:

- **As an expression:** The test code has one line that uses arrow syntax (`=>`).
- **As a block:** The test code has multiple lines between brackets and a return statement.
- **As a function:** The test code is in an external function that’s passed to the `firstWhere()` method as a parameter.

There is no right or wrong way. Use the way that works best for you, and that makes your code easier to read and understand.

In the example, `firstWhereWithOrElse()` calls `firstWhere()` with the optional named parameter `orElse`, which provides an alternative when an element isn’t found. In this case, the text `'None!'` is returned because no element satisfies the provided condition.

>  If no element satisfies the test predicate and the `orElse` parameter isn’t provided, then `firstWhere()` throws a [StateError](https://api.dart.dev/stable/dart-core/StateError-class.html)

**Quick review:**

- The elements of an `Iterable` must be accessed sequentially.
- The easiest way to iterate through all the elements is using a `for-in` loop.
- You can use the `first` and `last` getters to get the first and last elements.
- You can also find the first element that satisfies a condition with `firstWhere()`.
- You can write test predicates as expressions, blocks, or functions.

**Key terms:**

- **Predicate:** A function that returns `true` when a certain condition is satisfied.

### Exercise: Practice writing a test predicate

The following exercise is a failing unit test that contains a partially complete code snippet. Your task is to complete the exercise by writing code to make the tests pass. You don’t need to implement `main()`.

This exercise introduces `singleWhere()` This method works similarly to `firstWhere()`, but in this case it expects only one element of the `Iterable` to satisfy the predicate. If more than one or no element in the `Iterable` satisfies the predicate condition, then the method throws a [StateError](https://api.dart.dev/stable/dart-core/StateError-class.html) exception.

> `singleWhere()` steps through the whole `Iterable` until the last element, which can cause problems if the `Iterable` is infinite or contains a large collection of elements.



## Checking conditions

When working with `Iterable`, sometimes you need to verify that all of the elements of a collection satisfy some condition.

You might be tempted to write a solution using a `for-in` loop like this one:

```dart
// bad
for (var item in items) {
  if (item.length < 5) {
    return false;
  }
}
return true;
```

However, you can accomplish the same using the `every()` method:

```dart
// good
return items.every((element) => element.length >= 5);
```

Using the [   ](https://dart.dev/codelabs/iterables#example-using-any-and-every)`every()` method results in code that is more readable, compact, and less error prone.

### any() and every()

The `Iterable` class provides two methods that you can use to verify conditions:

- `any()`: Returns true if at least one element satisfies the condition.
- `every()`: Returns true if all elements satisfy the condition.

Run this exercise to see them in action.

```dart
void main() {
  var items = ['Salad', 'Popcorn', 'Toast'];
  
  if (items.any((element) => element.contains('a'))) {
    print('At least one element contains "a"');
  }
  
  if (items.every((element) => element.length >= 5)) {
    print('All elements have length >= 5');
  }
}
```

In the example, `any()` verifies that at least one element contains the character `a`, and `every()` verifies that all elements have a length equal to or greater than 5.

After running the code, try changing the predicate of `any()` so it returns false:

```dart
if (items.any((element) => element.contains('Z'))) {
  print('At least one element contains "Z"');
} else {
  print('No element contains "Z"');
}
```

You can also use `any()` to verify that no element of an `Iterable` satisfies a certain condition.

### [   ](https://dart.dev/codelabs/iterables#exercise-verify-that-an-iterable-satisfies-a-condition)

### Exercise: Verify that an Iterable satisfies a condition

The following exercise provides practice using the `any()` and `every()` methods, described in the previous example. In this case, you work with a group of users, represented by `User` objects that have the member field `age`.

Use `any()` and `every()` to implement two functions:

- Part 1: Implement

   

  ```plaintext
  anyUserUnder18()
  ```

  .

  - Return `true` if at least one user is 17 or younger.

- Part 2: Implement

   

  ```plaintext
  everyUserOver13()
  ```

  .

  - Return `true` if all users are 14 or older.

```dart
bool anyUserUnder18(Iterable<User> users) {
  return users.any((element) => element.age < 18);
}

bool everyUserOver13(Iterable<User> users) {
  return users.any((element) => element.age > 13);
}

class User {
  String name;
  int age;

  User(
    this.name,
    this.age,
  );
}

```

**Quick review:**

- Although you can use `for-in` loops to check conditions, there are better ways to do that.
- The method `any()` enables you to check whether any element satisfies a condition.
- The method `every()` enables you to verify that all elements satisfy a condition.

## Filtering

The previous sections cover methods like `firstWhere()` or `singleWhere()` that can help you find an element that satisfies a certain predicate.

But what if you want to find all the elements that satisfy a certain condition? You can accomplish that using the `where()` method.

```dart
var evenNumbers = numbers.where((number) => number.isEven);
```

In this example, `numbers` contains an `Iterable` with multiple `int` values, and `where()` finds all the numbers that are even.

The output of `where()` is another `Iterable`, and you can use it as such to iterate over it or apply other `Iterable` methods. In the next example, the output of `where()` is used directly inside the `for-in` loop.

```dart
var evenNumbers = numbers.where((number) => number.isEven);
for (var number in evenNumbers) {
  print('$number is even');
}
```

### Example: Using where()

Run this example to see how `where()` can be used together with other methods like `any()`.

```dart
main() {
  var evenNumbers = [1, -2, 3, 42].where((number) => number.isEven);

  for (var number in evenNumbers) {
    print('$number is even.');
  }

  if (evenNumbers.any((number) => number.isNegative)) {
    print('evenNumbers contains negative numbers.');
  }

  // If no element satisfies the predicate, the output is empty.
  var largeNumbers = evenNumbers.where((number) => number > 1000);
  if (largeNumbers.isEmpty) {
    print('largeNumbers is empty!');
  }
}
```

In this example, `where()` is used to find all numbers that are even, then `any()` is used to check if the results contain a negative number.

Later in the example, `where()` is used again to find all numbers larger than 1000. Because there are none, the result is an empty `Iterable`.

>  **Note:** If no element satisfies the predicate in `where()`, then the method returns an empty `Iterable`. Unlike `singleWhere()` or `firstWhere()`, `where()` doesn’t throw a [StateError](https://api.dart.dev/stable/dart-core/StateError-class.html) exception.

### Example: Using takeWhile

The methods `takeWhile()` and `skipWhile()` can also help you filter elements from an `Iterable`.

Run this example to see how `takeWhile()` and `skipWhile()` can split an `Iterable` containing numbers.

```dart
main() {
  var numbers = [1, 3, -2, 0, 4, 5];

  var numbersUntilZero = numbers.takeWhile((number) => number != 0);
  print('Numbers until 0: $numbersUntilZero');

  var numbersAfterZero = numbers.skipWhile((number) => number != 0);
  print('Numbers after 0: $numbersAfterZero');
}
```

In this example, `takeWhile()` returns an `Iterable` that contains all the elements leading to the element that satisfies the predicate. On the other hand, `skipWhile()` returns an `Iterable` while skipping all the elements before the one that satisfies the predicate. Note that the element that satisfies the predicate is also included.

After running the example, change `takeWhile()` to take elements until it reaches the first negative number.

```dart
var numbersUntilNegative =
    numbers.takeWhile((number) => !number.isNegative);
```

Notice that the condition `number.isNegative` is negated with `!`.

### [   ](https://dart.dev/codelabs/iterables#exercise-filtering-elements-from-a-list)

### Exercise: Filtering elements from a list

The following exercise provides practice using the `where()` method with the class `User` from the previous exercise.

Use `where()` to implement two functions:

- Part 1: Implement

   

  ```plaintext
  filterUnder21()
  ```

  .

  - Return an `Iterable` containing all users of age 21 or more.

- Part 2: Implement

   

  ```plaintext
  findShortNamed()
  ```

  .

  - Return an `Iterable` containing all users with names of length 3 or less.



**Quick review:**

- Filter the elements of an `Iterable` with `where()`.
- The output of `where()` is another `Iterable`.
- Use `takeWhile()` and `skipWhile()` to obtain elements until or after a condition is met.
- The output of these methods can be an empty `Iterable`.



## Mapping

Mapping `Iterables` with the method `map()` enables you to apply a function over each of the elements, replacing each element with a new one.

```dart
Iterable<int> output = numbers.map((number) => number * 10);
```

```dart
void main() {
  final list = <int>[1,2,3,4,5,];
 var  output = list.map((number) => number * 10);
  print(output.runtimeType);
  print(output);
  print(output.toList());
}
```

In this example, each element of the `Iterable` numbers is multiplied by 10.

You can also use `map()` to transform an element into a different object — for example, to convert all `int` to `String`, as you can see in the following example.

```dart
Iterable<String> output = numbers.map((number) => number.toString());
```

 **Note:** `map()` returns a *lazy* `Iterable`, meaning that the supplied function is called only when the elements are iterated.



### Example: Using map to change elements

Run this example to see how to use `map()` to multiply all the elements of an `Iterable` by 2. What do you think the output will be?

```dart
main() {
  var numbersByTwo = [1, -2, 3, 42].map((number) => number * 2);
  print('Numbers: $numbersByTwo.');
}
```

**Quick review:**

- `map()` applies a function to all the elements of an `Iterable`.
- The output of `map()` is another `Iterable`.
- The function isn’t evaluated until the `Iterable` is iterated.









