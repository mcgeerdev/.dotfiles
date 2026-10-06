# Punctuation

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

| Page                              | Canonical URL                                         | Upstream last updated |
| --------------------------------- | ----------------------------------------------------- | --------------------- |
| Colons                            | <https://developers.google.com/style/colons>          | 2024-10-15            |
| Commas                            | <https://developers.google.com/style/commas>          | 2025-08-05            |
| Dashes                            | <https://developers.google.com/style/dashes>          | 2024-10-15            |
| Ellipses                          | <https://developers.google.com/style/ellipses>        | 2024-10-15            |
| Hyphens                           | <https://developers.google.com/style/hyphens>         | 2026-04-17            |
| Parentheses                       | <https://developers.google.com/style/parentheses>     | 2025-12-01            |
| Periods and other end punctuation | <https://developers.google.com/style/periods>         | 2026-01-13            |
| Quotation marks                   | <https://developers.google.com/style/quotation-marks> | 2025-05-14            |
| Semicolons                        | <https://developers.google.com/style/semicolons>      | 2024-10-15            |
| Slashes                           | <https://developers.google.com/style/slashes>         | 2024-10-15            |

---

## Colons

A colon indicates that closely-related information follows.

For information about using colons with run-in headings, see [Description lists that use run-in headings](https://developers.google.com/style/lists#description-lists-that-use-run-in-headings).

### Introductory phrase preceding colon

When a colon introduces a list, the text that precedes the colon must be able
to stand alone as a complete sentence.

Recommended: The fields are defined as
follows:

Not recommended: The fields are:

### Colons within sentences

In general, the first word in the text that follows a colon should be in
lowercase. For exceptions, see [Capitalization and colons](https://developers.google.com/style/capitalization#capitalization-and-colons).

Recommended: Tone: concise,
conversational, friendly, respectful

Recommended: When you add or update
content to an existing project, remember to take these steps: review the style
guide, use checklists, enlist a fellow writer or an editor to copyedit your
work, and request a developmental edit if you feel that it's warranted.

### See also

For more information about how to punctuate introductory material, see the
sections on [list introductions](https://developers.google.com/style/lists#intros) and [code-sample introductions](https://developers.google.com/style/code-samples#intros).

For information about when it's better to use colons than dashes, see [Dashes](https://developers.google.com/style/dashes#colons).

_Source: <https://developers.google.com/style/colons>_

---

## Commas

Use commas to separate items in a series, and use commas to separate certain kinds of
clauses.

### Serial commas

In a series of three or more items, use a comma before the final _and_ or _or_ to avoid potentially changing the meaning of the sentence. This comma is called a serial
comma or an Oxford comma.

Recommended: Locations are divided into
zones, regions, and multi-regions.

Not recommended: Locations are divided into
zones, regions and multi-regions.

### Commas after introductory words and phrases

In general, place a comma after an introductory word or phrase.

Recommended: Finally, only groups that
contain parameters appear in this list.

Recommended: Based on the requirements of
your game, you can implement this method to update game information.

### Commas separating two independent clauses

When a coordinating conjunction (_and_, _but_, _or_, _nor_, _for_, _so_, or _yet_) separates two independent
clauses, insert a comma after the first clause (before the conjunction) unless
both clauses are very short.

Recommended: The libraries make
feed creation easier, and they ensure that only valid feeds are produced.

Not recommended: The libraries make
feed creation easier and they ensure that only valid feeds are produced.

Recommended: Type your ID and click **OK**.

Not recommended: Type your ID, and click **OK**.

### Commas separating independent from dependent clauses

When an independent clause and a dependent clause are separated by a
coordinating conjunction, insert a comma _only if_ the sentence could
be misunderstood without one.

Recommended: Direct-access flags are
plain variables and can be read directly.

Not recommended: Direct-access flags are
plain variables, and can be read directly.

Recommended: The manager acknowledged the
last team member who entered the room, and started the meeting.

Not recommended: The manager acknowledged
the last team member who entered the room and started the meeting.

### Set off other kinds of clauses

It's often a good idea to set off certain kinds of clauses with a comma or
other punctuation for clarity.

A couple of specific places where commas are a good idea:

- In general, put a comma before the word _which_ at the start of a
  nonrestrictive clause. For more information about this topic, see this guide's section on [relative pronouns](https://developers.google.com/style/pronouns#relative-pronouns) and Grammar
  Girl's page on
  [_which_ versus _that_](https://www.quickanddirtytips.com/articles/which-versus-that/).
- In general, put a semicolon or a period or a dash before a conjunctive
  adverb, such as _otherwise_, _however_, or _therefore_, and put a comma after
  the conjunctive adverb.

In general, don't use a comma before the causal conjunction _because_ unless it starts a nonrestrictive clause. For more information,
see the _Chicago Manual of Style_ Q&A entry on [using commas with _because_](https://www.chicagomanualofstyle.org/qanda/data/faq/topics/Commas/faq0018.html).

| Recommended                                                                                                                            | Not recommended                                                                                                                       |
| -------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| Name of the group, which has a maximum length of 200 characters.                                                                       | Name of the group which has a maximum length of 200 characters.                                                                       |
| The variable must have a value; otherwise, the server returns an error.                                                                | The variable must have a value otherwise the server returns an error.                                                                 |
| You can use the same key name in multiple backend services and backend buckets, because each set of keys is independent of the others. | You can use the same key name in multiple backend services and backend buckets because each set of keys is independent of the others. |

### Punctuate numbers

For information about punctuating numbers, see [Commas and decimal points in numbers](https://developers.google.com/style/numbers#commas-and-decimal-points-in-numbers).

### Punctuate examples

For information about punctuating examples, see [Format examples](https://developers.google.com/style/format-examples).

_Source: <https://developers.google.com/style/commas>_

---

## Dashes

This page explains when to use em dashes. For information about hyphens, see the following:

- [Hyphens](https://developers.google.com/style/hyphens)
- [Ranges of numbers](https://developers.google.com/style/numbers#ranges-of-numbers)
- [Ranges of numbers with units](https://developers.google.com/style/units-of-measure#ranges)

### Em dashes

To indicate a break in the flow of a sentence—or an interruption—use an em
dash, also known as a long dash. Don't put a space before or after it.

You can type the em dash character in various ways:

HTML
&mdash;

macOS
Press `Option+Shift+hyphen`.

Linux desktop environment
Enable the Compose key (instructions for doing that vary depending on
your flavor of Linux—for examples, see [Linux Keyboard Shortcuts For Text Symbols](http://fsymbols.com/keyboard/linux/compose/)). After the Compose key is enabled, you can create an em dash
by typing the Compose key followed by three hyphens.

Alternatively, press `Control+Shift+U`. Let go of those keys, and then type `2014`. Then press `Return`.

> **Note**: These Linux options don't work if you're signed in to the Linux command line from a
> remote system using `ssh` or the like; you have to be in a Linux desktop environment.

Windows
Turn num lock on, and then hold down the left `Alt` key and type `0151` on the numeric keypad.

Don't use an en dash (the shorter dash) or a hyphen in place of an em dash.
The use of an en dash with spaces around it in place of
an em dash is gradually becoming more common, but it's still not very widespread
in the US in professional publishing; so far (as of early 2016), it's mostly
used in Canada and a few other places. For now, only use the em dash.

### En dashes

Don't use. Instead, use a hyphen or the word _to_. For more information, see
the following:

- [Ranges of numbers with units](https://developers.google.com/style/units-of-measure#ranges)
- [Range of numbers](https://developers.google.com/style/hyphens#number-range)

### Colons instead of dashes in description lists

Another common but nonstandard construction is to use an em dash, an en dash, or a hyphen
surrounded by spaces to separate an item and its description. Instead, use [a colon or a period](https://developers.google.com/style/lists#description-lists-that-use-run-in-headings).
For a series of items, use [an HTML description list](https://developers.google.com/style/lists#description-lists) (`<dl>`).

Recommended: Example: This is an
example.

Not recommended: Example - This is
an example.

Recommended: Appendix A: My first
appendix

Not recommended: Appendix A—My first
appendix

Recommended:

```
<dl>
  <dt>Example</dt>
  <dd>This is an example.</dd>
  <dt>Another example</dt>
  <dd>This is another example.</dd>
</dl>

```

_Source: <https://developers.google.com/style/dashes>_

---

## Ellipses

In general, don't use ellipses. An ellipsis is made up of
three contiguous periods. Ellipses indicate the omission of part of a sentence, paragraph, or larger
block of text where the omission is not pertinent to the understanding of the subject at
hand.

### Ellipses as suspension points

When ellipses are used to indicate hesitation, they are called _suspension
points_. Don't use ellipses this way in our documentation.

Not recommended: The answer is ... wait
for it ... that you shouldn't do this.

### Ellipses in a user interface

When ellipses appear in a user interface, exclude them from the
documentation describing the user interface unless their omission could cause
confusion. For example, if the text on the button in the UI reads **Save ...**,
document it as _click **Save**_.

### Ellipses in text

Don't use ellipses in your written documentation; omit any unnecessary
information and include all necessary information.

However, it's acceptable to use ellipses in quoted text (to replace a
portion of the quoted text) except when they appear at the beginning or end of
the text.

Not recommended: My high school English
teacher made me learn that Shakespeare quote about all the world being a stage
and " ... all the men and women merely players."

Not recommended: My high school English
teacher made me learn that Shakespeare quote: "All the world's a stage, And all
the men and women merely players ...."

The previous example ended with four ellipsis points. The final
ellipsis point is, in fact, a period. So when the material that you're omitting
contains one or more sentence boundaries, use four dots instead of three.

Recommended: My high school English
teacher made me learn that Shakespeare quote: "All the world's a stage, ....
And one man in his time plays many parts."

### Punctuation and spacing of ellipses

Keep all three ellipsis points together. When creating an ellipsis,
instead of the ellipsis character, use three periods in a row. Insert one space
before and after the ellipsis unless a punctuation mark immediately follows the
ellipsis; in this case, don't insert a space after the ellipsis.

Recommended: You don't need to
understand all the other Python code in there ... we'll explain it all in class.

Also recommended: You don't need to
understand all the other Python code in there ...; we'll explain it all in class.

Not recommended: You don't need to
understand all the other Python code in there...we'll explain it all in class.

_Source: <https://developers.google.com/style/ellipses>_

---

## Hyphens

Use a hyphen (-) when needed for clarity. A hyphen can separate parts of words to avoid
misreadings, and it can combine terms when they should be read as a unit.

### General guidelines

Guidance for hyphenation isn't always straightforward because it depends on
the following circumstances:

- **Location**. For example, does a term precede a noun, or does it follow a
  verb?
- **Interpretation and readability**. Is a sentence ambiguous or unclear if a term is
  not hyphenated?
- **Convention**. For some terms, our guidance tells us to always hyphenate or
  never hyphenate, even if the convention seems to contradict other guidance.

In addition, there are many exceptions to general hyphenation guidance. If you're not
sure whether to hyphenate a term, in addition to reviewing the guidelines on this page, check the
following sources (in this order):

1. The documentation that you're working with. If there's an established
   convention for hyphenating a term in a particular documentation set, follow that
   convention.
2. The [word list](https://developers.google.com/style/word-list) in this style guide.
3. The [Merriam-Webster dictionary](https://www.merriam-webster.com/).

As always, deviate from our guidance when it serves your readers. For
more information, see [Break the rules](https://developers.google.com/style#rules).

> **Note**: Don't use a hyphen (-) or a double hyphen (--) in place of a dash (—). The dash is a
> distinct punctuation mark that has different uses. For more information, see
> [Dashes](https://developers.google.com/style/dashes).

### Prefixes

In general, don't use a hyphen between a prefix and the main noun.

Recommended: _infrastructure_, _megabyte_, _metadata_, _preprocessing_, _pseudocode_, _semiconductor_

#### Exceptions

Add a hyphen after a prefix in the following circumstances:

- If the prefix is _self_ or _cross_: _self-managing_, _cross-region_
- If the noun is capitalized or is a number: _non-Google_, _post-2000_
- To avoid confusion or difficulty in reading: _de-energize_, _intra-index_, _re-mark_, _re-sign_
- If the prefix is for a term that already has hyphens or spaces: _un-Google-like_, _non-twentieth-century_
- To be consistent within a document: _pre-processing_, _post-processing_

#### The _non_ prefix

The _non_ prefix follows the same guidelines, but because it
can easily form words that are hard to parse, it's often hyphenated. Use your
best judgment, taking into account consistency within your documentation. The following
recommendations show contrasting usages that you can use as examples.

Recommended: _noncurrent_, _nonempty_, _noninteractive_, _nonpublic_

Recommended: _non-existence_, _non-integer_, _non-key_, _non-managed_, _non-negative_

When using _non_ as a prefix, add a hyphen before hyphenated compound words.

Recommended: _non-KSA-based_, _non-self-sustaining_

### Compounds

A _compound_ is a term that combines more than one word. Compounds can
be _closed_ as one word with no spaces, _open_ with spaces between
words, or hyphenated.

#### Compound nouns

In general, write compound nouns in their closed (one-word, unhyphenated)
form. If you see that [Merriam-Webster.com](https://www.merriam-webster.com/) uses the
two-word or hyphenated form, but you see that the closed form is the
predominant convention in your context or trending in that direction (as
compounds often do), then use the closed form.

Recommended: webpage

Recommended: hostname

Recommended: tradeoff

Recommended: workaround

##### Exceptions

Our [word list](https://developers.google.com/style/word-list) includes exceptions for
well-established terms that commonly use a hyphen or a space, such as _multi-region_ and _style sheet_. In some cases, we note that noun,
verb, and adjective versions of a word are treated differently.

When the components of a unit of measurement are multiplied by each other,
hyphenate them.

Recommended: 5 vCPU-hours

Recommended: 40 person-hours

#### Compound modifiers before a noun

If needed for clarity, hyphenate compound modifiers that come before a noun.
This guideline can be subjective. However, except as noted in
this section, it's almost never wrong to hyphenate a compound before a
noun to ensure clarity.

Recommended: A well-designed app

Recommended: Android-specific
techniques

Use a hyphen after _more_ or _most_ if you need to clarify what
those words modify.

Recommended: The most common scenario

Recommended: Edge locations with
more-reliable internet links

In general, avoid writing compound modifiers that have more than two words.
Instead, move some words after the noun. If you must use this type of
compound, then use a hyphen between each word as needed for clarity.

Recommended: test cases
that are specific to the 2023 edition

Recommended:
cross-data-center replication

Not recommended:
edition-2023-specific test cases

##### Numbers and units of measurement

Hyphenate a number and a spelled-out unit of measurement when they combine to modify a
noun.

Recommended: a 64-bit system

Recommended: 100,000-byte files

Recommended: a five-minute wait

Don't hyphenate if the unit of measurement is abbreviated unless the hyphen is needed for
clarity. Instead, use a nonbreaking space (`&nbsp;`) between the number and unit of
measurement.

Recommended: `200&nbsp;GB
    disk` (200 GB disk)

Recommended: `50&nbsp;Mbps connection` (50 Mbps connection)

For more information, see [Units of measurement](https://developers.google.com/style/units-of-measure).

##### Exceptions

Don't hyphenate adverbs that end in _-ly_ except when needed for clarity.

Recommended: Publicly available
implementations

Not recommended: Publicly-available
implementations

Don't use hyphens in compounds that are conventionally not hyphenated. Follow the
guidance in the [word list](https://developers.google.com/style/word-list) or check the convention in the documentation that you're working with.

Recommended: A managed
instance group (MIG)

Recommended: A machine
learning model

#### Compound terms after a verb

In general, you don't need to add a hyphen to a compound that follows a verb.

Recommended: The app is well
designed.

Recommended: The logs are written
in real time.

Recommended: The product supports
high availability.

Recommended: The app uses techniques
that are Android specific.

Recommended: Customers can use
the utility as is.

Recommended: Get profile information
for the currently authorized user.

##### Exceptions

Some compound terms are always hyphenated, even if they follow a verb. To
check, look the term up in the [word list](https://developers.google.com/style/word-list). If it isn't in the
list, check the [Merriam-Webster dictionary](https://www.merriam-webster.com/).
As always, follow the convention in the documentation that you're working with.

Recommended: You can deploy the app
on-premises.

Recommended: The docs describe how
to create an add-on.

Recommended: The utility works
with apps that are cloud-based and cloud-adjacent.

Recommended: This page is
customer-facing.

Recommended: The app is designed
to be user-friendly.

Recommended: The goal is to produce
an experience that's game-like.

### Range of numbers

Use a hyphen, not an en dash (`&ndash;`),
to indicate a range of numbers. If a hyphen introduces ambiguity, use words such as _from_, _to_, and _through_ for clarity. Don't mix hyphens with words.
For information about how to represent a range of numbers that includes units, see [Ranges of numbers with units](https://developers.google.com/style/units-of-measure#ranges).

Recommended: 8-20 files

Recommended: 5-10 minutes

Recommended: from 8 to 20 files

Not recommended: from 8-20 files

### Spaces around hyphens

Never place a space on either side of a hyphen except when using a [suspended hyphen](#suspended-hyphens), in which case you can leave a space after
(but not before) the hyphen.

### Suspended hyphens

When two or more compound modifiers have a common base, you can keep the
hyphens but leave out the base for all except the last modifier. In the
following examples, the base is _hour_.

Recommended: You can set up the system to

scan for new files at one- or two-hour intervals.

Recommended: You can set up the system to
scan for new files at one-, two-, or three-hour intervals.

_Source: <https://developers.google.com/style/hyphens>_

---

## Parentheses

Some of us love to use parentheses. Unfortunately, some readers ignore
anything that appears in parentheses, so don't put important information in
parentheses if you can help it.

Even for less important information, whenever you're inclined to use
parentheses, consider whether they're necessary. Sometimes they are; however,
the sentence or paragraph might work just as well if you remove the
parentheses and set off the phrase or sentence by using commas, dashes, semicolons,
or periods.

If you need to include parentheses in the middle of a sentence, keep the parenthetical thought
short. Otherwise, consider using two sentences.

> **Note**: If a full standalone sentence appears inside parentheses, the period also goes inside
> the parentheses, not outside.

Recommended: Enter a name for the instance—for example, `my-instance-99`.

Recommended: Enter a six-digit hex number (for example, `228B22`), and then click **OK**.

Recommended: Enter a six-digit hex number, and then click **OK**. For example, if you want the color forest
green, enter `228B22`.

Not recommended: Enter a name for the instance (for example, `my-instance-99`).

Not recommended: Enter a six-digit hex number (for example, if you want the color forest green, enter `228B22`), and then click **OK**.

Don't use parentheses to indicate optional plurals. For more information, see [Plurals in parentheses](https://developers.google.com/style/pluralization#plurals-in-parentheses).

_Source: <https://developers.google.com/style/parentheses>_

---

## Periods and other end punctuation

End a complete sentence with a period, unless it's a question. There are
exceptions for working in lists.

### Periods with lists

Whether to end a list item with a period depends on several factors, including
the kind of list that the item appears in.

For details about how to use periods in lists, see the [Capitalization and end punctuation](https://developers.google.com/style/lists#capitalization-and-end-punctuation) section of the "Lists" page.

### Periods with URLs

When a period immediately follows a URL or a file path, it can be hard to
tell whether the period is part of the URL.

To indicate that the punctuating period isn't part of the URL, try one of the
following techniques:

- Whenever possible, avoid putting [URLs in text](https://developers.google.com/style/cross-references#urls).
- Rewrite the sentence so that the URL isn't at the end of the sentence.
- Put the URL on a separate line from the text, omitting the final period.

If the URL is a link, it generally looks different from the surrounding text. For
example, in most browsers, link text is blue by default. This formatting helps
distinguish the URL from the period.

Recommended:

We use your feedback to improve the Animals API, in accordance with Example
Pet Store's Privacy Policy:

http://www.examplepetstore.com/privacy/

Not recommended:

We use your feedback to improve the Animals API, in accordance with Example
Pet Store's Privacy Policy at http://www.examplepetstore.com/privacy/.

When you do put a period after a URL, don't leave any space between the last character of
the URL and the period.

### Periods with quotation marks

When a sentence ends with material inside quotation marks, place the period
inside the quotation marks even if the period isn't part of the material inside
the quotation marks. An exception to this guideline applies if you're using quotation marks around
a keyword or other literal string. For more information, see [Commas and periods with quotation marks](https://developers.google.com/style/quotation-marks#commas-and-periods-with-quotation-marks).

Recommended: ... you might say "Fixed typo."

If the material inside the quotation marks ends with a question mark or an
exclamation point, don't use a period.

Recommended: Children always ask "Why?"

### Periods with parentheses

If the last part of a sentence is contained inside parentheses, put the
period after the closing parenthesis.

If the parentheses contain a complete sentence, put the period inside
the parentheses.

Recommended: Your application could show
a notification when a relevant file or folder has changed (even if that change
occurs while your application isn't running).

Recommended: App Engine applications are
easy to create, easy to maintain, and easy to scale. (With App Engine, there are
no servers for you to maintain.)

For more information, see [Parentheses](https://developers.google.com/style/parentheses).

### Periods with headings

Don't end headings with periods.

For more information, see [Headings](https://developers.google.com/style/headings).

### Periods with numbers

Use a period to represent a decimal point. (Using a comma to separate the decimal part
of a number is the editorial custom in some countries, but not in the US.)

For more information, see [Numbers](https://developers.google.com/style/numbers).

### Periods with captions

See [Figure captions](https://developers.google.com/style/images#figure-captions).

### Periods with alt text

See [Alt text](https://developers.google.com/style/images#alt-text).

### Periods with abbreviations

Put a period after a shortened word.

Don't put periods after the letters of an acronym or initialism.

For more information, see [Abbreviations](https://developers.google.com/style/abbreviations).

### Spaces between sentences

Leave only one space between sentences.

### Exclamation points

In general, avoid exclamation points. They can appear unprofessional, alarming, or translate poorly into other languages. If you need to use an exclamation point, see the following guidance by content type:

- **Concept and reference docs.** Never use exclamation points. These sections should maintain a neutral, objective tone.
- **Procedural topics.** Avoid exclamation points. Use periods for completion steps—for example, "The VM is created."
- **Blog posts.** Exclamation points are acceptable to convey enthusiasm but shouldn't be used in every paragraph.

When exclamation points are acceptable:

- **Code examples.** Use when required by syntax—for example, the `!=` operator.
- **System literals.** Use when an exclamation point is part of a specific error code or log message that must be matched exactly.
- **Tutorials and learning modules.** Use sparingly to mark major milestones or achievements—for example, "Congratulations! You've completed the setup."

> **Note:** For translation impact, be conservative with exclamation points in global
> documentation. In some languages, such as Japanese or Korean, exclamation marks can come across
> as overly emphatic or even shouting, which can alienate the reader.

_Source: <https://developers.google.com/style/periods>_

---

## Quotation marks

Use straight double quotation marks and apostrophes.

### When to use quotation marks

In technical writing, we don't use quotation marks much, aside from instances of code.

Generally, you can use quotation marks for
titles of shorter works such as articles or episodes in a web series, unless
they're part of a link. For more information, see [cross-references](https://developers.google.com/style/cross-references).

For most titles that are full-length works, we use italics.

For examples of when to use quotation marks in regular text, see the following table:

| Guidance                                                                                                  | Example                                                                                                                                                                                                                     |
| --------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Referring to a section of a larger document or piece, if you can't link to the section directly.          | The technique is described in the section "Deploying containers" of the [Containers overview](https://www.youtube.com) video.                                                                                               |
| Referring to the title of a parent document when you're already linking to a section                      | The [machine learning (ML) workflow section](https://cloud.google.com/vertex-ai/docs/start/introduction-unified-platform#ml-workflow) of "Introduction to Vertex AI" describes the machine learning workflow for Vertex AI. |
| Directly citing a person or quoting a slogan or motto.                                                    | Martin Fowler has said, "We are still learning the techniques to write software effectively."                                                                                                                               |
| Using a term metaphorically, but only if it's not an established usage in the domain.                     | This configuration forms an "island" within the network that is not connected to the external network.                                                                                                                      |

For more information, see [Text-formatting summary](https://developers.google.com/style/text-formatting).

### Commas and periods with quotation marks

Commas and periods go inside quotation marks.

Recommended: See the section
titled "Care and feeding of the emu."

Not recommended: See the section titled "Care
and feeding of the emu".

**Exception**: When you put a keyword or other literal string in quotation
marks, put any other punctuation outside the quotation marks. In those cases,
the quotation marks indicate an exact literal string, so don't add anything
extraneous inside the quotation marks. However, in general, don't put quotation marks
around an item that's in code font, unless the quotation marks are part of the
item.

Recommended: If you enter `escape`,
the program crashes.

Acceptable: If you enter "escape", the program
crashes.

Not recommended: If you enter "escape," the
program crashes.

### Straight and curly quotation marks

Most typefaces support two forms of quotation marks and apostrophes:
straight marks and curly, or typographic, marks. Some tools, like
Google Docs, automatically convert straight quotation marks and
apostrophes to the curly versions as you type. However, our guidance is
to always use straight quotation marks and straight apostrophes in developer documentation, for
the following reasons:

- It makes writing documents easier. * Code _requires_ straight marks, so it's simpler to use straight marks everywhere
  in developer documentation than to use them in code but not in text.
  - Tools that automatically change straight marks to curly marks (such as word processors)
    often make mistakes.
  - Humans who manually type curly marks also often make mistakes.
  - Manually typing curly marks can be difficult on some platforms.
- It makes reviewing documents easier. * When you're proofreading a document, it can be hard to see whether marks are straight or
  curly, and which direction they point in.

In the following examples, the first example uses straight quotation marks and the second example
uses curly quotation marks:

Recommended: The section's title is "Care
and feeding of the emu."

Not recommended: The section’s title
is “Care and feeding of the emu.”

### Single quotation marks

The only times to use single quotation marks in our documentation are the following:

- In code examples, in languages that use single quotation marks.
- When nesting a quotation inside another quotation.

In the latter case, put the primary speaker's quote in double quotation marks and the quote inside
the primary speaker's quote in single quotation marks.

Recommended: She said, "I heard
him shout 'Help,' and saw him floundering in the water."

Not recommended: She said, 'I heard him shout
"Help", and saw him floundering in the water'.

> **Note**: For information about how to use quotation marks with links, see
> [Quotation marks and italics](https://developers.google.com/style/cross-references#quotation-marks-italics).

_Source: <https://developers.google.com/style/quotation-marks>_

---

## Semicolons

If possible, avoid using semicolons. In a few cases, a semicolon is preferred:

- When joining two closely related independent clauses where a period or a comma is not as
  effective.

  Recommended: You can easily test
  compatibility by computing the centroid; if it is on the opposite side of the
  planet, reverse the order of your vertices.

- When preceding a conjunctive adverb (like _therefore_) or a phrase
  (like _that is_) that joins two independent clauses.

  Recommended: This setup places the
  head-tracked node below the Main Camera; therefore, only the stereo cameras are
  affected by the user's head motion.

  Recommended: The URL from which a video
  ad loads; that is, the URL to use to fetch that video ad.

- When separating a series of long or complex items that contain their own punctuation.

  Recommended: If you don't have time,
  then focus on the improvements that will have the greatest benefit: what matters most
  to your users; what is most important to fix; and what is easy or feasible to
  fix in the available time.

  Recommended: Review your document one
  more time, checking for the following: present tense and active voice; typos,
  punctuation, and grammar; and whether you can shorten anything.

  Notice that in the final example, the second item in the list is itself a list.

_Source: <https://developers.google.com/style/semicolons>_

---

## Slashes

Avoid using slashes, except in code.

### Slashes with dates

Don't use date formats that rely on slashes.

For information about how to write dates, see [Dates and times](https://developers.google.com/style/dates-times).

### Slashes with alternatives

Don't use slashes to separate alternatives.

Recommended: For example, a disaster
relief map is not subject to the usage limits even if it has been developed and
is hosted by a commercial entity.

Recommended: For example, a disaster
relief map is not subject to the usage limits even if it has been developed or
is hosted by a commercial entity.

Not recommended: For example, a disaster
relief map is not subject to the usage limits even if it has been
developed/hosted by a commercial entity.

Recommended: Call this method five or six
times.

Not recommended: Call this method 5/6
times.

#### And/or

Often, _and_ implies _or_, so you don't need to write both words.
If you need to specify both in your content, avoid writing _and/or_ except
when space is limited, such as in tables.

Recommended: You can view
and edit your own data.

Not recommended: You can
view and/or edit your own data.

Recommended: You can
export raw events, processed events, or both.

Not recommended: You can
export raw and/or processed events.

### Slashes with file paths and URLs

Use forward slashes, as appropriate, in computer file paths and URLs.

> **Note**: If you're documenting a Windows path, use backslashes.

Recommended:
https://developers.google.com/cardboard/

Where very long URLs extend beyond a line, add a line break immediately after
a slash. Don't ever insert an extraneous hyphen into a URL to break it between two lines.

Recommended:
https://developers.google.com/
cardboard/

### Slashes with fractions

Don't use slashes with fractions because they can be ambiguous.

In the following example, 3/4 could be interpreted either as three-quarters
or as stating that 4 is an alternative to 3.

Recommended: ¾

Recommended: 0.75

Recommended: 75%

Not recommended: 3/4

### Slashes with abbreviations

Don't use abbreviations that rely on slashes. Instead, spell the words out.

Recommended: care of, with

Not recommended: c/o, w/

_Source: <https://developers.google.com/style/slashes>_
