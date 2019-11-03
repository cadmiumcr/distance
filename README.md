# cadmium_string_distance

Corundum provides an implimentation of two different string distance algorithms, the [Jaro-Winkler Distance Algorithm](http://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance) and the [Levenshtein Distance Algorithm](https://en.wikipedia.org/wiki/Levenshtein_distance).
## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     cadmium_distance:
       github: cadmiumcr/distance
   ```

2. Run `shards install`

## Usage

```crystal
require "cadmium_distance"
```

#### Jaro-Winkler

The Jaro-Winkler algorithm returns a number between 0 and 1 which tells how closely two strings match (1 being perfect and 0 being not at all).

```crystal
jwd = Cadmium::Distance::JaroWinkler.new

jwd.distance("dixon","dicksonx")
# => 0.8133333333333332

jwd.distance("same","same")
# => 1

jwd.distance("not","same")
# => 0.0
```

#### Levenshtein

The Levenshtein distance algorithm returns the number of edits (insertions, modifications, or deletions) required to transform one string into another.

```crystal
Cadmium::Distance::Levenshtein.distance("doctor", "doktor")
# => 1

Cadmium::Distance::Levenshtein.distance("doctor", "doctor")
# => 0

Cadmium::Distance::Levenshtein.distance("flad", "flaten")
# => 3
```

#### Pair

Pair Distance uses arbitrary n-grams to calculate how similar one string is to another. By calculating the bi-grams for a string, the pair distance algorithm first checks how many occurrences of each bi-gram occur in both strings, then it calculates their similarity with the formula `simularity = (2 · intersections) / (s1size + s2size)`.

```crystal
Cadmium::Distance::Pair.distance("night", "nacht")
# => 0.25
```

## Contributing

1. Fork it (<https://github.com/cadmiumcr/distance/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Chris Watson](https://github.com/watzon) - creator and maintainer
