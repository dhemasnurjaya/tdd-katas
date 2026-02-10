# TDD Katas Collection

A collection of Test-Driven Development (TDD) exercises implementing classic programming katas, following Uncle Bob's Clean Code principles and Domain-Driven Design tactical patterns.

## Purpose

These katas demonstrate:

- **Test-Driven Development:** Production code written only to pass failing tests
- **Clean Code Practices:** Intent-revealing names, single responsibility, domain-focused abstractions
- **Domain-Driven Design:** Value Objects enforce domain constraints at the type level
- **The Craftsman's Way:** Quality is not a trade-off for speed; it is the only way to go fast

## Completed Katas

### 1. Roman Numerals ✅

**Implementation:** [`lib/roman_numerals.dart`](lib/roman_numerals.dart)  
**Tests:** [`test/roman_numerals_test.dart`](test/roman_numerals_test.dart)

Converts integers (1-3999) to Roman numeral notation using a table-driven greedy algorithm.

#### Domain Context

Roman numerals represent numbers using seven basic symbols with specific combination rules:

**Symbols:**
- `I` = 1, `V` = 5, `X` = 10, `L` = 50, `C` = 100, `D` = 500, `M` = 1000

**Domain Rules:**
1. **Additive Notation:** Symbols placed in descending order are summed (e.g., `VI` = 6)
2. **Subtractive Notation:** Smaller symbol before larger subtracts (e.g., `IV` = 4)
3. **Repetition Limit:** Symbols repeat maximum three times (e.g., `III` = 3, not `IIII`)
4. **Valid Range:** Classical Roman numerals represent 1-3999

**Subtractive Pairs (Domain Constraint):**
Only specific pairs use subtractive notation:
- `IV` (4), `IX` (9)
- `XL` (40), `XC` (90)
- `CD` (400), `CM` (900)

#### Key Design Decisions

**Value Object Pattern:** `RomanNumeralInput` enforces domain invariants (1-3999 range). Invalid inputs are impossible to construct.

**Table-Driven Algorithm:** The `conversionRules` table is the **domain model**—it directly represents Roman numeral encoding rules.

**Greedy Decomposition:** The algorithm mirrors how Romans actually encoded numbers: repeatedly subtract the largest applicable value.

#### Usage

```dart
import 'package:tdd_katas/roman_numerals.dart';

integerToRoman(1994); // Returns: 'MCMXCIV'
integerToRoman(0);    // Throws: ArgumentError
```

---

### 2. [Next Kata Name] 🚧

**Status:** Not yet started  
**Implementation:** `lib/[next_kata].dart`  
**Tests:** `test/[next_kata]_test.dart`

*Coming soon...*

---

### 3. [Third Kata Name] 🚧

**Status:** Not yet started  
**Implementation:** `lib/[third_kata].dart`  
**Tests:** `test/[third_kata]_test.dart`

*Coming soon...*

---

## Running Tests

```bash
# Run all tests
dart test

# Run specific test file
dart test test/roman_numerals_test.dart

# Run with coverage
dart test --coverage
```

## Development Philosophy

### The Craftsman's Standard

> "Clean code that works." — Ron Jeffries

Every kata in this collection follows:
- **Uncle Bob's Clean Code:** Intent-revealing names, functions do one thing, no comments needed
- **Kent Beck's TDD:** Red-Green-Refactor discipline, tests first
- **Eric Evans' DDD:** Domain concepts drive the model, tactical patterns enforce boundaries
- **The Boy Scout Rule:** Every commit leaves the code cleaner than before

### TDD Discipline Applied

1. **Red:** Write a failing test
2. **Green:** Write the simplest code to pass
3. **Refactor:** Clean up duplication, improve names
4. **Repeat:** Let the design emerge from tests

---

## Roman Numerals: Detailed Journey

### Test Strategy

Tests are organized by **domain concepts**, not technical structure:

**Basic Symbols:**
Tests for the seven fundamental symbols (I, V, X, L, C, D, M)

**Subtractive Notation:**
Tests for all six subtractive pairs, verifying the domain rule

**Additive Combinations:**
Tests for repeated symbols and multi-symbol sequences

**Complex Edge Cases:**
Stress tests combining multiple rules:
- `1994 → MCMXCIV` (year notation)
- `3999 → MMMCMXCIX` (maximum valid value)
- `444 → CDXLIV` (all subtractive positions)

**Constraint Validation:**
Boundary tests for the valid range (1-3999)

### Development Timeline

1. **Red:** Tests for 1-5 (basic additive, first subtractive case)
2. **Green:** Minimal implementation with conditionals
3. **Refactor:** Extract symbol mapping, clarify intent
4. **Red:** Tests for 6-10 (reveals pattern)
5. **Green:** Extend conditionals
6. **Refactor:** Recognize duplication → Table-driven approach emerges
7. **Red:** Tests for 40-1000 (remaining symbols)
8. **Green:** Extend conversion table (algorithm unchanged)
9. **Red:** Edge cases and constraint tests
10. **Green:** Add `RomanNumeralInput` Value Object
11. **Refactor:** Extract validation, organize tests by domain concept

### Key Insights

**The Algorithm Never Changed:** After the table-driven refactoring, adding 40-1000 required **zero logic modifications**. This validates the abstraction.

**Type System as Domain Enforcer:** `RomanNumeralInput` makes invalid states unrepresentable. You cannot construct a Roman numeral for 0 or 4000—the compiler prevents it.

**Tests as Living Documentation:** Test names use **ubiquitous language** from the Roman numeral domain. A domain expert could read the test file and recognize the rules they explained.

---

## References

- [Roman Numerals Rules](https://en.wikipedia.org/wiki/Roman_numerals)
- [Clean Code by Robert C. Martin](https://www.oreilly.com/library/view/clean-code-a/9780136083238/)
- [Domain-Driven Design by Eric Evans](https://www.domainlanguage.com/ddd/)
- [Test-Driven Development by Kent Beck](https://www.amazon.com/Test-Driven-Development-Kent-Beck/dp/0321146530)

## License

This is a learning exercise. Use freely for educational purposes.

---

**Following The Craftsman's Way: Quality is not negotiable.**