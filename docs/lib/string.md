# String



## Methods

```
  final ironMan = 'Sony Stark';
  final spiderMan = 'Pitter Parker';
  final hulk = 'Bruce Banner';
```



------

1. ## codeUnitAt()

   >   `int codeUnitAt(int index)`
   >
   >   Returns the 16-bit UTF-16 code unit at the given [index]
   >
   >   

   ```
   print(ironMan.codeUnitAt(1));
   // 111
   ```

2. ## compareTo()

   > `int compareTo(String other)`
   >
   > Compares this string to [other].
   >
   > Returns a negative value if `this` is ordered before `other`, a positive value if `this` is ordered after `other`, or zero if `this` and `other` are equivalent.
   >
   > The ordering is the same as the ordering of the code points at the first position where the two strings differ. If one string is a prefix of the other, then the shorter string is ordered before the longer string. If the strings have exactly the same content, they are equivalent with regard to the ordering. Ordering does not check for Unicode equivalence. The comparison is case sensitive.

    

   ```
     print(ironMan.compareTo(hulk));
     print(ironMan.compareTo(ironMan));  
     // 1
     // 0
   ```

3. ## contains()

   > `bool contains(Pattern other, [int startIndex *=* 0])`
   >
   > ```
   > Returns true if this string contains a match of [other]:
   > 
   > ```
   >
   > 

   ```
   var string = 'Dart strings';
   string.contains('D');                     // true
   string.contains(new RegExp(r'[A-Z]'));    // true
   If [startIndex] is provided, this method matches only at or after that index:
   
   string.contains('X', 1);                  // false
   string.contains(new RegExp(r'[A-Z]'), 1); // false
   [startIndex] must not be negative or greater than [length].
   
   ```

   

4. 

   


