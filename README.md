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

### 2. Bowling Game ✅

**Implementation:** [`lib/bowling_game.dart`](lib/bowling_game.dart)  
**Tests:** [`test/bowling_game_test.dart`](test/bowling_game_test.dart)

Calculates scores for a bowling game following official scoring rules with look-ahead bonus logic for strikes and spares.

#### Domain Context

A bowling game consists of 10 frames where players roll a ball to knock down pins:

**Scoring Rules:**
1. **Normal Frame:** Sum of pins knocked down (e.g., 3 + 4 = 7)
2. **Spare (/):** All 10 pins in 2 rolls → Score = 10 + next 1 roll
3. **Strike (X):** All 10 pins in 1 roll → Score = 10 + next 2 rolls
4. **10th Frame:** Bonus rolls awarded if spare or strike achieved

#### Key Design Decisions

**State Management:** Stores all rolls in a list and calculates score by iterating through frames, not individual rolls.

**Look-Ahead Logic:** Spares and strikes require examining future rolls for bonus calculation—the algorithm walks forward strategically.

**Frame Advancement:** Strikes consume 1 roll, spares/normal frames consume 2 rolls—the algorithm tracks position correctly.

#### Usage

```dart
import 'package:tdd_katas/bowling_game.dart';

final game = BowlingGame();
game.roll(10); // Strike!
game.roll(3);
game.roll(4);
// ... continue rolling
print(game.score()); // Calculates total with bonuses
```

#### The "Aha!" Moment

Tests for simple cases (gutter game, one spare, one strike) drove an algorithm that automatically handles complex scenarios like perfect games (300 points) without explicit implementation. **This is TDD's magic—correct abstractions emerge naturally.**

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
dart test test/bowling_game_test.dart

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

## Bowling Game: Detailed Journey

### Test Strategy

Tests are organized by **scoring complexity**, mirroring how the domain rules build on each other:

**Basic Scoring:**
- Gutter game (all zeros)
- All ones (simple addition)

**Spare Bonus (next 1 roll):**
- One spare in first frame
- All spares (150 points)

**Strike Bonus (next 2 rolls):**
- One strike in first frame
- Perfect game (300 points)

**Complex Scenarios:**
- Combinations of strikes, spares, and normal frames

### Development Timeline

1. **Red:** Gutter game test
2. **Green:** Return 0 (simplest implementation)
3. **Red:** All ones test
4. **Green:** Store rolls, sum them in `score()`
5. **Refactor:** Extract `rollMany()` helper, add `setUp()`
6. **Red:** One spare test
7. **Green:** Detect spare, add look-ahead bonus (+1 roll)
8. **Refactor:** Extract `_isSpare()` helper
9. **Red:** One strike test
10. **Green:** Detect strike, add look-ahead bonus (+2 rolls)
11. **Refactor:** Extract `_isStrike()`, clean up frame advancement
12. **Validate:** Perfect game test passes without modification!

### Key Insights

**Emergent Design:** The algorithm structure wasn't planned upfront. Tests for simple cases forced:
- Frame-based iteration (not roll-based)
- Index tracking (advancing by 1 or 2)
- Look-ahead logic (accessing future rolls)

**The Perfect Game Moment:** Writing code to handle "one spare" and "one strike" automatically handled "12 consecutive strikes" (300 points). The algorithm correctly models the domain, so all valid games work.

**State vs. Behavior:** Initially tempting to model Frame objects with state. TDD revealed a simpler truth: just store rolls and calculate on-demand. No frame objects needed.

---

## Comparing the Katas

### Roman Numerals vs. Bowling Game

| Aspect | Roman Numerals | Bowling Game |
|--------|----------------|--------------|
| **Complexity** | Beginner | Intermediate |
| **State** | Stateless transformation | Stateful (rolls accumulate) |
| **Algorithm** | Table-driven lookup | Frame iteration with look-ahead |
| **Key Challenge** | Recognizing the pattern | Managing state and bonuses |
| **Design Pattern** | Value Object | Strategy-like (frame types) |
| **Lines of Code** | ~45 production | ~30 production |
| **Aha! Moment** | Table eliminates duplication | Simple tests → complex games work |

### What Each Kata Teaches

**Roman Numerals:**
- Converting domain rules into data structures
- Value Objects for enforcing constraints
- When to stop coding (algorithm emerges naturally)

**Bowling Game:**
- State management without over-engineering
- Look-ahead logic in sequential data
- How correct abstractions scale beyond test cases

### Progressive Learning Path

1. **Roman Numerals first:** Learn TDD fundamentals without state complexity
2. **Bowling Game second:** Apply TDD to stateful problems
3. **Next kata:** Choose based on what you want to practice:
   - **String Calculator:** Parsing, validation, error handling
   - **Gilded Rose:** Refactoring legacy code without tests
   - **Mars Rover:** Command pattern, multiple behaviors

---

## References

### General TDD & Clean Code
- [Clean Code by Robert C. Martin](https://www.oreilly.com/library/view/clean-code-a/9780136083238/)
- [Domain-Driven Design by Eric Evans](https://www.domainlanguage.com/ddd/)
- [Test-Driven Development by Kent Beck](https://www.amazon.com/Test-Driven-Development-Kent-Beck/dp/0321146530)

### Kata-Specific
- [Roman Numerals Rules](https://en.wikipedia.org/wiki/Roman_numerals)
- [Bowling Scoring Rules](https://en.wikipedia.org/wiki/Ten-pin_bowling#Scoring)
- [Uncle Bob's Bowling Game Kata](http://butunclebob.com/ArticleS.UncleBob.TheBowlingGameKata)

## License

This is a learning exercise. Use freely for educational purposes.

---

**Following The Craftsman's Way: Quality is not negotiable.**