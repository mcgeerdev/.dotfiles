# Language and grammar

Adapted from the [Google developer documentation style guide](https://developers.google.com/style),
retrieved 2026-09-22. Original content © Google, licensed under
[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). Code samples are licensed under
[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0).

**Changes made:** HTML converted to Markdown; site navigation, language selector, generated
page summaries, and page footers removed; site-relative links rewritten as absolute URLs;
each page's headings demoted one level so the page nests under this file's title; multiple
pages combined into this file. The guidance text is not rewritten, summarized, or reordered,
though the HTML-to-Markdown conversion reflows line breaks and table layout. Notices
(`<aside>` elements) are rendered as blockquotes.

| Page                         | Canonical URL                                               | Upstream last updated |
| ---------------------------- | ----------------------------------------------------------- | --------------------- |
| Abbreviations                | <https://developers.google.com/style/abbreviations>         | 2025-12-01            |
| Articles (a, an, the)        | <https://developers.google.com/style/articles>              | 2025-03-21            |
| Capitalization               | <https://developers.google.com/style/capitalization>        | 2025-04-02            |
| Numbers                      | <https://developers.google.com/style/numbers>               | 2026-04-17            |
| Pluralization                | <https://developers.google.com/style/pluralization>         | 2026-01-20            |
| Possessives                  | <https://developers.google.com/style/possessives>           | 2025-12-01            |
| Prepositions                 | <https://developers.google.com/style/prepositions>          | 2024-10-15            |
| Pronouns                     | <https://developers.google.com/style/pronouns>              | 2024-10-15            |
| Sentence structure           | <https://developers.google.com/style/sentence-structure>    | 2024-10-15            |
| Paragraph structure          | <https://developers.google.com/style/paragraph-structure>   | 2024-10-15            |
| Units of measurement         | <https://developers.google.com/style/units-of-measure>      | 2026-04-17            |
| Dates and times              | <https://developers.google.com/style/dates-times>           | 2024-10-15            |
| Format phone numbers in text | <https://developers.google.com/style/phone-numbers>         | 2025-04-17            |
| Mathematical notation        | <https://developers.google.com/style/mathematical-notation> | 2026-03-03            |
| Use italics to discuss terms | <https://developers.google.com/style/italics-terms>         | 2025-05-22            |
| Product names                | <https://developers.google.com/style/product-names>         | 2025-03-21            |
| Trademarks                   | <https://developers.google.com/style/trademarks>            | 2024-10-15            |
| Filenames and file types     | <https://developers.google.com/style/filenames>             | 2025-10-14            |

---

## Abbreviations

Abbreviations include acronyms, initialisms, shortened words, and
contractions.

In most contexts, the technical distinction between acronyms and initialisms
isn't relevant; it's fine to use the word _acronym_ to refer to both.

- An acronym is formed from the first letters of words in a phrase, but is
  pronounced as if it were a word itself:
  - _NATO_ for _North Atlantic Treaty Organization_
  - _scuba_ for _self-contained underwater breathing
    apparatus_
- An initialism is also formed from the first letters of words in a phrase,
  but each letter is pronounced separately:
  - _CIA_ for _Central Intelligence Agency_
  - _FYI_ for _For Your Information_
  - _PR_ for _Public Relations_
- A shortened word is just part of a word or phrase, sometimes with a
  period at the end:
  - _Dr._ for _doctor_
  - _etc._ for _et cetera_
  - _min_ for _minutes_
  - _CA_ for _California_
- [Contractions](https://developers.google.com/style/contractions) are discussed in a
  separate page of this style guide.

### Long and short versions of a word

Some words have a long version and a short version—for example:

- _application_ and _app_
- _demonstration_ and _demo_
- _synchronize_ and _sync_

The short versions of the words are not abbreviations, and
if you use them, you don't need to put a period after them.

If you're not sure whether a word is an abbreviation or just a short version
of a longer word, look in our list of [resources](https://developers.google.com/style#editorial-resources).
If that doesn't settle the issue, use the speaking test: if you speak the short
version as a word (_This is a demo version of the product_), you can usually
treat it as a word and not an abbreviation.

### When to use abbreviations

Abbreviations are intended to save the writer and the reader time. If the reader has to
think about an abbreviation, it can slow down their reading comprehension.

#### General dos and don'ts

- Use standard acronyms and initialisms that will save the reader time.
- Spell out abbreviations on first reference. For more information,
  see [When to spell out a term](https://developers.google.com/style/abbreviations#spelling-out).
- Avoid using abbreviations for terms that aren't related to the main topic of the document.

In the following examples, the main topic of the document is the internet of things, so _low Earth orbit_ should not be abbreviated.

Recommended: The internet of things (IoT)
service can even be used for connecting to sensors in low Earth orbit.

Not recommended: The IoT (internet of things)
service can even be used for connecting to sensors in LEO (low Earth orbit).

- Be wary of using specialized abbreviations that your readers might not understand. For more information about when to use such language, see [Jargon](https://developers.google.com/style/jargon).

### When to spell out a term

In general, when an abbreviation is likely to be unfamiliar to the audience, spell it out upon
first mention and include the abbreviation in parentheses immediately following.

Recommended: _Border Gateway Protocol_ (_BGP_)

For all
subsequent mentions of the abbreviation, use the abbreviation by itself. If you use an abbreviation
only once, include it only if you think the abbreviation is as commonly used as the spelled-out
term. Otherwise, don't include the abbreviation.

If the first mention of
a term occurs in a [heading or title](https://developers.google.com/style/headings), you can use the abbreviation and
then spell out the abbreviation in the first paragraph that follows the heading or title.

When deciding to spell out a term, consider your audience. If your document is going to be
translated, spelling out a term can provide important context for both human and machine translation.
It can also be helpful for readers who aren't as familiar with English. If the
majority of your audience is likely to recognize and understand the term, then you don't need to
spell it out. For example, if you're writing documentation for developers that references an API,
you don't need to spell out _application programming interface_. However, if you're explaining
the general concept of an API to someone with no programming experience, spelling out the
abbreviation can be helpful.

In some cases, spelling out a term doesn't help the reader
understand the term. For example, writing out _portable document format_ doesn't help the
reader understand what a _PDF_ document is. In those cases, don't spell out the term.

The following abbreviations rarely need to be spelled out:

- AI
- API
- DVD
- File formats such as PDF or XML
- HTML
- PC
- RAM
- REST
- [Units of measurement](https://developers.google.com/style/units-of-measure#byte-units) such as
  MB, MiB, GB, or GiB
- URL
- USB

#### Format abbreviation introductions

When you spell out a term and include its abbreviation in parentheses, do the following:

- Italicize both the spelled-out term and its abbreviation.

In the following examples, the only difference is the italicization of _BGP_:

Recommended: Establish _Border Gateway Protocol_ (_BGP_) sessions using a router on the peer network.

Not recommended: Establish _Border Gateway Protocol_ (BGP) sessions using a router on the peer network.

- Capitalize the spelled-out version of the abbreviation only if the long form is a proper noun or is conventionally capitalized.

That is, don't capitalize the term only because the abbreviation includes capital letters.

Recommended: data manipulation language (DML)

Not recommended: Data Manipulation Language (DML)

- Include the abbreviation in [link text](https://developers.google.com/style/cross-references#abbreviations).

### Abbreviations not to use

Don't use _i.e._ or _e.g._; instead, use _that is_ or _for example_, respectively. For more information, see [e.g.](https://developers.google.com/style/word-list#eg) and [i.e.](https://developers.google.com/style/word-list#ie)

It's [okay to use _etc._ in some circumstances](https://developers.google.com/style/word-list#etc), but it's best to use different phrasing in most lists.
For more information, see [Comma-separated lists](https://developers.google.com/style/lists#comma-separated-lists).

Don't use internet slang abbreviations such as [_tl;dr_](https://developers.google.com/style/word-list#tldr), [_ymmv_](https://developers.google.com/style/word-list#ymmv), [_RTFM_](https://developers.google.com/style/word-list#rtfm), or others. Write out what you
mean in a non-figurative way.

Use the most common form of a word. If the spelled-out word is common
and easily understandable, use that rather than abbreviating. For example, write _approximately_ instead of _approx._

Spell out shortened words or common symbols that are substitutions for words.

Recommended: Updating the software made
throughput 10 times faster.

Not recommended: Updating the software made
throughput 10x faster.

### Periods with abbreviations

Follow these guidelines:

- Don't use periods with acronyms or initialisms.
- Put a period at the end of a shortened word, except for
  [date and time](https://developers.google.com/style/dates) abbreviations.
- If you write or say an abbreviation as a word (for example, _app_ or
  _sync_), don't put a period after it.
- Don't use a period with an abbreviation for the name of a country, US
  state, or the District of Columbia (DC).

### Plural abbreviations

For guidance about how to make abbreviations plural, see [Pluralization](https://developers.google.com/style/pluralization#making-abbreviations-plural).

### Abbreviations as verbs

Don't use acronyms, initialisms, or shortened words as verbs.

Recommended: Use SSH to
log in to your remote shell.

Not recommended: Then ssh
into your remote shell.

### Indefinite articles before abbreviations

Whether to use _a_ or _an_ before a term depends on the pronunciation of the term:
use _a_ before any consonant sound and _an_ before any vowel sound. Pronunciation of
abbreviations can vary, so in general, base your decision on the pronunciation that's most common
for your audience.

In particular, our word list includes preferences for
"[a SQL](https://developers.google.com/style/word-list#sql)", "[a FHIR](https://developers.google.com/style/word-list#fhir)",
and "[an SAP](https://developers.google.com/style/word-list#sap)".

For more information about articles, see [Articles](https://developers.google.com/style/articles).

_Source: <https://developers.google.com/style/abbreviations>_

---

## Articles (a, an, the)

For ease of comprehension and translation, include definite and indefinite
articles (_a_, _an_, and _the_) in your writing. Don't skip
articles for brevity, including in headings and titles.

Recommended: Create a VM instance

Not recommended: Create VM instance

For more information about using standard English word order and about writing
for a global audience in general, see [Write for a global audience](https://developers.google.com/style/translation).

For more information about writing clear headings and titles, see [Headings and titles](https://developers.google.com/style/headings).

For information about using articles before product names, see [Articles before product names](https://developers.google.com/style/product-names#the-with-names).

For information about using _a_ or _an_ before an abbreviation when the pronunciation
of the abbreviation can vary, see [Indefinite articles before abbreviations](https://developers.google.com/style/abbreviations#articles).

_Source: <https://developers.google.com/style/articles>_

---

## Capitalization

Follow the standard [capitalization rules](https://owl.purdue.edu/owl/general_writing/mechanics/help_with_capitals.html) for American English. Additionally,
do the following:

- Don't use unnecessary capitalization; before you capitalize a word, think
  about why (and whether) it should be capitalized.
- Don't rely on a difference in capitalization to convey meaning. For example,
  although people who are familiar with Kubernetes probably understand that a
  capitalized _Pod_ is a Kubernetes unit, and a lowercase _pod_ is
  any other kind of pod, that distinction is likely lost on many casual
  readers or those who are new to the domain.
- Don't use all-uppercase, except in the following contexts: in official
  names, in [abbreviations](https://developers.google.com/style/abbreviations) that are always
  written in all-caps, or when referring to code that uses all-caps.
- Don't use [camel case](https://en.wikipedia.org/wiki/Camel_case), except in official names or when referring to code that uses camel
  case.

For information about how to capitalize specific words, see the [word list](https://developers.google.com/style/word-list).

### Capitalize product names

For information about how to capitalize product names, see [Product names](https://developers.google.com/style/product-names).

### Capitalization in titles and headings

In [document titles and headings](https://developers.google.com/style/headings), use sentence case. That is,
capitalize only the first word in the title, the first word in a subheading after a colon, and any
proper nouns or other terms that are always capitalized a certain way.

Even though you're using sentence case, don't put a period at the end of a title or
heading.

#### Capitalization in references to titles and headings

In references to any title or heading from a document that follows this guide, use sentence case
even if the title or heading itself uses title case. That way, when the title or heading is
eventually updated to sentence case, the reference will match.

When you reference the title of any work or source that doesn't follow this guide, retain the
original capitalization.

For more information about internal and external references, see [Cross-references and linking](https://developers.google.com/style/cross-references).

For more information about formatting references to third-party sources,
see [HTML and semantic tagging](https://developers.google.com/style/semantic-tagging).

### Capitalization and colons

Use a lowercase letter to begin the first word of the text immediately
following a colon, unless the text is one of the following:

- A proper noun (_Open source software: Hadoop_)
- A heading; see also [Capitalization in titles and headings](#capitalization-in-titles-and-headings)
- A quotation (_Arthurian wit: "Bring me yon sworde"_)
- Text that follows a label such as _Caution_ or _Note_

### Capitalization and figures

Use sentence case for captions. Use sentence case for labels, callouts, and
other text in images and diagrams.

### Capitalization in glossaries and indexes

Use lowercase for glossary and index terms unless the term is a proper noun
or has another reason to require capitalization.

Use sentence case for glossary definitions.

### Capitalization and hyphenated words

When a hyphenated word is the first word in a sentence or in a heading,
capitalize only the first element in the word, unless a subsequent element is a
proper noun or proper adjective.

### Capitalization in lists

Use sentence case for items in all types of lists. For more information, see [Capitalization and end punctuation](https://developers.google.com/style/lists#capitalization-and-end-punctuation).

### Capitalization for tables in text

Use sentence case for all the elements in a table: contents, headings,
labels, and captions.

### Special capitalization style names

Don't use a casing style name, such as _camel case_ or _snake case_, to describe a
casing style. These names don't localize well and they aren't standardized. Instead, explain what
the requirements are and provide an example.

Recommended: Enter the value for the `attribute` field in the format where there are no spaces between words and the
first letter of each word is capitalized—for example, `AssertionAccount`.

_Source: <https://developers.google.com/style/capitalization>_

---

## Numbers

> For information about formatting quantities like 10 MB, see
> [Units of measurement](https://developers.google.com/style/units-of-measure).

### Ordinal numbers

Spell out all ordinal numbers in text.

Recommended: first, fifth, twelfth,
forty-third

Not recommended: 1st, 5th, 12th, 43rd

### Numbers as words

This section covers when to spell out numbers as words.

If it's important to have the number and associated noun together on the same line, use
a nonbreaking space between the number and the noun.

In general, spell out the following:

- Numbers from zero through nine, except as noted in [Numbers as numerals](#numbers-as-numerals).

  Recommended:
  two-day total

  Recommended: four options

  Recommended: five minutes

  Recommended: nine developers

- A number that starts a sentence.

  Recommended: Fifteen
  directories are created.

  In some cases it's better to rearrange the sentence so that the number
  appears later.

  Recommended: In
  general, avoid sending files larger than 164 MB as attachments.

  Not recommended: 164 MB
  is generally considered too large a file to send as an attachment.

  **Exception**: It's okay, but non-optimal, to begin a
  sentence with a four-digit year.

- A number that is followed by a numeral.

  Recommended: This
  procedure creates fifteen 100,000-byte files.

  _But_

  Recommended: This
  procedure creates 15 of the 100,000-byte files.

- Indefinite and casual numbers.

  Using words like _millions_ or _billions_ is fine for approximate numbers. For
  precise numbers, use numerals.

  Recommended: You
  can specify thousands of combinations.

  Recommended: The
  API might return a list of a million songs.

### Numbers as numerals

This section covers when to use numerals to write numbers.

If it's important to have the number and associated noun together on the same line, use
a nonbreaking space between the number and the noun.

In general, use numerals for the following:

- Numbers 10 and greater.

  Recommended: The link expires in 24
  hours.

  Recommended: 18 years old

  Recommended: 27 minutes

  Recommended: 728 shipments

  Recommended: 18,000,000 users

  Recommended: 10 chapters

  Recommended: 102 degrees

  **Exceptions**: Always use numerals for the following items, even if
  they're less than 10:

  - Version numbers. Recommended:
    version 3

  - Technical quantities, such as amounts of memory, amounts of disk
    space, numbers of queries, or usage limits.

    Recommended: 6 queries per second

    Recommended: 50 Mbps

    Recommended: 128 bits

  - Page numbers.

  - Chapter numbers, sections, pages, and so on.

  - Step numbers. Avoid referring to step numbers whenever possible,
    but in edge cases where you have no choice or it makes the most sense,
    use the numeral.

  - Prices.

  - Numbers without units, such as numbers used in mathematical
    expressions.

  - Numbers less than 10 when they appear in the same sentence with
    numbers greater than 9.

    Recommended: The
    menu contains 15 options but 6 of them are deselected.

- Negative numbers.

- Most [fractions](#fractions).

- [Percentages](#percentages).

- [Dimensions](#dimensions).

- Numbers containing decimal points. * Treat decimal numbers as plural even when less than or equal to 1.0.

  Recommended: 1.0 inches

  - For decimal numbers less than one, place a zero in front of the decimal point.

    Recommended: 0.3 inches

- Measurements.

  Recommended: 8 pixels

- [Numbers in a range](#ranges-of-numbers).

### Numbers as Roman numerals

In general, avoid using Roman numerals when possible. Instead, use Arabic numerals because they
are easier to scan.

You can use Roman numerals for [sub-steps in numbered procedures](https://developers.google.com/style/procedures#sub-steps-in-numbered-procedures).

### Fractions

Express fractions as decimal numbers, when possible.

If you must express fractions as words, connect the numerator and
denominator with a hyphen unless one of them is already hyphenated.

Recommended: 0.75

Recommended: one and one-half

Recommended: two-fifths

Recommended: five sixty-fourths

### Percentages

In general, use numerals and the percent sign (%), without a space between them.

Recommended: 40%

**Exception**: If the percentage starts the sentence, then spell out both
the number and the word _percent_.

Recommended: Forty
percent of the files

### Ranges of numbers

Use a hyphen with no space on either side of it. Do not use an
en dash (`&ndash;`).

Recommended:
2012-2016

For more information, see the following:

- [Ranges of numbers with units](https://developers.google.com/style/units-of-measure#ranges)
- [Range of numbers](https://developers.google.com/style/hyphens#number-range)

### Suspended hyphens

When two or more hyphenated compounds that start with numbers modify the same
word, use [suspended hyphens](https://developers.google.com/style/hyphens#suspended-hyphens).

Recommended: You can set up the system to
scan for new files at one-, two-, or three-hour intervals.

### Currency

Make sure that it's clear what country's currency you are describing. For more information, see
the [currency](https://developers.google.com/style/units-of-measure#currency) section in Units of measurement.

For US dollars, use a comma to delineate the thousands place of whole
currency. Use a period to delineate whole currency and fractions of currency.
Always include the dollar sign ($) at the beginning of the currency. Do
not use any punctuation or spaces to the right of the decimal.

Recommended: The price is $0.006653 per
vCPU hour.

Not recommended: The price is $0.006,653
per vCPU hour.

Recommended: $10,000 in fees is out of
reach for many developers.

Not recommended: $10 000 in fees is out
of reach for many developers.

### Commas and decimal points in numbers

Use commas and decimal points in accordance with standard American number-formatting.

Specifically: in numbers four or more digits long, use commas to set off
groups of three digits, counting leftward from the decimal point, in the
standard American style. For long decimal numbers, do not use any digit-group separators to the
right of the decimal point.

> **Note**: Even though the
> [International System of Units](https://www.nist.gov/pml/weights-and-measures/metric-si/si-units)
> (SI) uses a thin space as a digit group separator, we use a comma, which is the most common digit
> group separator used in the US.

Use a period for a decimal point, also in the standard American style.

| Recommended                            | Not recommended                       |
| -------------------------------------- | ------------------------------------- |
| The limit is 1,532,784 bytes per day.  | The limit is 1532784 bytes per day.   |
| The API supports up to 2,000 vertices. | The API supports up to 2000 vertices. |
| $0.031611/vCPU hour                    | $0.031 611/vCPU hour                  |

> **Note**: Even though in some scientific writing, four-digit numbers don't use commas, our style
> is to use a comma for a four-digit number.

For more information about decimal points and digit group separators, see Wikipedia's [decimal mark](http://wikipedia.org/wiki/Decimal_mark) entry.

### Dimensions

Use numerals for dimensions.

Use a lowercase _x_ between the numerals in the dimensions, with no space between
the numerals and the _x_.

Recommended: 192x192

Not recommended: 192 x 192

### Exponents

Use [standard mathematical notation](https://wikipedia.org/wiki/Exponentiation).
Don't put a space between the base and the exponent.

Recommended: 23

### Accompany numerical concepts with real-world practical implications

Accompany numerical concepts with real-world practical implications to provide tangible meaning.
For example, if using a feature incurs additional fees, add a link to pricing calculator.

### Mathematical notation and visuals

For general guidance on formatting mathematical notation, such as equations and variables, see [Mathematical notation](https://developers.google.com/style/mathematical-notation).

_Source: <https://developers.google.com/style/numbers>_

---

## Pluralization

In general, follow the standard rules for pluralization in US English and use the regular
plural form of a word in most cases. Avoid using _'s_ to form a plural to avoid confusing
a plural with a possessive or contraction.

For more information, see [Contractions](https://developers.google.com/style/contractions) and [Possessives](https://developers.google.com/style/possessives).

### Singular and plural

For sentences with long or complex subjects, make sure to use either a plural or singular
appropriately.

Recommended: Confirm that the number of
entries listed in the directory is accurate.

Recommended: The workloads with the `app: backend` label represent the traffic source.

Not recommended: The efficiency of
algorithms that process data sets depend on memory allocation.

For sentences with more than one subject being connected by _and_ or _or_, make sure
to use either a plural and singular appropriately.

Recommended: The request payload and
header information are logged for debugging.

Recommended: Either the API keys or
service account wasn't authenticated.

Not recommended: User authentication and
authorization is processed and handled by the security module.

For consistent style, use a plural after _one or more_, not a singular.

Because _one or more_ can express the possibility of one or more outcomes, it's sometimes
helpful to reword the sentence for clarity.

Recommended: If one or more tests fail, a
system warning is triggered.

Recommended: If any one test fails, a
system warning is triggered.

See also [Plurals in parentheses](#plurals-in-parentheses).

Use a singular after _more than one_, not a plural.

Recommended: You can create more than one
instance at a time.

### Plural abbreviations

In general, treat acronyms, initialisms, and other abbreviations as regular words when making
them plural. Avoid using _'s_ to form the plural to help distinguish the plural form from the
possessive. For more information, see [Possessives](https://developers.google.com/style/possessives).

Recommended: APIs, SKEs, and IDEs

Not recommended: API's, SKE's, and
IDE's

If the acronym, initialism, or abbreviation ends in _s_, _sh_, _ch_, or _x_, then add _es_—for example, _OSes_, _DISHes_, _DCCHes_, and _BMXes_.

> **Note:** Forming a plural using _'s_ can be ambiguous or confusing to readers and might cause
> issues in translation. For more information, see
> [Write for a global audience](https://developers.google.com/style/translation).

When spelling out a term, make sure that both the spelled-out term and abbreviation match,
with both either being a plural or singular.

Recommended: virtual machines (VMs)

Not recommended: virtual machines (VM)

When using numbers with units of measure, use the singular when spelling out the unit if the
number is one. Otherwise, use the plural form for all other numbers, including zero,
decimal numbers, and numbers greater than one.

Recommended: 0 degrees

Recommended: 0.5 degrees

Recommended: 1 degree

Recommended: 15 degrees

Don't make an abbreviation plural when used as a unit with a number.

Recommended: 64 GB

Not recommended: 64 GBs

> **Note:** Sometimes it can be helpful to spell out _-bit_ or _-byte_ terms. However, in general,
> it's not necessary to spell out a unit when used in combination with a specific number.

Make sure to include a space, preferably a nonbreaking space, between the number and
abbreviation. For more information, see [Spaces in units of measurement](https://developers.google.com/style/units-of-measure#spaces-in-units-of-measurement).

For more information, see [Abbreviations](https://developers.google.com/style/abbreviations).

### Plural product and feature names

In general, don't form a plural or possessive for the trademark of a product, feature, or
company name. For more information, see [Use trademarks only as modifiers](https://developers.google.com/style/trademarks#use-trademarks-only-as-modifiers) and [Product, feature, and company names](https://developers.google.com/style/possessives#product,-feature,-and-company-names).

In general, use singular class names. Don't manually make a singular class name plural. Doing
so might cause issues in translation. Instead, add a plural noun after the class name.

Recommended: `Intent` objects
and `Activity` instances

Not recommended: `Intent`s and `Activity`s

Not recommended: `Intents` and `Activities`

For more information, see [API reference code comments](https://developers.google.com/style/api-reference-comments).

### Plurals in parentheses

Don't put optional plurals in parentheses. Instead, use either a plural or singular
construction and keep things consistent throughout your documentation. Choose what is most
appropriate for your documentation and your audience. If it's important in a specific context to
indicate both, use _one or more_.

| Recommended                                                           | Not recommended                                                    |
| --------------------------------------------------------------------- | ------------------------------------------------------------------ |
| To find your API key, visit the **Credentials** page.                 | To find your API key(s), visit the **Credentials** page.           |
| The value of the parent depends on the values of its children.        | The value of the parent depends on the value(s) of its child(ren). |
| You can use a physical linecard, which can contain one or more ports. | You can use a physical linecard, which can contain port(s).        |

### Plural pronouns

For information about plural pronouns like _we_, _you_, and _they_, see [Pronouns](https://developers.google.com/style/pronouns) and [Second person and first person](https://developers.google.com/style/person).

_Source: <https://developers.google.com/style/pluralization>_

---

## Possessives

In general, to form a possessive, follow these guidelines.

For singular nouns, including those that end in _s_, add _'s_ to the end of the word.

Recommended: Modify each vector's record.

Recommended: Raise the storage class's quota.

For plural nouns that end in _s_, add only an apostrophe to the end of the word.

Recommended: Extend the models' capabilities.

Not recommended: Extend the models's
capabilities.

For plural nouns that don't end in _s_, add _'s_ to the end of the word.

If a possessive seems awkward, rewrite the sentence to omit the possessive.

Recommended: Analyze the business data.

Not recommended: Analyze the businesses' data.

Recommended: The rule that the Federal Trade
Commission (FTC) issued.

Not recommended: The Federal Trade
Commission's (FTC's) rule.

Avoid using _'s_ to form a plural noun. For more information, see [Pluralization](https://developers.google.com/style/pluralization).

### Product, feature, and company names

When describing function or performance, don't form a possessive from a
feature name, product name, or trademark, regardless of who owns it. Instead,
use the name as a modifier or rewrite to use a word like _of_ to indicate
the relationship.

Recommended: You can use this template to
monitor Google Search performance.

Recommended: You can use this template to
monitor the performance of Google Search.

Not recommended: You can use this template to
monitor Google Search's performance.

To form the possessive of a company name, add _'s_ to the end of the name. Don't form the
possessive of a company name when using it as a trademark.

Recommended: Google's new office is
nearby.

Not recommended: The capabilities of
Google's Search are vast.

For information about using trademarks as adjectives, not nouns, see [Trademarks](https://developers.google.com/style/trademarks#use-trademarks-as-adjectives).

### Code items

Don't form the possessive of a code item. Instead, form the possessive from the noun that
follows the code item or rewrite to avoid the possessive form.

Recommended: Compare the number to the `wordCount` method's return value.

Recommended: Compare the number to the
value returned by the `wordCount` method.

Not recommended: Compare the number to `wordCount`'s return value.

For more information, see [Grammatical treatment of code elements](https://developers.google.com/style/code-in-text#grammatical-treatment-of-code-elements).

_Source: <https://developers.google.com/style/possessives>_

---

## Prepositions

There's no rule against placing a preposition at the end of a sentence.
Place the preposition where it makes the most sense and makes the sentence easiest
to read. Use prepositions as needed, even at the ends of sentences.

Recommended: For details, see the client
library documentation for the language you're interacting with.

Not recommended: For details, see the
client library documentation for the language with which you're interacting.

Include prepositions that increase clarity, omit unnecessary prepositions,
and don't clutter the sentence with too many prepositions.

Recommended: The icon for the connector
manager turns green within a few minutes, and the connector instance is
displayed shortly after.

For information about which preposition to use when referring to UI elements, see [UI elements and interaction](https://developers.google.com/style/ui-elements#prepositions).

_Source: <https://developers.google.com/style/prepositions>_

---

## Pronouns

Ensure that a pronoun clearly refers
to its antecedent (the noun that it's replacing).

### Ambiguous pronoun references

Avoid vague and confusing references between a pronoun and its antecedent.

Recommended: If you type text in the
field, the text doesn't change.

Not recommended: If you type text in the
field, it doesn't change.

Recommended: The name of the function to
execute in the given script. The name does not include parentheses or
parameters.

Not recommended: The name of the function
to execute in the given script. It does not include parentheses or
parameters.

In many cases, it's best to follow a demonstrative pronoun (like _this_ and _these_)
with a noun.

Recommended: Set this value to true.

Not recommended: Set this to true.

Recommended: These approaches are your
best options.

Not recommended: These are your best options.

### Gender-neutral pronouns

Don't use gender-specific pronouns unless the person you're referring to is
actually that gender.

In particular, don't use _he_, _him_, _his_, _she_, or _her_ as
gender-neutral pronouns, and don't use _he/she_ or _(s)he_ or other such
punctuational approaches. Instead, use the singular _they_.

Singular _they_ has been in use for a long time; for example, [Jane Austen used it](http://www.pemberley.com/janeinfo/austheir.html),
and in 2015 the Washington Post [adopted it as part of their official style](https://www.washingtonpost.com/opinions/the-post-drops-the-mike--and-the-hyphen-in-e-mail/2015/12/04/ccd6e33a-98fa-11e5-8917-653b65c809eb_story.html).

For more suggestions, see The Chicago Manual of Style, 16th edition, section 5.225,
"Nine techniques for achieving gender neutrality."

### Optional pronouns

To avoid ambiguity and clarify meaning in sentences, use optional pronouns such as _that_ and _which_.

| Recommended                                                                        | Not recommended                                                          |
| ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| Right-click the link that you want to open.                                        | Right-click the link you want to open.                                   |
| You can use other option parameters, which are described in the following section. | You can use other option parameters, described in the following section. |

For more information, see [Relative pronouns](#relative-pronouns).

### Personal pronouns

Avoid first-person pronouns (_I_, _we_, _us_, _our_, and _ours_) except
in the following contexts:

- The questions in FAQs.
- A document whose author makes comments in the first person.
- Using _we_ to refer to your organization, after using your organization's
  name. For example, "Example Pet Store recommends that you feed your aardvark
  Standardized Aardvark Treats. We cannot guarantee the happiness of your aardvark
  otherwise."

Use the second-person pronoun (_you_) whenever possible. For more information about
second person, see [Second person and first person](https://developers.google.com/style/person).

### Relative pronouns

There are several relative pronouns. This section concerns only three of
them: _that_, _which_, and _who_.

_That_ and _which_ don't mean exactly the same thing, so don't substitute one
for the other:

- _That_ introduces a restrictive clause. It isn't preceded by a comma. Recommended: The echidna that has a
  long snout is furry.

  This sentence describes a particular echidna, the one that has a long
  snout.

- _Which_ introduces a nonrestrictive clause and is preceded by a comma. Recommended: The echidna, which has a
  long snout, is furry.

  This sentence describes all echidnas, and mentions in passing that they
  all have long snouts.

For more information about restrictive and nonrestrictive clauses and whether
to use _that_ or _which_, read [what Grammar Girl has to say on the subject](https://www.quickanddirtytips.com/articles/which-versus-that/).

When you're referring to a person, you can use _who_ instead of _that_. If you're not
sure which pronoun is appropriate in your context, then it's generally OK to use _that_.

You can use _whose_ to refer to people, animals, and things. _Whose_ is the possessive
form of both _who_ and _which_.

Recommended: Examine the variables whose
values are set at compile time.

_Source: <https://developers.google.com/style/pronouns>_

---

## Sentence structure

If you want to tell the reader to do something, try to mention the circumstance, conditions, or
goal before you provide the instruction. Mentioning the circumstance first lets the reader skip
the instruction if it doesn't apply. For information about how to apply this guideline to
procedural instructions, see [Procedures](https://developers.google.com/style/procedures).

| Recommended                                                                                                             | Not recommended                                                                                                        |
| ----------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| For more information, see [link to other document].                                                                     | See [link to other document] for more information.                                                                     |
| To delete the entire document, click **Delete**.                                                                        | Click **Delete** if you want to delete the entire document.                                                            |
| If your app is located in one of the following regions, using custom domains might add noticeable latency to responses: | Using custom domains might add noticeable latency to responses if your app is located in one of the following regions: |

_Source: <https://developers.google.com/style/sentence-structure>_

---

## Paragraph structure

Break up your paragraphs to aid in the scannability of the page and to avoid
walls of text. Readers scan for information and read on different devices with
different screen sizes. Each paragraph should address a single idea in the
fewest words and in the fewest sentences possible.

Don't make sentences longer in order to limit the number of sentences in a
paragraph. Use shorter sentences and paragraphs.

A paragraph longer than 5 or 6 sentences is often an indication that the
paragraph is trying to convey too much information. If so, break the paragraph
into smaller paragraphs or remove some content. However, don't break paragraphs
up if they contain a single idea. It's OK to have a paragraph with one sentence,
and it can be OK if it's longer than 6 sentences as long as it's still about one
idea.

### Put critical information first

Similarly to putting the most important information first in a sentence, put
the most important information first in a paragraph. Don't hide the key point of
a paragraph at the end of the paragraph. Readers don't read every word.

### Format paragraphs

Left-align text for readability. Don't center, full-justify, or right-align
text.

Don't force line breaks (hard returns) within sentences and paragraphs. Line
breaks might not work well in resized windows, across different devices, or with
enlarged text.

_Source: <https://developers.google.com/style/paragraph-structure>_

---

## Units of measurement

Put a nonbreaking space (`&nbsp;`) between the number and the unit.

### Spaces in units of measurement

For most units of measurement, when you specify a number with the unit, use a
nonbreaking space between the number and the unit. This guidance applies in both
HTML and Markdown.

For guidance about when to spell out units, see the [Abbreviations](https://developers.google.com/style/abbreviations#spelling-out) page.

For guidance about whether to hyphenate, see the [Hyphens](https://developers.google.com/style/hyphens#compounds) page.

Recommended: `64&nbsp;GB` (64 GB)

Recommended: `25&nbsp;mm` (25 mm)

Recommended: a 128-bit system

Not recommended: `64 GB`

Not recommended: 64GB

For more information about making abbreviations plural, see [Plural abbreviations](https://developers.google.com/style/pluralization#making-abbreviations-plural).

However, when the unit of measure is money or percent or degrees of an angle,
don't use a space. For more information, see [Currency](#currency).

Recommended: $10

Recommended: £25

Recommended: 65%

Recommended: 180°

For degrees of temperature, include a nonbreaking space between the number and the degree symbol.
Don't use a space between the degree symbol (`&deg;`) and the temperature scale
(_F_ or _C_).

#### Example

50 °C

#### HTML

`50&nbsp;&deg;C`

#### Markdown

`50&nbsp;&deg;C`

For Kelvin temperatures, leave out the degree symbol but use a nonbreaking space before the _K_.

#### Example

300 K

#### HTML

`300&nbsp;K`

#### Markdown

`300&nbsp;K`

When a number and unit of measurement combine to modify a noun, don't hyphenate unless
the hyphen is needed for clarity.

Recommended: `200&nbsp;GB disk` (200 GB disk)

### Ranges of numbers with units

In a range of numbers, repeat the unit for each number. _Unit_ includes both symbols (like
the degree symbol (º)) and abbreviations (like _MB_ for megabytes) but not nouns
(like _file_). For more information, see [Range of numbers](https://developers.google.com/style/hyphens#number-range).

Use the word _to_ between the numbers, rather than a hyphen. A hyphen
can be misinterpreted as a subtraction sign.

Recommended: -40 °C to 85 °C

Not recommended: -40-85 °C

### Hyphens with multiplied units

When the components of a unit of measurement are multiplied by each other,
hyphenate them.

Recommended: 5 vCPU-hours

Recommended: 40 person-hours

### Use _k_ to indicate thousands

In some contexts, it might be appropriate to indicate thousands of something by
following a number with a lowercase _k_. If you do that, then follow these
guidelines:

- Don't put a space between the number and _k_.
- Add a noun to indicate what the number measures, and to make clear that
  you're not using _k_ as an abbreviation for _kilobytes_.

Recommended: On this plan, you are
limited to 55k download operations and 20k upload operations per day.

### Currency

If you're writing about monetary amounts, make sure that the reader knows what
currency you're referring to. For example, the dollar sign—the _$_ symbol—can refer to US dollars, Canadian dollars, Mexican pesos, and several
other currencies.

If there's any possibility of ambiguity, use a currency indicator before
the amount. For details, see section 9.20 and following in the Chicago
Manual of Style, 17th edition.

Recommended: US$10

### Rates

Use _per_ instead of the division slash (/) when space permits.
It's OK to use the division slash when space is limited,
such as in a table with small cells.

Shorten _per_ to _p_ only for well-established abbreviations for
rate units, such as _Gbps_ for _gigabits per second_ or _MBps_ for _megabytes per second_.

Recommended: requests per day

Not recommended: requests/day

Recommended: Gbps

Not recommended: Gb/s

### Decimal and binary units

Use the same system to measure bytes as the technology that you're documenting.
Don't use _MB_ if you mean _MiB_, or _GB_ if you mean _GiB_. The following
table lists common types of [decimal and binary units](https://en.wikipedia.org/wiki/Byte#Multiple-byte_units):

| Decimal units                 | Binary units                   |
| ----------------------------- | ------------------------------ |
| kB (kilobyte, or 1000 bytes)  | KiB (kibibyte, or 1024 bytes)  |
| MB (megabyte, or 10002 bytes) | MiB (mebibyte, or 10242 bytes) |
| GB (gigabyte, or 10003 bytes) | GiB (gibibyte, or 10243 bytes) |

For more information about abbreviating measurement terms, see [When to spell out a term](https://developers.google.com/style/abbreviations#spelling-out).

### More resources

- [Mathematical notation](https://developers.google.com/style/mathematical-notation)
- [Numbers](https://developers.google.com/style/numbers)

_Source: <https://developers.google.com/style/units-of-measure>_

---

## Dates and times

Expressing dates and times in a clear and unambiguous way helps support [writing for a global audience](https://developers.google.com/style/translation) and reduces
confusion.

### Express times

In general, use the following guidelines to format expressions of time:

- Use the 12-hour clock, except if required to use a 24-hour time, such as
  when documenting features that use 24-hour time. If the UI, a command, or a code sample uses the
  24-hour format, use that format throughout the page for consistency.

- Use exact times when possible, but _noon_ and _midnight_ are OK.

- Use hyphens in time ranges. Don't add spaces before or after the hyphens.

  Recommended: 5-10 minutes ago.

- Capitalize AM and PM, and leave one space between it and the time.

  Recommended: 3:45 PM.

- Remove the minutes from round hours.

  Recommended: 3 PM.

#### Express time zones

Avoid using time zones unless absolutely necessary. In cases where you need to use a time
zone—such as describing real events at real times—use the following guidelines:

- Let the reader know if the time is local to their time—for example, _10 AM your local
  time_.
- If a time zone is necessary, use the timestamp format as seen in the user interface (if
  available).
- If using a specific time zone, spell out the region and include the
  [UTC or GMT label](https://www.worldtimeserver.com/learn/utc-vs-gmt/) as a parenthetical. For example:
  - US and Canadian Pacific Standard Time (UTC-8)
  - US and Canadian Pacific Daylight Time (UTC-7)
- Don't abbreviate the name of the time zone.
- In the rare event where the time of an event doesn't change for daylight saving time, use the
  specific time zone, without reference to UTC.

### Express dates

In general, spell out the names of months and days of the week in full. Give
the full four-digit year, not a two-digit abbreviation.

Recommended: January 19, 2017

If including the day of the week, add it before the month as follows: `*DAY_OF_WEEK*`, `*MONTH*` `*DAY*`, `*YEAR*`.

Recommended: Tuesday, April 27, 2021

#### Partial dates and abbreviations

When giving only the month and year, don't use a comma.

Recommended: She was hired in January 2017.

In most cases, don't abbreviate the day of the week or the month. However,
when conserving space, such as in a heading or table, it's okay to abbreviate
the month and the day of the week to their three-letter abbreviations.
Capitalize the first letter and do not add a period at the end of the abbreviation.

If you abbreviate, do so for the entire date. Don't mix written-out forms with
abbreviated forms in the same date.

Be consistent in where you apply abbreviations throughout your documentation. For
example, if you choose to abbreviate in table cells, do so in all table cells.

Recommended: Mon, Sep 3, 2018

Not recommended: Mon, September 3, 2018

#### Dates in the middle of a sentence

When a `*MONTH*` `*DAY*`, `*YEAR*` date appears in the middle of a sentence, add a comma after the year.

Recommended: The January 19, 2017,
release of ...

However, if the date in the middle of the sentence consists of the
month and year only, don't use a comma.

Recommended: The January 2017 release
of ...

#### Why we prefer dates written out

In general, don't express months as numbers unless you don't have the option
(in which case, see [numeric-only date format](#numeric-only-date-format)). Different regions of the world put parts of the date in a different
order for numeric dates. For example, a date written as 04/05/09 means different
things in different regions:

- In the UK, 04/05/09 means May 4, 2009, where the order is usually day,
  month, and then year.
- In the US, 04/05/09 means April 5, 2009, where the order is usually month,
  day, and then year.
- In some other parts of the world, 04/05/09 means May 9, 2004. Some
  regions write the year first, followed by the month and day.

For this reason, we recommend always using words to express dates. Expressing
dates in numbers only (using slashes, periods, or hyphens as separators) can be
confusing.

Recommended: February 12, 2017

Recommended: Sunday, February 12, 2017

Not recommended: 02.12.2017

Not recommended: 12/02/2017

#### Numeric-only date format

If you must express a date in numerical date format, use the format `*YYYY-MM-DD*`, and separate the elements by using hyphens. This conforms
to [ISO 8601 international standards](https://wikipedia.org/wiki/ISO_8601) for numerical date format.

Additionally, if you have a choice of what date to write (such as in a
fictional example), then choose a calendar day greater than 12 to differentiate
it from the month.

Recommended: 2017-04-15

Not recommended: 04/06/2017

#### Express dates and times together

If you must express a date and a time together, then mention the date first and then the time.

Recommended: 2017-04-15 at 3 PM

Recommended: May 4, 2009, at 6 PM

### Express divisions of the year

Avoid referring to seasons. Spring in the northern hemisphere is fall (autumn) in the
southern hemisphere. Instead, use the month, quarter, or temperature (if relevant).

| Recommended                                                                | Not recommended                                                            |
| -------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| During warmer months, data centers face a higher risk of cooling failures. | During summer months, data centers face a higher risk of cooling failures. |
| In November and December, data centers experience higher traffic volume.   | In winter, data centers experience higher traffic volume.                  |
| Changes are released in October of each year.                              | Changes are released in the Fall of each year.                             |

_Source: <https://developers.google.com/style/dates-times>_

---

## Format phone numbers in text

This page describes how to use and format phone numbers in technical documentation. This page
doesn't provide guidance on how to enter or use phone numbers in Google or third-party products.
If you need information about entering phone numbers in a specific product, consult the
product documentation or contact product support.

### Use example phone numbers

Most phone numbers in our documentation are examples. To show an example phone number, use a US
number in the range 800‑555‑0100 through 800‑555‑0199. That range is
reserved for use in examples and in fiction.

Never use a real phone number in examples.

### Format phone numbers in HTML or Markdown

To ensure that a phone number is displayed on the same line, use a nonbreaking hyphen
(`&#8209;`) where appropriate in HTML or Markdown.

#### Example

415‑555‑0132

#### HTML

`415&#8209;555&#8209;0132`

#### Markdown

`415&#8209;555&#8209;0132`

### Format North American phone numbers

To format a real phone number in the US, Canada, and other [NANP](https://wikipedia.org/wiki/North_American_Numbering_Plan) (North American Numbering Plan) countries, use a nonbreaking hyphen to separate the area code,
three-digit exchange code, and four-digit number.

Recommended: 415‑555‑0132

### Format international phone numbers

To format a real phone number in non-NANP countries, include the country and area
codes. Insert a plus sign
immediately before the country code (no space); the plus sign stands in for a
prefix known as an _exit code_, which lets you dial out of a country. Each
country has a different exit code.

For more information, see the [ITU document about standardized formatting for phone numbers](https://www.itu.int/rec/T-REC-E.123-200102-I/en).

Recommended: +1‑415‑555‑0132

### Format phone numbers that include an extension

To specify a phone extension, follow the phone number with the word _extension_, and then
specify the extension number.

Recommended: 415‑555‑0132, extension 987

_Source: <https://developers.google.com/style/phone-numbers>_

---

## Mathematical notation

This page describes how to format common mathematical notation such as
exponents, expressions, equations, operators, and variables in
documentation. Formatting best practices can help ensure that your
documentation is compatible with assistive technologies and
renders accurately.

For general information about using and formatting numbers, see [Numbers](https://developers.google.com/style/numbers).

**Note:** This page includes examples of formatting in HTML
and Markdown in standard text. If you're using a third-party tool to display
complex math, follow that tool's formatting guidance to ensure that your
mathematical markup displays correct.

### Use HTML entities for mathematical symbols

In general, use HTML entities for mathematical symbols instead of keyboard
symbols. The following table lists entities for symbols that are common in
arithmetic and algebra. For the plus sign (`+`), equals sign
(`=`), and division sign (`/`), you can use
their keyboard equivalents.

| Symbol | Markup                   | Description                                                                                                                                                                                                                                                                                                                                                           |
| ------ | ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| +      | Use the keyboard symbol. | Plus sign                                                                                                                                                                                                                                                                                                                                                             |
| −      | `&minus;`                | Minus sign                                                                                                                                                                                                                                                                                                                                                            |
| ×      | `&times;`                | Multiplication sign Alternatively, you can use the dot operator `∙` (`&#8729;`) or asterisk operator `*` (`&#42;`) to match the UI. Don't use an asterisk (`*`) to indicate multiplication in text. You can indicate multiplication by omitting the multiplication symbol if doing so doesn't create ambiguity—for example, instead of _a_ × _b_, you can write _ab_. |
| /      | Use the keyboard symbol. | Division sign                                                                                                                                                                                                                                                                                                                                                         |
| =      | Use the keyboard symbol. | Equals sign                                                                                                                                                                                                                                                                                                                                                           |
| ≠      | `&ne;`                   | Not equal to                                                                                                                                                                                                                                                                                                                                                          |
| ±      | `&plusmn;`               | Plus-minus sign                                                                                                                                                                                                                                                                                                                                                       |
| ∓      | `&mnplus;`               | Minus-plus sign                                                                                                                                                                                                                                                                                                                                                       |
| <      | `&lt;`                   | Less than sign                                                                                                                                                                                                                                                                                                                                                        |
| >      | `&gt;`                   | Greater than sign                                                                                                                                                                                                                                                                                                                                                     |
| ≈      | `&asymp;`                | Approximately equal to                                                                                                                                                                                                                                                                                                                                                |
| ≉      | `&nap;`                  | Not approximately equal to                                                                                                                                                                                                                                                                                                                                            |
| ≅      | `&cong;`                 | Congruent to                                                                                                                                                                                                                                                                                                                                                          |
| ≤      | `&le;`                   | Less than or equal to                                                                                                                                                                                                                                                                                                                                                 |
| ≥      | `&ge;`                   | Greater than or equal to                                                                                                                                                                                                                                                                                                                                              |
| ≡      | `&equiv;`                | Identical to                                                                                                                                                                                                                                                                                                                                                          |
| ≢      | `&nequiv;`               | Not identical to                                                                                                                                                                                                                                                                                                                                                      |
| √      | `&radic;`                | Square root                                                                                                                                                                                                                                                                                                                                                           |
| ∑      | `&sum;`                  | N-ary summation                                                                                                                                                                                                                                                                                                                                                       |

### Format mathematical notation

The following sections provide formatting for common math-related notation.

#### Operators

To ensure accessibility and accurate HTML syntax, use [HTML entities](#html-entities) instead of keyboard symbols for operators. For example, use `&minus;` instead of a hyphen (`-`).

Include a non-breaking space (`&nbsp;`) on both sides
of operators within a single expression, equation, or
statement.

Don't italicize operators.

Recommended: _a_ − _b_

To render _a_ − _b_, use the following markup:

- **HTML:** `<i>a</i>&nbsp;&minus;&nbsp;<i>b</i>`
- **Markdown:** `_a_&nbsp;&minus;&nbsp;_b_`

#### Variables

Italicize variables.

Recommended: _x_ ≠ _y_

Recommended: _x\**y_

Recommended: _y\**i_

To render _x_ ≠ _y_, use the following markup:

- **HTML:** `<i>x</i>&nbsp;&ne;&nbsp;<i>y</i>`
- **Markdown:** `_x_&nbsp;&ne;&nbsp;_y_`

#### Expressions and equations

Include short expressions and equations inline with your text.

Include a non-breaking space (`&nbsp;`) between components
such as operators and variables so that the expression or equation renders on
the same line.

When an expression or equation creates an awkward line break, consider
placing it on its own line.

Recommended: The equation
that describes a linear trend line is _y_ = _a_ + _bx_.

Recommended: The equation
that describes a polynomial trend line, where the order is _o_, is the
following:
_y_ = _a_ + _b_ × _x_ + ... + _k_ × _x\**o_

To render _y_ = _a_ + _bx_, use the
following markup:

- **HTML:** `<i>y</i>&nbsp;&=&nbsp;<i>a</i>&nbsp;+&nbsp;<i>bx</i>`
- **Markdown:** `_y_&nbsp;&=&nbsp;_a_&nbsp;+&nbsp;_bx_`

#### Fractions

Express fractions as decimal numbers, when possible.

If you must express fractions as words, connect the numerator and
denominator with a hyphen unless one of them is already hyphenated.

Recommended: 0.02

Recommended: one and one-half

Recommended: three-sevenths

Recommended: three seventy-fourths

#### Exponents and subscripts

Use [standard mathematical notation](https://wikipedia.org/wiki/Exponentiation).
Don't put a space between the base and the exponent.

To render exponents, use the HTML `<sup>` tag. Don't use the
keyboard caret symbol (`^`) to indicate an exponent.

To render subscripts, use the HTML `<sub>` tag.

Recommended: 23

Recommended: _x\**y_

Recommended: _y\**i_

Not recommended: 2^3

To render 23, use the following markup in HTML and Markdown: `2<sup>3</sup>`

### Notation as words

In general, you can use mathematical notation in place of words in running
text. For example, in a sentence, you might use the statement _x_ ≠ _y_ instead of writing "_x_ is not equal to _y_." If the use of notation instead of words creates ambiguous, grammatically
incorrect, or difficult-to-read text, then use words to convey the
mathematical concept.

Recommended: Check
whether _a_ > _b_.

Recommended: The area
is calculated by multiplying the length by the width.

Not recommended: Check
whether _a_ is greater than _b_.

Not recommended: The
area is calculated by multiplying _l_ × _w_.

### Tools for complex or multiline equations

The methods described on this page that use HTML entities and tags are suitable for most common
mathematical notation. However, for more complex, multiline equations, or formulas that are
difficult to represent clearly with standard HTML, consider using [diagrams, other images](https://developers.google.com/style/images), or a dedicated math rendering tool to support comprehension. Images and diagrams
like pie charts or bar graphs, in particular, are especially helpful for comparing statistics and
illustrating percentages.

### More resources

- [Numbers](https://developers.google.com/style/numbers)
- [Units of measure](https://developers.google.com/style/units-of-measure)
- [Text-formatting summary](https://developers.google.com/style/text-formatting)

_Source: <https://developers.google.com/style/mathematical-notation>_

---

## Use italics to discuss terms

This page describes two circumstances when we italicize terms that we're
introducing or discussing.

For more information about italics and other formatting, including HTML and
Markdown formatting for italics, see [Text-formatting summary](https://developers.google.com/style/text-formatting).

### New terms

When you introduce a new term that you're defining immediately, use italics on
the first mention of the term. Don't use bold or quotation marks.

Recommended: A _Clos network_ is a kind of multistage circuit switching network.

### Words as words

When you refer to a word, phrase, or letter in reference to the word, phrase,
or letter itself (sometimes called _words as words_) use italics. Don't use bold
or quotation marks.

Recommended: Don't use _&_ (ampersand) as a conjunction. Use the word _and_ instead.

Recommended: To form a
possessive of a singular noun, add _'s_ to the end of the word.

_Source: <https://developers.google.com/style/italics-terms>_

---

## Product names

This page describes how to use product names.

### Capitalize product names

In general, Google product names are in _title case_, sometimes called _init-capped_, which means that every word is capitalized except for
prepositions like _of_ or _on_ and articles like _a_ or _the_. When you refer to a Google product, use title case except
when you're matching a UI label. For information about how to refer to UI
labels, see [UI elements and interaction](https://developers.google.com/style/ui-elements).

When you write about any product, follow the official capitalization for the
names of brands, companies, software, products, services, features, and
terms defined by companies and open source communities.

- For example, if you're using Kubernetes-related terms, then follow
  the capitalization that's shown in the Kubernetes [Concepts documentation](https://kubernetes.io/docs/concepts/).

  Recommended in a Kubernetes
  context: A Job creates one or more Pods.

  Recommended: The Cloud Scheduler
  job publishes a message to a Pub/Sub topic at one-minute intervals.

- If an official name begins with a lowercase letter, then put it in
  lowercase even at the start of a sentence. But it's better to revise
  the sentence to avoid putting a lowercase word at the start, if
  possible.

  Recommended: You can use macOS to
  run the app.

  Not recommended: macOS can run the
  app.

#### Feature names

A _feature_ is a distinctive attribute or capability of a product.
Features are usually described in terms of what they can do as part of a
product. In general, feature names are lowercase, although there are
exceptions.

When you write about a feature, don't capitalize it unless the name is
officially capitalized. If you're unsure, follow the precedent that's set
by other documents that describe the feature. As with products, match
the capitalization of a UI label if you're referring to one.

For more general information about capitalization, see [Capitalization](https://developers.google.com/style/capitalization).

### Shorten Google product names

When referring to a Google product, sometimes you might want to abbreviate
the product name. For example, when you're referring to Google
Spreadsheets, it can be awkward to refer to it as Google Spreadsheets
every time; sometimes you might want to call it Spreadsheets.

Use the full trademarked product name. Don't abbreviate product names,
except in cases where you're matching a UI label. In such cases, make it
clear that you're referring to the Google product and not some other thing
with a similar name.

Also consider whether you need to refer to a product name throughout a
document, or if you can use a more general term. For example, if you've
established that you're talking about _Anthos Service Mesh_, you can
probably frame your discussion around the concept of _a service mesh_ throughout much of the document.

### Possessives of product names

For information about forming possessives with product names, see [Product, feature, and company names](https://developers.google.com/style/possessives#product,-feature,-and-company-names).

### Articles before product names

Don't use _the_ before a product name unless you're using the name to
modify something else. _Do_ use _the_ before tool and API names.

Recommended: Using Cloud Datastore with Cloud Dataproc

Recommended: The Cloud Datastore options page

Recommended: The Google Cloud console

Recommended: The Transcoder API

Recommended: The `gcloud` CLI

Not recommended: Using the Cloud Datastore with Cloud
Dataproc

If you use a product name as a modifier with an indefinite article (_a_ or _an_), pay
close attention to which article precedes the product name.

Recommended: An Anthos Service Mesh environment

Recommended: A Service Mesh environment

For more information about using articles, see [Articles](https://developers.google.com/style/articles).

### Use "service" to refer to multiple products

It's OK to refer to Google products as services, such as _the Google Kubernetes Engine
service_ or _the Compute Engine service_. However, if the term _services_ leads to
ambiguity, use the product names.

### Don't use product names as verbs

Don't use product names or feature names as verbs.

_Source: <https://developers.google.com/style/product-names>_

---

## Trademarks

Follow any usage guidelines that trademark owners provide.

### Label trademarked terms

For trademark marking or attribution in documentation, follow any usage
guidelines provided by the owners of the respective marks.

For more about Google trademarks in particular, see [About our trademarks and how to use them](https://www.google.com/permissions/trademark/).

### Use trademarks only as modifiers

When you use a trademarked term, always use it to modify a noun, not as a noun
by itself. Don't use a trademark as a verb.

Never form a possessive or a plural from a trademark or change it in any way. For more
information, see [Possessives](https://developers.google.com/style/possessives).

Recommended: Another option is to use a Chromebook notebook computer.

Not recommended: Another option is to use a Chromebook.

Not recommended: Chromebook's features rely on an internet connection.

Not recommended: For information about Chromebook computers, google "notebook computers"

For more information about using Google trademarks, see [Rules for proper usage](https://www.google.com/permissions/trademark/rules.html).

_Source: <https://developers.google.com/style/trademarks>_

---

## Filenames and file types

### Guidelines for names

Make file and directory names lowercase, with the occasional exception for consistency, to make file searches easier and search results more useful. For example, because most Unix-style operating systems are case sensitive, they can't find a file named `Impersonate-Service-Accounts.html` if you search for `impersonate-service-accounts.html`. Linux and macOS interpret these as two distinct files.

Use hyphens, not underscores, to separate words—for example, `query-data.html`. Search engines interpret hyphens in file and directory names as spaces between words. Underscores are generally not recognized, meaning that their presence can negatively affect SEO.

Use only standard ASCII
alphanumeric characters in file and directory names.

Don't use generic page names such as `document1.html`.

#### Exceptions for consistency

If you're adding to a directory where everything else already uses
underscores, and it's not feasible to change everything to hyphens, it's okay to
use underscores to stay consistent.

For example, if the directory already has `lesson_1.jd`, `lesson_2.jd`, and `lesson_3.jd`, it's okay to add your
new file as `lesson_4.jd` instead of `lesson-4.jd`.
However, in all other situations, use hyphens.

Recommended: `avoiding-cliches.jd`

Sometimes OK: `avoiding_cliches.jd`

Not recommended: `avoidingcliches.jd`

Not recommended: `avoidingCliches.jd`

Not recommended: `avoiding-clichés.jd`

#### Other exceptions

It's okay to have some inconsistency in filenames if it can't otherwise be
avoided. For example, sometimes tools that generate reference documentation
produce filenames based on different style requirements or based on the design
and naming conventions of the product or API itself. In those cases, it's okay
to make exceptions for those files.

### Refer to files

The following sections discuss how to reference files.

#### Refer to filenames

When referring to a specific file, do the following:

- Use [code font](https://developers.google.com/style/code-in-text).
- Include the word _file_ after the filename. For more information, see
  [Grammatical treatment of code elements](https://developers.google.com/style/code-in-text#grammatical-treatment-of-code-elements).
- Use the exact spelling of the filename even if it doesn't follow
  [naming guidelines](#naming-guidelines).
- If a sample of the file is included on the page, follow the
  [code sample](https://developers.google.com/style/code-samples) guidelines and precede a code sample with an introductory sentence or paragraph that includes the
  filename.

Recommended: In the following `build.sh` file, modify the default values for all parameters:

#### Refer to file interactions

When interacting with files and file types, don't use the file types as a verb.

Recommended: Extract a zip file.

Not recommended: Unzip a zip file.

#### Refer to file types

When you're discussing a file type, use the formal name of the type, not the filename extension.
(The file type name is often in all caps because many file type names are acronyms
or initialisms.) Do not use the filename extension to refer generically to the
file type.

Recommended: a PNG file

Not recommended: a `.png` file

Recommended: a Bash file

Not recommended: an `.sh` file

The following table lists some examples of filename extensions and the
corresponding file type names to use.

| Extension       | File type name  |
| --------------- | --------------- |
| `.adoc`         | AsciiDoc file   |
| `.csv`          | CSV file        |
| `.exe`          | executable file |
| `.gif`          | GIF file        |
| `.img`          | disk image file |
| `.ipynb`        | IPYNB file      |
| `.jar`          | JAR file        |
| `.jpg`, `.jpeg` | JPEG file       |
| `.json`         | JSON file       |
| `.md`           | Markdown file   |
| `.pdf`          | PDF file        |
| `.png`          | PNG file        |
| `.ps`           | PowerShell file |
| `.py`           | Python file     |
| `.sh`           | Bash file       |
| `.sql`          | SQL file        |
| `.svg`          | SVG file        |
| `.tar`          | tar file        |
| `.tf`           | Terraform file  |
| `.tiff`         | TIFF file       |
| `.txt`          | text file       |
| `.wasm`         | Wasm file       |
| `.yaml`         | YAML file       |
| `.zip`          | zip file        |

_Source: <https://developers.google.com/style/filenames>_
