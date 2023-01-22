<a name="readme-top"></a>

<br />
<div align="center">
  <img src="logo.svg" alt="Logo" width="80" height="80">

  <h3 align="center">Ahab's Phrase Frequency Counter</h3>

  <p align="center">
    A ruby script built to count the frequency of all three-word phrases in a text or group of texts.
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

## About The Project

The purpose of this app is to receive a text file (or multiple text files) as user input and return a list of the top 100 most frequent three-word phrases, as well as their counts.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

[![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)][ruby-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

### Prerequisites

Ruby 2.7.5

### Installation

_Below is an example of how you can instruct your audience on installing and setting up your app. This template doesn't rely on any external dependencies or services._

1. Clone the repo
   ```sh
   git clone https://github.com/bkiggen/top-100.git
   ```
2. Install Gems
   ```sh
   bundle install
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

### Running the app

Simply run the rake task, followed by a relative filepath to a .txt file

```sh
rake run <your-txt-file-location>
```

For example:

```sh
rake run ./spec/test_texts/moby-dick.txt
```

You can also send multiple .txt files like so:

```sh
  rake run ./spec/test_texts/moby-dick.txt ./spec/test_texts/brothers-karamazov.txt
```

Or to run the script with Standard Input, use:

```sh
  cat spec/test_texts/moby-dick.txt | rake run
```

### Testing

To run tests using RSPEC, enter the following command:

```sh
rake test
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Requirements

- [x] The program accepts a list of one _or more_ file paths (e.g. `ruby solution.rb texts/moby-dick.txt brothers-karamazov.txt ...).`
- [ ] The program _also_ accepts input via stdin (e.g. `cat texts/*.txt | java solution.java`).
- [x] The program outputs the first 100 most common three word sequences.
- [x] The program ignores punctuation, line endings, and is case insensitive
- [x] `“I love\nsandwiches.”` should be treated the same as `"(I LOVE SANDWICHES!!)"`).
- [x] Contractions shouldn't be changed into two words (eg. `can't` should not become `can t`).
- [x] Hyphens on line-endings can be treated as continuations OR punctuation.
- [x] Unicode may also be handled in any way you like (including replacing it with a space)

## Roadmap

- Dockerize script
- Improve handling of non-ASCII characters
- Output to CSV

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License

Distributed under the MIT License.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contact

Ben Kiggen - benkiggen@gmail.com

Project Link: [https://github.com/bkiggen/top-100](https://github.com/bkiggen/top-100)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

[ruby-url]: https://www.ruby-lang.org/en/

```

```
