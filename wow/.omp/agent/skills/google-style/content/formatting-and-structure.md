# Formatting and structure

Adapted from the [Google developer documentation style guide](https://developers.google.com/style),
retrieved 2026-09-22. Original content © Google, licensed under
[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). Code samples are licensed under
[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0).

**Changes made:** HTML converted to Markdown; site navigation, language selector, generated
page summaries, and page footers removed; site-relative links rewritten as absolute URLs;
each page's headings demoted one level so the page nests under this file's title; multiple
pages combined into this file. The guidance text is not rewritten, summarized, or reordered,
though the HTML-to-Markdown conversion reflows line breaks and table layout. Notices
(`<aside>` elements) are rendered as blockquotes. The one `<abbr>` element in the guide (PPI, on
the images page) has its title expanded in parentheses.

| Page                                         | Canonical URL                                          | Upstream last updated |
| -------------------------------------------- | ------------------------------------------------------ | --------------------- |
| Text-formatting summary                      | <https://developers.google.com/style/text-formatting>  | 2026-01-20            |
| Format examples                              | <https://developers.google.com/style/format-examples>  | 2025-12-02            |
| Headings and titles                          | <https://developers.google.com/style/headings>         | 2026-06-08            |
| Make headings into link targets              | <https://developers.google.com/style/headings-targets> | 2026-05-06            |
| Lists                                        | <https://developers.google.com/style/lists>            | 2025-05-16            |
| Tables                                       | <https://developers.google.com/style/tables>           | 2025-03-21            |
| Notes, cautions, warnings, and other notices | <https://developers.google.com/style/notices>          | 2025-09-08            |
| Footnotes                                    | <https://developers.google.com/style/footnotes>        | 2025-04-02            |
| Cross-references and linking                 | <https://developers.google.com/style/cross-references> | 2025-11-07            |
| Diagrams, figures, and other images          | <https://developers.google.com/style/images>           | 2025-05-16            |
| Markdown versus HTML                         | <https://developers.google.com/style/markdown>         | 2024-10-15            |
| HTML formatting                              | <https://developers.google.com/style/html-formatting>  | 2024-10-15            |
| HTML and semantic tagging                    | <https://developers.google.com/style/semantic-tagging> | 2024-10-15            |
| Example domains and names                    | <https://developers.google.com/style/examples>         | 2025-04-17            |

---

## Text-formatting summary

The page summarizes, and provides a quick reference for, many of the general text-formatting
conventions covered elsewhere in the style guide. For more information, see [Visual formatting](https://developers.google.com/style/semantic-tagging#visual-formatting).

Bold
Use bold formatting, `<b>` or `**`, only for
[UI elements](https://developers.google.com/style/ui-elements#formatting) and
[run-in headings](https://developers.google.com/style/lists#types-of-lists), including at the beginning of
[notices](https://developers.google.com/style/notices).

Although a double underscore, `__`, can also indicate bold styling in Markdown, it
can be difficult to distinguish in a text editor. It's best to use the double asterisk for bold in
Markdown.

Italic
In general, use italics sparingly.

When you're discussing or introducing terms, such as when defining terms or using _words as words_, use italics formatting, `<i>` or `_`. For more
information, see [Use italics to discuss terms](https://developers.google.com/style/italics-terms) and [Format abbreviation introductions](https://developers.google.com/style/abbreviations#format-abbreviations).

When you need to add emphasis to indicate importance, use italics, not bold or underline. But
usually, your words can carry the emphasis without adding italics. To indicate [semantic emphasis](https://developers.google.com/style/semantic-tagging) in HTML, use the `em` element,
which renders as italics in most contexts. To indicate emphasis in Markdown, use underscores
(`_`), which render as italics; you can't do semantic tagging in Markdown.

Although an asterisk, `*`, can also indicate italics in Markdown, we recommend
underscores to make it easier for humans to distinguish italics from bold in the Markdown file.

Italicize titles of books, movies, web series, and other full-length works, unless they're part
of a link. For more information, see
[Cross-references and linking](https://developers.google.com/style/cross-references).

Italicize mathematical variables—for example, _x_ + _y_ = 3.
Don't italicize mathematical operators such as the plus sign. For more information about
formatting mathematical notation, see
[Mathematical notation](https://developers.google.com/style/mathematical-notation#format-mathematical-notation).

Italicize version variables—for example, version 1.4._x_.

Underline
Reserve underlining for link text. For more information, see
[Style link text](https://developers.google.com/style/cross-references#style-link-text).

Code font
Use `<code>` in HTML or `` ` `` in Markdown to apply a monospace font
and other styling to [code in text](https://developers.google.com/style/code-in-text), inline code, and user
input.

Use code blocks, `<pre>` or ` ``` `, for
[code samples](https://developers.google.com/style/code-samples) or other blocks of code.

Do not override or modify font styles inline.

Use code font to mark up code, such as filenames, class names, method names, HTTP status codes,
console output, and placeholders. For more information, see [Some specific items to put in code font](https://developers.google.com/style/code-in-text#some-specific-items-to-put-in-code-font).

Capitalization
Use American English style for
[general capitalization](https://developers.google.com/style/capitalization).

Use sentence case in all [headings, titles, and navigation](https://developers.google.com/style/capitalization#capitalization-in-titles-and-headings).

Use all-capitals for [placeholders](https://developers.google.com/style/placeholders#placeholder-text).

Quotation marks
In general, use American English style when [punctuating quotations](https://developers.google.com/style/quotation-marks).

For titles of shorter works—such as articles or episodes in a web series—put titles in quotation
marks, unless they're part of a link.

Font type, size, and color
Do not override global styles for [font type, size, or color](https://developers.google.com/style/fonts).

Use [semantic HTML](https://developers.google.com/style/semantic-tagging) or Markdown to
control the style of text on a page—for example, code tags in HTML (`<code>`)
or backticks in Markdown (`` ` ``)—instead of manually styling text with a monospace
font.

Other punctuation conventions
Don't use [ampersands (&)](https://developers.google.com/style/word-list#ampersand) as conjunctions or
shorthand for _and_. Use _and_ instead. That includes headings and navigation.

**Exception**: It's okay to use _&_ in cases where you need to refer to a UI
element or the name of a menu that uses _&_.

Put quotation marks and end punctuation outside of link text. For more information, see
the [Punctuation around link text](https://developers.google.com/style/cross-references#punctuation) and [Quotation marks and italics](https://developers.google.com/style/cross-references#quotation-marks-italics) sections of the "Cross-references and linking" page.

### More resources

- [Mathematical notation](https://developers.google.com/style/mathematical-notation)

_Source: <https://developers.google.com/style/text-formatting>_

---

## Format examples

To introduce an example in a sentence, use the guidance in the following table. You can introduce
examples using _such as_, _for example_, or _like_ in various ways.

| Guidance                                                                                                                                                                                                               | Recommended                                                                                                                                                                                                                                                     | Not recommended                                                                                                                                                                             |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Introduce a short-to-medium-length example at the end of a sentence. For clarity, consider setting off the example using a comma, parentheses, or an em dash as appropriate. Avoid using a semicolon for this purpose. | Choose a strong encryption algorithm, such as AES-256. You can monitor various metrics for your managed database instances—for example, CPU utilization, storage capacity, and active connections. The API supports common image formats like PNG and JPEG.     | Enter a name for the instance, for example, `my-instance-99`. Specify the region for deployment; for example, `us-central1`. Enter a name for the instance (for example, `my-instance-99`). |
| Introduce a short example in the middle of a sentence. Keep the example in the middle of a sentence relatively short and consider setting it off with dashes, commas, or parentheses as appropriate.                   | Enter a six-digit hex number (for example, `228B22`), and then click **OK**. The virtual machine (VM) requires an operating system, such as Ubuntu 22.04, to be installed. Some elements, like buttons and input fields, have default accessibility attributes. | Enter a six-digit hex number (for example, if you want the color forest green, enter `228B22`), and then click **OK**.                                                                      |
| Introduce a longer example as a separate sentence. For a longer example, introduce it as a separate sentence using _for example_ as an adverb in that sentence.                                                        | You can assign tags to your virtual machine instances to categorize them. For example, you could tag instances by environment with `env:prod` or `env:dev`.                                                                                                     |                                                                                                                                                                                             |

_Source: <https://developers.google.com/style/format-examples>_

---

## Headings and titles

Use sentence case for headings and titles. Use descriptive headings and titles because they help
a reader navigate their browser and the page. It's easier to jump between pages and sections of a
page if the headings and titles are unique.

### Heading and title text

Write document titles based on the primary purpose of the document. If a
document is primarily a tutorial, but it has a conceptual introduction, write a
task-based title. Write section headings based on the type of content that's in
the section.

| Guidance                                                                                                                                                                                                                                                                                                                                                                                                                 | Recommended                    | Not recommended                 |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------ | ------------------------------- |
| For a task-based heading, start with a [_bare infinitive_](https://wikipedia.org/wiki/Infinitive#English), also known as a _plain form_ or [_base form_](https://wikipedia.org/wiki/English_verbs#Base_form) verb. In English, the _imperative mood_ also uses the base form verb, so it looks the same as the bare infinitive. Task-based headings are frequently used in quickstarts, how-to documents, and tutorials. | Create an instance             | Creating an instance            |
| For a conceptual or non-task-based heading, use a [_noun phrase_](https://wikipedia.org/wiki/Noun_phrase) that doesn't start with an _-ing_ verb. Noun-phrase headings are frequently used in concept documentation.                                                                                                                                                                                                     | Migration to Google Cloud      | Migrating to Google Cloud       |
| If a section is not required for all users or scenarios, use the _Optional:_ prefix in the heading. This prefix signals when the section information applies only to a specific configuration or use case. For information about optional steps in a procedure, see [Optional steps](https://developers.google.com/style/procedures#optional-steps).                                                                     | Optional: Customize your alias | Customize your alias (optional) |

#### Title phrasing

Use a unique level-1 heading (`h1`) for each page in a set of documents and only use
a level-1 heading once on a page.

Avoid repeating the exact page title in a heading on the page. For example, if you document
how to create a virtual machine and how to start a virtual machine on the same task-based
page, the page title might be _Create and start VM instances_, with section headings _Create a VM_ and _Start a VM_.

#### Mixed heading styles

It's OK to use task-based and conceptual heading styles in the same document.
If a single document includes both task-based and conceptual sections, then use
the appropriate phrasing for each section's heading.

#### Use of _-ing_ verb forms

When possible, avoid using _-ing_ verb forms as the first word in any heading or
title.

Recommended:
Transfer data sets

Not recommended:
Transferring data sets

An _-ing_ verb form is a present participle or gerund. These verb forms
are inconsistently translated when they're used as the first word in a title,
and they increase character count in limited spaces.

Sometimes, there might not be a better alternative to using a gerund, such as the following
examples:

- Billing
- Pricing

It's OK to use a gerund in these cases.

It's OK to use an _-ing_ verb form later in a heading or title, such as _Introduction to BigQuery monitoring_.

#### Example headings

The following example is a task-based document that includes a conceptual
heading and a task-based heading.

Recommended:

#### HTML

```
<h1>Log serving requests by using AI Platform Prediction</h1>

<p>This task-based document shows how to monitor machine learning models. The
document title starts with a bare infinitive.</p>

<h2>ML model monitoring overview</h2>

<p>This section provides a conceptual overview of ML model monitoring. Its title is
a noun phrase.</p>

<h2>Configure notebook settings<h2>

<p>This task-based section provides a series of steps to set variables in a
notebook. Its title starts with a bare infinitive.</p>
```

#### Markdown

```
# Log serving requests by using AI Platform Prediction

This task-based document shows how to monitor machine learning models. The
document title starts with a bare infinitive.

## ML model monitoring overview

This section provides a conceptual overview of ML model monitoring. Its title is
a noun phrase.

## Configure notebook settings

This task-based section provides a series of steps to set variables in a
notebook. Its title starts with a bare infinitive.
```

### Heading and title format

The following sections list and define our writing standards for capitalization,
abbreviations, and technical elements in headings. In general, guidance
that applies to standard text also applies to headings—for example, [contractions](https://developers.google.com/style/contractions) and [articles](https://developers.google.com/style/articles).

#### Syntax and capitalization

- **Use sentence case** for all headings and titles. For more information, see [Capitalization in titles and headings](https://developers.google.com/style/capitalization#capitalization-in-titles-and-headings).
- **Keep punctuation simple**. Punctuation can be a sign that your heading is too complicated. Consider rewriting.
- **Limit abbreviations**. Only use an abbreviation of a word in a page title or heading if it's the more commonly known
  version of the word. If you do so, define the abbreviation in the first instance of the word in a paragraph.
  You can define the abbreviation in the page title or heading, but consider if the additional
  length adds value. For SEO, use the more prominent version of a term in headings. For more information, see
  [Abbreviations](https://developers.google.com/style/abbreviations).

#### Formatting and code

- **Don't use numbers in headings**to indicate a sequence of sections.
  Instead, rely on heading hierarchy and order to indicate sequence.

- **Avoid code items in headings**. If you must mention a code item in a heading,
  add a descriptive noun to the item in code font. For more information, see [Grammatical treatment of code elements](https://developers.google.com/style/code-in-text#grammatical-treatment-of-code-elements).
- **Don't put links in headings**. A link can easily be confused as a style applied to the
  heading instead of a link.

#### Hierarchy and structure

- **Don't use heading tags to change visual formatting**. Use CSS rather than a heading level
  that doesn't fit the hierarchy. Don't make up your own formatting for headings.

- **Apply proper heading tags**. Use heading tags to structure your content hierarchically—for example,
  `<h1>`, `<h2>`, and `<h3>` in HTML, or
  `#`, `##`, and `###` in Markdown.

- **Maintain logical order**. Don't skip levels of the heading hierarchy. For example, put an `<h3>` tag
  only under an `<h2>` tag.

  Recommended:

#### HTML

```
<h1>Transfer data sets</h1>

    <p>This document provides a high-level overview of ways to transfer your data to Google
Cloud.</p>

    <h2>Estimate costs</h2>
```

#### Markdown

```
# Transfer data sets

    This document provides a high-level overview of ways to transfer your data to Google Cloud.

    ## Estimate costs
```

Not recommended:

#### HTML

```
<h1>Transfer data sets</h1>

    <p>This document provides a high-level overview of ways to transfer your data to Google
Cloud.</p>

    <h3>Estimate costs</h3>
```

#### Markdown

```
# Transfer data sets

    This document provides a high-level overview of ways to transfer your data to Google Cloud.

    ### Estimate costs
```

- **Don't use empty headings**. Make sure headings are followed by content.

  Recommended:

#### HTML

```
<h2>Migrate VMs to Compute Engine</h2>

    <p>Migration is not just a single step. The following sections describe the recommended
steps.</p>

    <h3>Design the migration</h3>
```

#### Markdown

```
## Migrate VMs to Compute Engine

    Migration is not just a single step. The following sections describe the recommended steps.

    ### Design the migration
```

Not recommended:

#### HTML

```
<h2>Migrate VMs to Compute Engine</h2>

    <h3>Design the migration</h3>
```

#### Markdown

```
## Migrate VMs to Compute Engine

    ### Design the migration
```

### Refer to a group of sections

If you introduce a group of related H3 or lower sections within a larger H2 section, use the
phrase _the following sections_. Don't refer to the group of sections using the phrases _this section_ or _these sections_ because those phrases are ambiguous.

Recommended:

#### HTML

```
<h2>Views in the data preparation editor</h2>

<p>The following sections describe the views in the data preparation editor.</p>

<h3>Data view</h3>

<p>...</p>

<h3>Graph view</h3>

<p>...</p>

<h3>Schema view</h3>

<p>...</p>
```

#### Markdown

```
## Views in the data preparation editor

The following sections describe the views in the data preparation editor.

### Data view

...

### Graph view

...

### Schema view

...
```

_Source: <https://developers.google.com/style/headings>_

---

## Make headings into link targets

This page discusses how to turn a heading into a link target by using an `id` attribute. For more information about how to format headings, see [Headings and titles](https://developers.google.com/style/headings).

In some content management systems, anchors are automatically created for headings. However, you
might want to add a _custom_ anchor to a heading for several reasons:

- You want to use an anchor that's shorter than the automatically generated anchor.
- You want to use an anchor for content that might be frequently linked to. Adding a custom
  anchor reduces the likelihood of breaking existing links if the heading text changes later.
- You want to [revise a heading](#changing-an-anchor). If the
  anchor for the heading is generated automatically, then the anchor changes when you revise
  the heading, breaking existing links.

### Add a custom anchor

#### HTML

To add an anchor to a heading in HTML, add a `section` element
with an `id` attribute, or use an `a` element with
a `name` attribute. For anchor text, use lowercase letters, and
put hyphens between words. In the following, replace `*ID_OF_ANCHOR*` with your anchor text—for example, `introduction-to-everything`.

```
<section id="*ID_OF_ANCHOR*"></section>

```

Recommended:

```
<section id="introduction-to-everything">
<h2>Introduction to everything</h2>
...
</section>

```

Recommended:

```
<h2><a name="introduction-to-everything">Introduction to everything</a></h2>

```

Recommended:

```
<a name="introduction-to-everything"></a>
<h2>Introduction to everything</h2>

```

Acceptable:

```
<h2 id="introduction-to-everything">Introduction to everything</h2>

```

#### Markdown

To add an anchor to a heading in Markdown, add the following code to the
end of the line that the heading is on. For anchor text, use lowercase
letters, and put hyphens between words. In the following, replace `*ID_OF_ANCHOR*` with your anchor text—for example, `conserve-habitat`.

```
{: #*ID_OF_ANCHOR* }
```

Recommended:

```
## Help conserve habitat for pollinators {: #help-conserve-habitat-for-pollinators }
```

Also recommended:

```
## Help conserve habitat for pollinators {: #conserve-habitat }
```

Acceptable:

```
## Help conserve habitat for pollinators {: id='conserve-habitat' }
```

Acceptable:

```
## Help conserve habitat for pollinators {: id="conserve-habitat" }
```

### Revise a heading

If you revise a heading in a content management system where anchors are automatically created,
you can create a custom anchor to avoid breaking existing links. If the heading already has a
custom anchor, don't change the anchor unless it contains a term that you want to remove (such as
a disrespectful term).

To create the custom anchor, use the older ID string for the heading. You can find the ID
string by inspecting the heading on the published page. For example, if you change a heading from _Introduction to some things_ to _Introduction to everything_, then add a custom anchor
that uses the older ID string and formatting.

#### HTML

```
<section id="introduction-to-some-things">
<h2>Introduction to everything</h2>
...
</section>
```

#### Markdown

```
## Introduction to everything {: #introduction-to-some-things }
```

If you need to change an existing custom anchor, you should check your content management
system to update any links that use the old anchor. Inbound links that use the old anchor still
reach the page but not the specific section or heading.

_Source: <https://developers.google.com/style/headings-targets>_

---

## Lists

### List or table?

Tables and lists are both ways to present a set of similarly structured
items. Sometimes it's not obvious when to choose one presentation over the
other. To decide which presentation to use, see [List or table?](https://developers.google.com/style/tables#list-or-table)

**Note**: Don't use a list to show only one item; a single
item isn't really a list. If you want to set a single item off from surrounding
text, then use some other formatting.

### Types of lists

Choose one of the following list styles. The following table includes common ways to present
lists in our documentation:

| List type                                           | Used for                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | HTML elements    |
| --------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------- |
| Numbered list                                       | A set of items where the sequence is significant, such as ordered steps, phases, or priorities. The following is an example of a numbered list: > Here's a sequence of steps to follow:<br>Open the box.<br>Remove the bobcat from the box.<br>Feed the bobcat. Nested sequential lists are labeled with lowercase letters or lowercase Roman numerals. The following is an example of a nested sequential list: > Here's a list of things to do after breakfast, in order:<br>Go shopping. Buy groceries: Flour Eggs Sugar Butter > Go to mall: Buy dress. Buy shoes. > <br>Make cake.<br>Build birthday present out of spare parts.<br>Clean house. See also [Sub-steps in numbered procedures](https://developers.google.com/style/procedures#sublists). | `ol`, `li`       |
| Bulleted list                                       | A set of items that's not a sequence, such as a set of nonsequential options or examples. Make sure it's clear whether or not every item is required. The following is an example of a bulleted list: > Here's a list of things that can go wrong, in no particular order:<br>Your bicycle might explode.<br>The sun might go out.<br>An ant might break its leg and require a tiny splint.                                                                                                                                                                                                                                                                                                                                                                 | `ul`, `li`       |
| Description list                                    | A set of terms, each with a description, definition, or explanation. Use this type of list if you want to draw attention to two or more terms (such as a glossary). The following is an example of a description list: > Here are some descriptions of types of birds: > > Emu > The best kind of bird. > > Crow > The other best kind of bird. > > Peacock > Also the best kind of bird. > > Phoenix > An even better kind of bird.                                                                                                                                                                                                                                                                                                                        | `dl`, `dt`, `dd` |
| Description list that uses bulleted run-in headings | A set of introductory terms or phrases, each followed by a description, definition, or explanation. Use this type of list if you want to highlight and explain several concepts or save space. For information about how to format and punctuate run-in headings and their descriptions, see [Description lists that use run-in headings](#description-lists-that-use-run-in-headings) in this document. The following is an example of a description list that uses bulleted run-in headings: > Here are some descriptions of types of birds:<br>**Emu**: the best kind of bird<br>**Crow**: the other best kind of bird<br>**Peacock**: also the best kind of bird<br>**Phoenix**: an even better kind of bird                                            | `ul`, `li`       |

### Multiple paragraph list items

Any list item can contain more than one paragraph.

To create multiple paragraphs, use the `p` element rather
than using the `br` element. (The HTML specification describes which uses of the [`br` element](https://html.spec.whatwg.org/multipage/semantics.html#the-br-element) are legitimate and which aren't.)

Example of a list item that contains more than one paragraph:

- This list item is a single paragraph.

- This list item contains multiple paragraphs.

  As you can see!

- This is another list item that's only one paragraph long.

### Introductory sentences for lists

Introduce a list with the appropriate context. In most cases, precede a list
with an introductory sentence. The sentence can end with a colon or a period; usually a colon if it
immediately precedes the list, usually a period if there's more material (such as a note
paragraph) between the introduction and the list.

If the list doesn't need any additional context other than the heading that immediately precedes
the list, it's OK to not introduce a list with an introductory sentence.

Introduce a list with a complete sentence, not a partial one that's
completed by the list items. You can also use _the following_ as a noun phrase (see [following](https://developers.google.com/style/word-list#following) in the word list).

| Recommended                                                                                                                                                           | Not recommended                                                                                                                               |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| Use the **Submit** button for any of the following purposes:<br>To submit the form.<br>To indicate that you're done.<br>To allow the next person to enter their data. | Use the **Submit** button to:<br>Submit the form.<br>Indicate that you're done.<br>Allow the next person to enter their data.                 |
| To get the USB driver, follow these steps:<br>Click **Tools > Android > SDK Manager**.<br>Select **Google USB Driver**, and then click **OK**.                        | To get the USB driver:<br>Click **Tools > Android > SDK Manager**.<br>Select **Google USB Driver**, and then click **OK**.                    |
| If you need to add an instance manually, do the following:<br>Click **Create instance**.<br>For **Name**, enter a name.                                               | If you need to add an instance manually:<br>Click **Create instance**.<br>For **Name**, enter a name.                                         |
| Objectives<br>Create an instance<br>Snapshot an instance<br>Delete an instance                                                                                        | Objectives In the following tutorial, you will complete the following tasks: Create an instance<br>Snapshot an instance<br>Delete an instance |

For information about introducing sub-steps, see [Sub-steps in numbered procedures](https://developers.google.com/style/procedures#sublists).

For information about punctuation and capitalization of lists, see [Capitalization and end punctuation](#capitalization).

### Unusual list numbering

Use nonstandard numbering in the following situations:

- To present a list in reverse-numerical order, use an `ol` element with a `reversed` attribute.
- To set a value manually, use the `value` attribute. In some cases, setting a
  value manually can be convenient. However, in most cases, it isn't a good idea to manually
  number a list item in a numbered list, because if the number of items changes later, you'll
  have to manually change the value.

### Sub-steps in a numbered procedure

For information about sub-steps in a numbered procedure, see [Procedures](https://developers.google.com/style/procedures#sublists).

### Parallel syntax

Use the same syntax/structure for all list items in a given list, if
possible.

### Capitalization and end punctuation

Capitalization and end punctuation depend on the type of list and the
contents of the list.

#### Numbered, lettered, and bulleted lists

Start each list item with a capital letter, unless case is an important part of
the information conveyed by the list—such as in a list of glossary terms.

End each list item with a period or other appropriate sentence-ending
punctuation, except in the following cases:

- If the item consists of a single word, don't add end punctuation.
- If the item doesn't include a verb, don't add end punctuation.
- If the item is entirely in code font, don't add end punctuation.
- If the item is entirely link text or a document title, don't add end punctuation.

If you end up with inconsistent punctuation in your list, then either rewrite your list to use [parallel construction](#parallel) or add end punctuation to every list item
for consistency.

Recommended:

The following words are adjectives:

- Big
- Small
- Gratuitous

Recommended:

The SDK supports the following UI elements:

- Text box
- Bulleted list
- Button

Recommended:

The API supports the following actions:

- Create
- Replace
- Update
- Delete

Recommended:

You can do any of the following by using the API:

- Create an item.
- Replace one item with another.
- Update an item.
- Delete an item.

#### Description lists

Sometimes it's useful to add an explanatory phrase to a list item, which can
affect the punctuation. In general, don't add an explanatory phrase to only a
single list item; instead, use a description list, and provide explanatory
phrases for all items.

In most contexts, start each term (`dt` element) with a capital letter.

Don't end the term with a period. Do generally put a period at the end of
each `dd` ("description") element.

| Recommended                                                                                                                  | Not recommended                                                                                 |
| ---------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| The following words are adjectives: Big A short word. Relevant A fancy word. Gratuitous A long word. Purple A vibrant color. | The following words are adjectives:<br>Big<br>Relevant<br>Gratuitous<br>Purple—this is a color. |

#### Description lists that use run-in headings

In most contexts, format run-in headings as follows:

- Start the run-in heading with a capital letter.
- End the run-in heading with a period or a colon, but be consistent within the list.
- You can decide whether to bold the punctuation that ends the heading based on factors
  such as on-page consistency.

For the descriptions that follow the punctuation, capitalize the first letter as follows:

- If the text follows a period, start the text with a capital letter.
- If the text follows a colon, start the text with a lowercase letter.

To end the descriptive text, punctuate as follows:

- If the description follows a period, end the description with a period.
- If the description follows a colon, do one of the following:

* If the description is a list of items or short phrases without verbs, don't include a
  period.
* If the description includes a verb or expresses a standalone thought, end the
  description with a period.

Don't use a dash to set off a description from an item in a description list. For more
information, see [Colons instead of dashes in lists](https://developers.google.com/style/dashes#colons-instead-of-dashes-in-description-lists).

Recommended:

The following words are adjectives:

- **Big**: a short word
- **Relevant**: a fancy word
- **Gratuitous**: a long word
- **Purple**: a vibrant color

Recommended:

The coffee shop has several great choices:

- **Coffee**: latte, mocha, cappuccino, espresso, macchiato
- **Tea**: chai tea, chai latte, black tea, green tea, herbal tea

Recommended:

Budget Airlines reduces your ticket cost in several ways:

- **It increases fuel economy by reducing baggage weight**. By charging
  astronomical prices for anything larger than a wallet....
- **It carries more passengers per flight**. By reducing leg room to industry and
  medical minimums, it fits more seats....

> **Note**: The guidelines here about list punctuation differ from the
> [Material Design guidelines](https://material.io/guidelines/style/writing.html#writing-capitalization-punctuation).
> If you're writing UI text rather than prose documentation, then follow the Material Design
> guidelines.

### Comma-separated lists

When you write a list in a paragraph, use [serial commas](https://developers.google.com/style/commas#serial-commas) to separate the items.

Avoid ending a list with _etc._ or phrases like _and so on_.
Instead, introduce the list in a way that makes it clear that the list isn't
all-inclusive.

Recommended: The service processes data
like event logs, clickstream data, social network interactions, and e-commerce
transactions.

Not recommended: The service processes
event logs, clickstream data, social network interactions, e-commerce
transactions, etc.

For more information, see [etc.](https://developers.google.com/style/word-list#etc)

_Source: <https://developers.google.com/style/lists>_

---

## Tables

In many contexts, tables are the best way to represent sets of related pieces of data. However,
in some contexts, other approaches are better choices.

### List or table?

Tables and lists are both ways to present a set of similarly structured
items; sometimes it's not obvious when to choose one presentation over the
other. To decide which presentation to use, consult the following table:

| Item type                                          | Example                                                                               | How to present                                                                                                                      |
| -------------------------------------------------- | ------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Each item is a single unit.                        | A list of programming language names, or a list of steps to follow.                   | Use a [numbered list, lettered list, or bulleted list](https://developers.google.com/style/lists#numbered-lettered-bulleted-lists). |
| Each item is a pair of pieces of related data.     | A list of term/definition pairs.                                                      | Use a [description list](https://developers.google.com/style/lists#description-lists) (or, in some contexts, a table).              |
| Each item is three or more pieces of related data. | A set of parameters, where each parameter has a name, a data type, and a description. | Use a table.                                                                                                                        |

#### Places not to use tables

- Don't use tables to lay out a page; use your site's standard CSS instead.
- Usually if you have only one row of material, a table isn't the best
  choice for how to present it. But in some contexts (especially for consistency
  of layout in reference documentation), it might be.
- If you have only one column in your table, turn the table into a list.
- Don't use tables to lay out code snippets.
- Don't use tables to lay out long one-dimensional lists in multiple
  columns. For example, if you have a long list of function names, don't try to
  save space by splitting the list in half and presenting the two halves as a
  two-column table. Use tables only to present two-dimensional data—that is,
  material that semantically makes sense to display in rows and columns.
- Avoid tables in the middle of a numbered procedure.

### Multi-paragraph table cells

Any table cell can contain more than one paragraph.

To create multiple paragraphs, use the `p` element rather
than using the `br` element. (The HTML specification
describes which uses of the [`br` element](https://html.spec.whatwg.org/multipage/semantics.html#the-br-element) are legitimate and which aren't.)

Example of a table with some cells that contain more than one paragraph:

| Attribute name | Type | Description                                                                                                   |
| -------------- | ---- | ------------------------------------------------------------------------------------------------------------- |
| `href`         | HTML | Defines the URL for a link. For example, go to the `<a href="https://www.google.com">Google Search</a>` page. |
| `src`          | HTML | Defines the path of the image to be displayed. For example, `<img src="kitten.jpg">`.                         |

### Introductory sentences for tables

Introduce tables with a complete sentence that describes the purpose of the table because not all
screen readers preannounce tables. The introductory sentence can end with a colon or a period;
usually a colon if it immediately precedes the table, and usually a period if there's more material
(such as a note paragraph) between the introduction and the table.

Recommended: Change the environment variables
to values for your deployment, as listed in the following table:

For more information, see the [Tables](https://developers.google.com/style/accessibility#tables) section of the "Accessibility" page.

### Table placement

- When introducing a table, use a complete sentence and try to refer to the
  table's position, using a phrase like _the following table_ or _the preceding table_.
- Don't put a table in the middle of a sentence.
- Avoid using footnotes when possible. If your table does refer to footnotes, place them
  immediately following the table. For more information, see [Footnotes](https://developers.google.com/style/footnotes).

### Table captions

If your document contains only one table, the table doesn't need a caption.
However, be sure to place the table adjacent to the text that refers to it.

If your document contains more than one table in fairly close proximity to
each other, include a caption for each one, using a [`caption` element](https://html.spec.whatwg.org/multipage/tables.html#the-caption-element) as the first child of the `table` element. Start the
caption with a number, in the form "<b>Table _NUMBER_.</b> _DESCRIPTION_". Use sentence case for the caption, but don't place a
period at the end.

When referring to the table from text, refer to it by its number—for example, _... as shown in table 2_. Do not capitalize _table_ unless it starts a sentence.

Your site's CSS determines the styling and placement of the caption.

Recommended:

```
<table>
  <caption><b>Table 1.</b> Prehistoric birds</caption>
  ...
</table>
```

### Table formatting

- Don't add styling to the table element.
- Don't apply a visual style such as a different font, font color, or background color to convey a
  header row or column by itself. Use the `th` element to semantically mark up headers in
  tables.
- Don't merge cells. Don't use `colspan` or `rowspan` attributes.
- Sort rows in a logical order, or alphabetically if there is no logical order.
- If the table is long or complicated—for example, with multiple header rows or columns—consider
  splitting it into multiple tables.
- Don't present new information in tables through images or symbols alone; always provide a
  descriptive `alt` attribute for the image or symbol. For more information, see
  [Alt text](https://developers.google.com/style/images#alt-text).

### Table column heads

- Use sentence case.
- Write concise headings.
- Don't end with punctuation, including a period, an ellipsis, or a colon.
- Use table headings for the first column and the first row only. Use the [`th` element](https://www.w3.org/TR/2014/REC-html5-20141028/tabular-data.html#the-th-element).
- Include the [`scope` attribute](https://www.w3.org/TR/WCAG20-TECHS/H63.html) as appropriate for accessibility.

### Responsive tables

Where possible, use table CSS that adapts to different viewport sizes.

### Link to tables

Where possible, avoid linking to tables; instead, refer to them by table number.

_Source: <https://developers.google.com/style/tables>_

---

## Notes, cautions, warnings, and other notices

To give the reader important or useful information that isn't part of the flow of the text, you
can offset the information with a notice. However, there's [evidence](https://www.nngroup.com/articles/tunnel-vision-and-selective-attention/) that readers skip elements on the page, including notices, that are outside their focus of
interest. If you're not sure whether something should be a notice, write it first in regular text
and then decide if a notice is needed.

Don't use too many notices. When you use multiple notices on a page, they begin to lose their
visual distinctiveness. See if you can convey the information in a different way. This is
especially true if you have two (or more) notices in a row.

Where possible, avoid grouping two or more notices together. If you find it
necessary to do so (for example, a _note_ with a _caution_ inside it, or several _warnings_ one after another), consider reorganizing the content.

### Pick a notice type

The following is a list of commonly used notices.

Note
An ordinary aside or tip. Provides information that is useful but not critical to the reader.
For example, "Generating excessive amounts of traffic to external systems can resemble a
denial-of-service attack." For more information, see [when to use](#when-to-use-a-note-notice-type) and [when not to use](#when-not-to-use-a-note-notice-type) a note notice type.

Caution
Tells the reader to proceed carefully. For example, "We don't recommend using a
broad `0.0.0.0/0` range that would allow all traffic."

Warning
Stronger than a _caution_ notice; it means "Don't do this" or that this step might be
irreversible, such as leading to permanent data loss. If a reader doesn't heed the warning, they
can lose money, lose work, or open themselves to a security breach. For example, "Don't put a
password on the command line; doing so is a security risk."

Success
Describes a successful action or an error-free status. Used only in interactive or dynamic
content; don't use this notice type in ordinary static pages. For example, "You've successfully
deployed an application to GKE."

### When to use a _note_ notice type

Create a _note_ when all of the following are true:

- The information you're sharing is _relevant_ but not
  _necessary_ to what the reader is doing right now. If the reader skips
  the information, they'll still succeed.
- Interrupting the reader at this point is not an obstacle to the reader. For example, your
  _note_ isn't suggesting an alternative that leads the reader down a
  different path.
- The information is not part of the flow of what you're writing—it's not just
  a continuation, a result, or a pointer to additional information.

### When not to use a _note_ notice type

- Don't use _notes_ for [cross-references](https://developers.google.com/style/cross-references).
- Don't use _notes_ to tell the reader about prerequisites or about
  steps they should have taken earlier. Information like this should precede the
  step.
- Don't make a full procedural step into a _note_.
- Don't use _notes_ to provide information that's necessary for the
  reader to succeed.
- Don't use _notes_ for information that's in flow with the preceding
  text. For example, don't use a _note_ to state expected results or to
  include information that simply describes what precedes.

### Examples

Use whatever visual presentation for notices is standard for your site.

If you're writing in HTML and your site doesn't specify what HTML to use for
notices, we recommend using HTML code similar to the following example:

```
<aside class="note"><b>Note:</b> All VPC networks include firewall
rules.</aside>
```

> **Note**: All VPC networks include firewall rules.

> **Caution**: We don't recommend using a subnet that's part of a dynamic route.

> **Warning**: Do not manually edit or delete generated table entries.

> **Success**: You've successfully created a Compute Engine instance.

_Source: <https://developers.google.com/style/notices>_

---

## Footnotes

A footnote is an annotation with additional information usually provided at the end of a page,
chapter, or book. We recommend avoiding footnotes because they aren't accessible and can present
challenges for localization efforts.

Instead of a footnote, consider using the following formats to convey information:

- [Add a cross-reference](https://developers.google.com/style/cross-references).
- [Use a note](https://developers.google.com/style/notices).
- [Put it in a parenthetical](https://developers.google.com/style/parentheses).

If the only way to convey this information is to use a footnote, then use a superscript
number—for example, `<sup>1</sup>`.

Recommended: You want to add a footnote to this sentence.1

1 Put this footnote at the bottom of the page.

_Source: <https://developers.google.com/style/footnotes>_

---

## Cross-references and linking

In general, cross-references link to nonessential information that adds to
the reader's understanding.

When used well, cross-references help readers navigate and understand
documentation. But cross-references can easily become disruptive. The guidelines
on this page help you to minimize disruption while providing cross-references
that help your readers.

### Choose links selectively

Be selective about which links you include on a page. Each link creates a
decision for the reader, adding cognitive load. Each link is also a chance for
the reader to leave the page and lose their place. When you include links,
choose the most relevant destination.

#### Provide context on the page

When possible, provide help in context rather than linking elsewhere. For
example, in the following situations, consider providing information on the
page instead of linking:

- Define a term.
- Briefly explain a concept.
- Provide a couple of steps.

As a specific example, if you need readers to understand another product's
software or standards, it's better to link to good documentation elsewhere
than to try to thoroughly document another product's standards in our
documentation. But if a few sentences of basic information is all your readers
need, then it's better to provide that context and save your readers the trip
outside of our documentation.

#### Avoid duplicate links

Generally, within a given page, don't provide duplicate links to the same
destination. Provide the link once in the location where it's most useful to
the reader.

It's OK to add a secondary link in situations such as the following:

- You're linking to a particular section of another page.
- Your page is very long and the duplicate links are far apart.
- There are multiple entry points to the document that you're linking from.
  For example, if a page contains a procedure section and a troubleshooting
  section, then you might need to provide the same link in both of those
  sections.

#### Provide the most relevant link

When you link, link to the most relevant page on a site. Link to the most
relevant heading on a page. Avoid providing multiple links that do the same
job.

#### Link to third-party sites

Our documentation often relies on the reader knowing something about
third-party standards or software. In such cases, it's better to provide a
link rather than attempt to thoroughly document someone else's standards. But
as with all links, when possible, provide brief information on the page
instead of linking.

### Write descriptive link text

For the link text itself, use short, unique, descriptive phrases that provide
context for the material that you're linking to.

Effective link text helps to improve accessibility and scannability. Different
readers experience links differently. For example, users of screen reader
software often jump from one link to the next without reading the words in
between. Other readers visually scan a document to find relevant links.

Sometimes you have to rework a sentence to include a phrase that makes good
link text.

#### Two options for effective link text

For your link text, use either the exact page title or a descriptive phrase, as
described in the following sections.

##### Page titles as link text

One option for effective link text is to match the link text to the page
title or heading that you're referencing.

For more information about how to capitalize the page title in a
cross-reference, see [Capitalization in references to titles and headings](https://developers.google.com/style/capitalization#capitalization-in-references-to-titles-and-headings).

Recommended: For more
information, see [Load balancing and scaling](https://cloud.google.com/compute/docs/load-balancing-and-autoscaling).

##### Descriptive phrases as link text

Another option for effective link text is to use a description of the
destination page, capitalized as if it's part of the sentence.

When you write a descriptive phrase as link text, help readers quickly
determine whether the link is relevant to them:

- Place important words at the beginning of the link text.
- Don't use the same link text in the same document for different target
  pages.
- Keep link text short where possible.
  Don't write lengthy link text such as a sentence or short paragraph.

Recommended: You can use
Cloud Scheduler and Cloud Functions to manage [task scheduling on Compute Engine](https://cloud.google.com/blog/products/gcp/reliable-task-scheduling-on-google-compute-engine).

Not recommended: See [this blog post](https://www.blog.google/products/pixel/pixel-4/).

#### Avoid vague link text

Write link text that makes sense without the surrounding text.
Don't use phrases such as _this document_, _this article_, or _click here_.

Recommended:
For more information, see [Make headings into link targets](https://developers.google.com/style/headings-targets).

Not recommended:
Want more? [Click here!](https://developers.google.com/style/headings-targets)

Not recommended:
For more information,
see [this document](https://developers.google.com/style/headings-targets).

#### Avoid URLs as link text

In general, don't use a URL as link text. Instead, use the page title or a
description of the page.

Recommended:

```
For more information about protocols, see <a href="http://www.w3.org/Protocols/rfc2616/rfc2616.html">HTTP/1.1 RFC</a>.
```

Not recommended:

```
See the HTTP/1.1 RFC at <a href="http://www.w3.org/Protocols/rfc2616/rfc2616.html">http://www.w3.org/Protocols/rfc2616/rfc2616.html</a>.
```

**Exception**: In some legal documents (such as some Terms of Service documents), it's
okay to use URLs as link text.

#### Include abbreviations in link text

If the text includes an abbreviation in parentheses, include the long form
and the abbreviation in the link text.

Recommended: [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine/docs)

Not recommended: [Google Kubernetes Engine](https://cloud.google.com/kubernetes-engine/docs) (GKE)

#### Link to commands

If the text includes a command or another element usually conveyed with
code font, include the description of the code element with the link text,
unless doing so is awkward or redundant. For more information about elements
that appear in code font, see [Code in text](https://developers.google.com/style/code-in-text).

Recommended: To create an
instance with a custom hostname, run the `gcloud instances create` command with the [`--hostname` flag](https://cloud.google.com/compute/docs/instances/custom-hostname-vm#gcloud).

Not recommended: To create
an instance with a custom hostname, run the `gcloud instances create` command with the [`--hostname`](https://cloud.google.com/compute/docs/instances/custom-hostname-vm#gcloud) flag.

Recommended: This service
supports the [`GET`](<>), [`HEAD`](<>),
and [`OPTIONS`](<>) methods.

Not recommended: This
service supports the [`GET` method](<>), [`HEAD` method](<>), and [`OPTIONS` method](<>).

### Write link introductions ("For more information")

When you dedicate a separate sentence to a cross-reference, introduce the
cross-reference using consistent language—specifically, use the phrase "For more
information, see..." or "For more information about..., see... ."

Include the "about..." clause when the link text or surrounding context
doesn't clearly indicate why you're referring the reader to this information.
For more information, see the [Clarify the purpose of a link](#clarify-purpose) section of this document.

Don't use _on_ instead of _about_.

Use _see_ to refer to links and cross-references. For more information, see [see](https://developers.google.com/style/word-list#see).

Recommended: For more information, see [Load balancing and scaling](https://cloud.google.com/compute/docs/load-balancing-and-autoscaling).

Recommended: For more information about
task scheduling, see [Reliable task scheduling on Google Compute Engine](https://cloud.google.com/blog/products/gcp/reliable-task-scheduling-on-google-compute-engine).

Not recommended: For more information on
indexes, see [Manage indexes](https://cloud.google.com/firestore/docs/query-data/indexing).

### Clarify the purpose of a link

Make sure that the surrounding context or the link text itself clearly
indicates why you're referring the reader to this information. Make the
explanation specific, but don't repeat the link text.

If you're introducing a cross-reference with "For more information..."
phrasing, then you can do this by adding an "about..." phrase. For more
information, see the [Write link introductions](#link-introductions) section
of this document.

Recommended: For more
information about authentication and authorization, see [Using OAuth 2.0 to access Google APIs](https://developers.google.com/identity/protocols/OAuth2).

Recommended: If your
sample dump file is in a CSV, Avro, or Parquet file format, then [load the file to BigQuery and copy to Spanner](https://cloud.google.com/spanner/docs/load-sample-data) using reverse ETL.

### Explain unexpected link behavior

If a link goes to an unexpected destination or behaves in an unexpected way,
then provide that context. The following are a few such situations:

- **Links that download files and open emails.** If a link
  downloads a file or opens an email, then make that clear in the link text, and
  mention the file type.

  Recommended: For more
  information, [download the security features PDF](https://www.example.com/security.pdf).

  Recommended:

```
<a href="mailto:support@example.com">send email to Technical Support</a>
```

- **Links to sections on the same page.** When you're
  linking to another section on the same page, let the reader know that the link
  takes you to a different section of the same page. Use a standard phrase to clue
  readers in if you use an on-page link.

  Recommended: For more
  information, see the [Write descriptive link text](#descriptive-link-text) section of this document.

- **Links to sections on another page.** When you're linking
  to a section heading on another page, use the same wording and formatting as you
  do in a regular cross-reference.

  If the title of the section that you're linking to is identical to a
  title on the source page, add context to the cross-reference.

  Recommended: For more information, see [Create a table](https://cloud.google.com/bigtable/docs/managing-tables#create-table).

  Recommended: For more information, see [Install libraries](#different-page) in "Building new audiences based on existing customer lifetime value."

- **Links that open in a new tab.** For more information, see the [Open links in the current tab](#current-tab) section of this
  document.

- **Links that go to a different domain or server.** For more
  information, see the [Don't use external link icons](#external-link-icons) section
  of this document.

### Open links in the current tab

Don't force links to open in a new tab or window. Let the reader decide how
to open links.

In the rare situation that a link needs to open in a new tab or window, let
the reader know that the link opens differently than expected.

Recommended:

```
<a href="/style/accessibility">Accessible content</a>
```

Recommended:

```
<a href="/style/accessibility" target="_blank">Accessible content (opens in a new tab)</a>
```

Not recommended:

```
<a href="/style/accessibility" target="_blank">Accessible content</a>
```

### Don't use external link icons

Don't use an external link icon to indicate that the link goes to a different
domain or server. If you think it's important to inform the reader that they're
leaving a Google domain, mention it in the text and don't rely on an icon.

Recommended: For
more information, see [OS-level virtualization](https://en.wikipedia.org/wiki/Operating-system-level_virtualization).

Sometimes OK:
For more information, see the Wikipedia page about [OS-level virtualization](https://en.wikipedia.org/wiki/Operating-system-level_virtualization).

Not recommended:
For more information, see [OS-level virtualization](https://en.wikipedia.org/wiki/Operating-system-level_virtualization).

### Punctuation around link text

If you have punctuation immediately before or after a link, put the
punctuation outside of the link tags where possible.

Recommended:

```
For more information, see <a href="#Test">Test your code</a>.
```

Not recommended:

```
For more information, see <a href="#Test">Test your code.</a>
```

### Quotation marks and italics

When a cross-reference is a link, don't put the link text in quotation marks.

Recommended: For more
information, see [Meet Android Studio](https://developer.android.com/studio/intro/index.html).

Recommended: Learn
about [what's new in Android Wear 2.0](https://android-developers.googleblog.com/2017/02/AndroidWear2.html).

Not recommended: For
more information, see ["Meet Android Studio"](https://developer.android.com/studio/intro/index.html).

In the rare case when a cross-reference isn't a link, use italics or
quotation marks as appropriate.

- For an unlinked reference to a document section, short work, or part
  of a series—such as an episode in a web series—use quotation marks.

Recommended: For more
information, see "Describing system versions" in the following section.

- For an unlinked reference to the title of a full-length work—such as a
  book, movie, or web series—use italics.

  Recommended: ...see _The Chicago Manual of Style_.

### Avoid external links in your documentation navigation

In a documentation set's navigation, such as a table of contents, we
recommend against linking outside of the documentation set. Instead, include the
link in a page within the documentation.

If you need to link outside of your documentation set from your navigation,
then make sure it's clear to the reader that they'll be leaving that document
set.

### Style link text

If you write sitewide CSS for your website, apply standard styling to link
text. This helps readers find links in your content.

- **Contrast link text color and regular text color.** To
  help readers see links, link text should be distinguishable from the rest of the
  text on the page.
- **Underline link text, and don't underline non-link text.** When readers scan a page, a horizontal line cuts through the vertical line of
  scanning and helps readers find links.
- **Make visited links change color.** Use color-blind-friendly
  color changes to help readers differentiate links that they've followed against
  links that they haven't followed. This helps readers navigate your site
  effectively without revisiting content that they've already read.

_Source: <https://developers.google.com/style/cross-references>_

---

## Diagrams, figures, and other images

Use images only when they provide useful visual explanations of information
that is otherwise difficult to express with words. For screenshots, be discreet. Only capture UIs
that are important to the discussion.

### Create and save images

Consider the following guidelines for images:

- To create a diagram, use any drawing tool.

- To take a screenshot, use any screen capture tool.

- Don't use images of text, code samples, or terminal output. Use actual
  text.

- For diagrams (architectural drawings, flow diagrams, and so on, as
  distinct from screenshots), use the following guidelines:

* Use SVG files if possible because SVGs stay sharp when you zoom in on
  the image.
* If you don't have an SVG file, then
  save your image as a PNG file unless you have a good reason to use a
  different format.
* Regardless of the format, don't use a transparent background. In
  particular, a transparent background can cause issues if you use the
  Devsite lightbox widget.

- For animations and videos, don't use animated GIF. Instead, use a more resource-efficient
  format (such as MP4).

- Be consistent for a given document or doc set in what operating system you use for
  screenshots—for example, take all screenshots on macOS or on Linux. Similarly, be consistent
  in how your screenshots look. If you take screenshots that include drop shadows of the
  main window, make sure that similar screenshots are consistent.

- Crop screenshots to show the relevant information. For example, don't include the
  full window if you just want to show a single button or menu item. Cropping helps the
  reader focus on the information that you want to convey in the screenshot, and it can help
  future-proof the screenshot if other parts of the UI change.

- Don't include personally identifying information (PII) in
  screenshots.

  If a source screenshot includes PII, hide it with a solid-color overlay
  with 100% opacity. Don't rely on blurs, mosaic effects, or similar
  image-processing effects to obscure PII; such effects can be reversed to reveal
  the original information.

  If you're exporting an image to a format that can include information on
  separate layers (for example, PDF or TIFF), flatten the image on export.

- Don't use image maps. Instead, provide a list of text references following the image. Reasons
  to avoid image maps include the following:

* Image maps are problematic for accessibility.
* Browser implementation for image maps varies, and image maps might not function correctly on
  mobile devices due to scaling.
* The technical complexity of creating and maintaining a coordinates overlay is often
  prohibitive.
* Use descriptive filenames for your image files. For more information, see [Filenames and file types](https://developers.google.com/style/filenames).

### Text associated with images

There are differences between alt text, figure captions, and figure
descriptions. Independently of these elements, an introductory sentence should precede most images.
The sentence can end with a colon or a period; usually a colon if it immediately precedes the image,
usually a period if there's more material (such as a note paragraph) between the introduction and
the image. Always introduce an image with a complete sentence. You don't need to introduce
screenshots that immediately follow procedural text that describes a UI.

#### Example

The following diagram shows how you can apply bounded contexts to an existing
ecommerce application:

![Bounded contexts are applied to an application.](https://cloud.google.com/architecture/images/microservices-architecture-refactoring-monoliths-bounded-contexts.svg)

_**Figure 1**. Application capabilities are separated into bounded contexts that
migrate to services._

In figure 1, the ecommerce application's capabilities are separated into
bounded contexts and migrated to services as follows:

- Order management and fulfillment capabilities are bound into the
  following categories:
  - The order management capability migrates to the order service.
  - The logistics delivery management capability migrates to the
    delivery service.
  - The inventory capability migrates to the inventory service.
- Accounting capabilities are bound into a single category:
  - The consumer, sellers, and third-party capabilities are bound
    together and migrate to the account service.

#### HTML

```
      <p>The following diagram shows how you can apply bounded contexts to an existing ecommerce application:</p>
<figure id="bounded">
  <img src="https://cloud.google.com/architecture/images/microservices-architecture-refactoring-monoliths-bounded-contexts.svg"
    alt="Bounded contexts are applied to an application.">
  <figcaption><b>Figure 1.</b> Application capabilities are separated into bounded
  contexts that migrate to services.</figcaption>
</figure>
<div id="descr-1">
<p>In figure 1, the ecommerce application's capabilities are separated into
bounded contexts and migrated to services as follows:</p>
<ul>
  <li>Order management and fulfillment capabilities are bound into the
    following categories:
  <ul>
    <li>The order management capability migrates to the order service.</li>
    <li>The logistics delivery management capability migrates to the
        delivery service.</li>
    <li>The inventory capability migrates to the inventory service.</li>
  </ul>
  </li>
  <li>Accounting capabilities are bound into a single category:
  <ul>
  <li>The consumer, sellers, and third-party capabilities are bound
        together and migrate to the account service.</li>
  </ul>
  </li>
  </ul>
</div>
```

#### Markdown

```
The following diagram shows how you can apply bounded contexts to an existing ecommerce application:

![Bounded contexts are applied to an application.](https://cloud.google.com/architecture/images/microservices-architecture-refactoring-monoliths-bounded-contexts.svg)

**Figure 1.** Application capabilities are separated into bounded contexts that migrate to services.

In figure 1, the ecommerce application's capabilities are separated into bounded contexts and
migrated to services as follows:

-   Order management and fulfillment capabilities are bound into the following categories:

    -   The order management capability migrates to the order service.
    -   The logistics delivery management capability migrates to the delivery service.
    -   The inventory capability migrates to the inventory service.

-   Accounting capabilities are bound into a single category:

    -   The consumer, sellers, and third-party capabilities are bound together and migrate to the
        account service.
```

#### Alt text

_Alt text_ is a concise description of the image that can replace the image in
situations where the image isn't visible, such as people using screen
readers, people using text-only browsers, or people who have a low-bandwidth
internet connection. Alt text should consider the context of the image, not just its content.
The presence of `alt` attributes helps support [navigability](https://web.dev/labels-and-text-alternatives/#include-text-alternatives-for-images-and-objects) in screen readers, [markup validation](https://validator.w3.org/docs/help.html#validation_basics),
and [search engine optimization](https://support.google.com/webmasters/answer/7451184#usealtattribute).
For more information, see [alt attribute](https://wikipedia.org/wiki/Alt_attribute).

However, if the image is decorative (not informative) or it's
provided only as a visual aid for information that is already expressed in text,
then provide empty alternative text (`alt=""`) so it's ignored
by assistive technologies. Examples of decorative images include the following:

- A screenshot of the UI showing a user how to fill out fields.
- Icons in the UI.
- Images whose purpose is to make the page more visually appealing.

When using the `img` element, the `alt` attribute is required,
even if its assigned value is an empty string (`alt=""`). If you exclude the `alt` attribute completely, then screen readers might instead read the filename aloud.

As per the [HTML specification](https://html.spec.whatwg.org/dev/images.html#general-guidelines), "the most general rule to consider when writing alternative
text is the following: the intent is that replacing every image with the text of
its `alt` attribute does not change the meaning of the page." So if the
alternative text is redundant with surrounding text or it's not useful to
visually impaired readers, use the empty tag.

Consider the following when writing alt text:

- Don't include phrases like _Image of_ or _Photo of_.

- Include punctuation. When screen readers encounter punctuation, they
  pause before continuing.

- Use consistent alt text for repeated instances of an image, such as
  controls, status indicators, or icons that appear multiple times in your
  document.

- When possible, avoid using all-caps in alt text. Some screen readers read
  capital letters as each letter individually.

- Introduce diagrams in the text, not in the alt text.

- Don't use figure captions to replace alt text.

- Use full sentences or a noun phrase.

  Recommended: `alt="Architecture of
    an app that's built with Apps Script."`

  Recommended: `alt="A card
        message."`

- Write short, descriptive alt text in 155 characters or less.

- If the image presents more useful information than you can fit in the 155 character limit,
  include a brief summary of the image in the `alt`attribute and also include a more
  extensive description of the image in the text.

- Alt text should consider the context of the image, not just its content.

#### Figure captions

_Figure captions_ are concise and comprehensive summaries of a figure or image. Figure
captions (and figure numbers) are optional. When using the [`figcaption` element](https://html.spec.whatwg.org/multipage/semantics.html#the-figcaption-element), you must wrap both the `figcaption` and `img` elements in the [`figure` element](https://html.spec.whatwg.org/multipage/semantics.html#the-figure-element) to ensure that the figure caption is properly associated with the image.

Consider the
following when writing figure captions:

- Figure numbers are optional. If you use figure numbers, use the form "<b>Figure _NUMBER_.</b> _DESCRIPTION_."

  Recommended: **Figure 1**. Application
  capabilities are separated into bounded contexts that migrate to services.

  Recommended: Application
  capabilities are separated into bounded contexts that migrate to services.

  Not recommended: Bounded contexts

- We recommend using complete sentences in figure captions.

- Always use end punctuation for captions.

- When you refer to a figure, don't use spatial descriptions such as "the image above."

  - If you used figure numbers, consistently refer to the figure by number. For example:
    "... as shown in figure 1." Don't capitalize the word _figure_ in a reference to a figure,
    except at the start of a sentence.
  - If you can't use figure numbers, show the figure again, for accessibility and user experience
    reasons.

- Don't include the figure caption in a sentence referencing the
  figure.

#### Figure descriptions

A _figure description_ is text that provides a more detailed explanation of information
represented by a figure. In other words, the information that is conveyed in the image is captured
in the text. Any new information should be conveyed through text and not introduced in
a figure or image.

Consider the following when writing figure descriptions:

- Create text that conveys the same information as the figure.
- Use when a figure caption doesn't convey the purpose or complete information of the figure.
- Use punctuation in figure descriptions.

#### Text in figures

In most cases, avoid embedding explanatory text in screenshot graphics; text
that's incorporated into a graphic hurts accessibility and searchability, and
increases localization costs if figures are localized. If you must embed text in
an image, then be sure to also provide the same information in a form that
people with visual disabilities can use, such as a figure description.

When you must include text in figures and images, use the following
guidelines:

- Keep text brief. Avoid complete sentences and punctuation when
  possible.

- Don't embed figure descriptions or captions in the figure or image.
  Instead, put figure descriptions and captions in text following the figure.

- Don't create new abbreviations to condense text.

- Use sentence case. Follow guidelines for [capitalization for titles and headings](https://developers.google.com/style/capitalization#capitalization-in-titles-and-headings_1).

- Use numbered callouts in figures to help you write a figure description,
  but don't use callouts for detailed annotations in the image.

- Use full trademarked product names.

#### Accessibility resources

For more information about the accessibility of diagrams and screenshots, see the following
resources:

- [Web Content Accessibility Guidelines (WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/glance/)
- [General text alternative guidelines from WCAG](https://www.w3.org/WAI/WCAG21/quickref/?showtechniques=111#text-alternatives)
- [Using `alt` attributes for `img` elements](https://www.w3.org/WAI/WCAG21/Techniques/html/H37.html)
- [Providing a long description in text near the non-text content](https://www.w3.org/WAI/WCAG21/Techniques/general/G74.html)
- [Complex images](https://www.w3.org/WAI/tutorials/images/complex/)

### High-resolution images

Modern browsers can use high-resolution images if they are available; this
makes the images look better on high-resolution displays.

To provide a high-resolution image, use the `img` element's `srcset` attribute in addition to the standard `src` attribute. The `srcset` attribute lets you specify
different image assets for different screen resolutions. It accepts a
comma-delimited set of image URLs, with the target screen resolution specified
by a size qualifier: `1x` meaning the "standard" resolution, `2x` meaning "double" the resolution, and so on.

If a web browser supports the `srcset` attribute, it selects an
image from the specified images that's an appropriate resolution for the current
display. If the browser doesn't support the `srcset` attribute, it
uses the image in the `src` attribute. Consequently, you must always
still include the `src` attribute.

For example, to provide both a standard resolution image and a
double-resolution image, add a `srcset` attribute and specify both `1x` and `2x` image assets:

```
<img src="/assets/images/skateboard.png"
  srcset="/assets/images/skateboard.png 1x,
  /assets/images/skateboard_2x.png 2x"
  width="375" alt="" />
```

- The `width` attribute matches the CSS pixel size used for the
  page dimensions. (The height is automatically calculated based on the width and
  the image's proportions; _don't_ state it explicitly.)
- Set the `src` attribute to point to the standard-resolution
  (`1x`) image, _not_ the `2x` version. (Almost
  everyone who has a high-resolution screen also has a modern browser that can
  recognize the `srcset` attribute. The `src` attribute is
  mainly used by older browsers on low-resolution devices, which should download
  the smaller, low-resolution image.) Even if your original image is the
  higher-resolution image, set the `src` attribute to use the
  standard-resolution version; don't force a reader using a low-resolution screen
  to download a graphic that's higher-resolution than they can view.
- The filename for the double-resolution image (in this case,
  `skateboard_2x.png`) can be anything—it's the "` 2x`"
  value following the filename that informs the browser which resolution the file
  is. But it's a good idea to use a filename of the form
  `*BASENAME*_2x.*EXTENSION*` to make clear to human
  readers that it's a double-resolution version of
  `*BASENAME*.*EXTENSION*`.
- The double-resolution image must be exactly twice the width and height of
  the standard image, give or take a pixel. (For example, it's okay for the
  double-resolution image to be 875x500 and the standard size to be 438x250.)
- Don't scale up an existing `1x` image to make the
  `2x` version. If all you have is the `1x` version, then
  use it alone. But if you're starting with a high-resolution image (at
  `2x` resolution or better), then you can scale it down to appropriate
  dimensions for `1x` and `2x`.
- Currently, only an additional `2x` image is necessary, but
  someday screen PPI (pixels per inch) may increase further.
  So the `srcset` attribute supports further alternative sizes, each
  specified by the appropriate multiplier, such as `3x` or
  `4x`.
- A browser that supports the `srcset` attribute uses only the
  images provided in that attribute—it ignores the `src` attribute. So
  specify all available image resolutions in the `srcset` attribute.

> **Note**: If you frequently revise an image, then you can use the `2x` image for both the `src`
> and `srcset` attributes, rather than maintaining multiple sizes of the image. If things stabilize
> and you no longer need to revise the image, then you can add a `1x` version.

For more information, see the HTML specification for the `[img](https://html.spec.whatwg.org/multipage/embedded-content.html#the-img-element)` element.

### Layout of images on a page

Consider the following guidelines for adding images to pages:

- Don't try to place an image manually; for example, don't use a
  `style` attribute or other workarounds to control the image's
  left/right justification or the margins around the image. Instead, use
  your site's standard CSS image styles.

- Don't make your image too small. It's fine for an image to take up the
  full width of a page.

- Consider how the image will look when printed out.

- In general, don't use an image that's wider than the column it appears
  in. On [developer.android.com](https://d.android.com), for
  example, the main-body column is 856px wide, so use images that are no wider
  than that. In that context, the high-resolution 2x version of the image should
  be no wider than 1712px.

  - Screenshots at full resolution often take up too much space on the
    page, so you may have to resize them.
  - If the graphics were created by someone else (for example, a designer
    on the team you're supporting), it may be fairly trivial for them to provide you
    with images at the appropriate size. If the images they provide are wider than
    856px, ask the designer if they can provide the relevant graphics as
    856px/1712px pairs.

- Don't link to the figure from within the same page unless it's a very
  long page and you're linking to it from quite far away on the page.

- Don't center the image on the page.

- Don't put an `img` element inside a `p` element.

_Source: <https://developers.google.com/style/images>_

---

## Markdown versus HTML

Use either HTML or Markdown. Some of this style guide assumes that you're using HTML. If you're
using Markdown, details like what HTML elements to use in various contexts might be
irrelevant to you.

Markdown is easier to write than HTML, and it's easier for most humans to
read Markdown source than HTML source. However, HTML is more expressive
(particularly regarding [semantic tagging](https://developers.google.com/style/semantic-tagging))
and can achieve some specific effects that might be difficult or impossible in
Markdown. For example, you might have to switch to using the HTML `code` element
for special characters in code such as nonbreaking spaces.

In the end, which one to use is primarily a matter of personal preference;
however, if your team or your document template already uses one or the other,
it may be best to use whatever they use.

_Source: <https://developers.google.com/style/markdown>_

---

## HTML formatting

Follow Google's [HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html). Exception: don't leave out optional elements.

In particular, following are some basic guidelines from that style guide,
which generally apply to other documentation source files, too (such as YAML and Markdown):

- **Don't use tabs** to indent text; use spaces only. Different text
  editors interpret tabs differently, and some Markdown features expect spaces
  and not tabs.
- **Indent by two spaces** per indentation level.
- **Use all-lowercase** for elements and attributes.
- **Don't leave trailing spaces** at the end of a line (except as
  needed for Markdown).

### Line length

Break lines at 80 characters except in the following cases:

- Information in a `meta` element at the beginning of a file must be on a single line,
  so those lines can be as long as needed.
- If a URL in a link has a line break, the link won't work.
  If a URL is longer than 80 characters (quite common), you're stuck with it. In that case,
  put the URL on its own line with the `href` attribute to make it
  easier to review the text before and after, as the following example shows:

```
You can find more information in
<a href="https://example.com/long-url/johan-gambolputty-de-von-ausfern-…-von-hautkopf-of-ulm.html"
>his biography.</a>
```

Break code snippets (in `<pre>` blocks) at 80 characters:

- Older files might use different line lengths. If you're making small changes to a file that
  has a consistent line length other than 80 characters, then make your changes conform to that
  file's line length rather than reformatting the whole file.
- When adding line breaks, make sure that you don't change the meaning of the code! If you're
  not familiar with the programming language, ask for help from someone who is. But sometimes you
  just can't avoid a long line.

_Source: <https://developers.google.com/style/html-formatting>_

---

## HTML and semantic tagging

Use HTML elements for the purposes that they were designed for. For example, when
you give the title of a standalone work (such as a book or a movie), mark it
with a [`cite` element](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-cite-element). For more information about semantic tagging, see [Semantics in HTML](https://developer.mozilla.org/en-US/docs/Glossary/Semantics#Semantics_in_HTML) on the MDN web documents site.

In situations where there are no semantically relevant HTML elements, use CSS
or the few HTML elements that convey visual style without semantics.

### Visual formatting

If you want to achieve specific visual results, don't use HTML elements that
convey different semantics.

In particular, follow these guidelines:

- Don't use frames or tables for layout; instead, use your site's CSS to lay out the page.

- Don't use the heading elements (such as `h1` and
  `h2`) to visually style text; instead, use those elements
  only for hierarchically structured headings, and use CSS for visual style.

- The [`em` element](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-em-element) indicates emphasis, not italics as such. Don't use it to italicize
  something that isn't meant to be emphasized; instead, use the [`i` element](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-i-element) for non-emphasis italics.

- The [`strong` element](https://html.spec.whatwg.org/multipage/semantics.html#the-strong-element) indicates strong importance, not bold as such. To bold a word that
  doesn't merit strong importance, use the [`b` element](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-b-element).

- The [`br` element](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-br-element) is intended "only for line breaks that are actually part of the content,
  as in poems or addresses." Don't use it to adjust the spacing between lines.
  Instead, use elements like `p` to semantically mark the
  text, and use CSS to adjust line spacing.

_Source: <https://developers.google.com/style/semantic-tagging>_

---

## Example domains and names

Don't use real domain names, email addresses, or people's names in your examples. Don't reveal
personally identifiable information (PII), such as domain names, email addresses,
phone numbers, people's names, project names, or credit card numbers. You can
provide imaginary (fictitious) examples or use [placeholders](https://developers.google.com/style/placeholders), like `*USER_ID*` or `*EMAIL_ADDRESS*`.

### Example domain names

When you need a generic domain name in an example, use example.com,
example.org, or example.net. These domains are reserved by the [Internet Assigned Numbers Authority](https://www.iana.org/domains/reserved) for use in documentation.

Alternatively, you can use any of the following domain names, which Google
owns specifically for use in documentation:

- altostrat.com
- examplepetstore.com
- example-pet-store.com
- myownpersonaldomain.com
- my-own-personal-domain.com
- cymbalgroup.com

If you need an example domain name for an internationalized domain name, use one of the [IDN Test TLDs](https://en.wikipedia.org/wiki/IDN_Test_TLDs) and copy from the
"URL of the test site" column.

Recommended: Hostnames that include non-ASCII characters
are encoded using Punycode. For example, `http://مثال.إختبار` is encoded as `xn--kgbechtv`.

### Example email addresses

If you need a generic email address, use one of the domains listed
in [Example domain names](#example-domain-names) and one of the names listed in [Example person names](#example-person-names)—for
example, dana@example.com. It's OK to use generic addresses like support@example.net. Don't use
person names, product names, or made-up names in email addresses.

### Example person names

When you need to include example given names in your documentation,
draw from the following list:

- Alex
- Amal
- Ariel
- Bola
- Charlie
- Cruz
- Dana
- Dani
- Hao
- Ira
- Izumi
- Jie
- Kai
- Kalani
- Kim
- Kiran
- Lee
- Lucian
- Luka
- Mahan
- Noam
- Nur
- Quinn
- Raha
- Rosario
- Sasha
- Tal
- Taylor
- Tristan
- Yuri

#### Example person surnames

When you need to include example surnames in your documentation, use an initial
after the given first name—for example, Quinn N. or Dana A.

#### Further notes about example people

When you are writing about people, even fictitious or hypothetical people, it's important to
remember that your work will be read by real people whom we want to feel respected, valued, and
welcomed.

Your audience includes different kinds of people, including people with different jobs,
cultural contexts, and backgrounds, so strive to include a variety of people in your examples
as well.

Use the [gender-neutral singular pronouns](https://developers.google.com/style/pronouns#gender-neutral-pronouns) _they_, _their_, and _theirs_ whenever possible, and avoid specifying gender unless it is integral to the information you
are communicating. Avoid examples that depend on a gender binary. However, if you do write an
example that requires specifying gender, consider that some of the names on this list may imply
a particular gender in a given language or culture, and check to ensure that any names you have
chosen do not carry a conflicting gender connotation.

Be mindful of assumptions and stereotypes that might be reinforced through hypothetical
examples, such as:

- Job roles and levels, such as executive, that might be disproportionately assigned
  particular gendered personas.
- Job roles, such as developer or engineer, that might be disproportionately assigned
  particular ethnic personas.

We recommend using names from the preceding list in most documentation. Some security
documentation uses the [Alice and Bob](https://wikipedia.org/wiki/Alice_and_Bob#Cast_of_characters) cast of characters. Don't use the Alice and Bob characters unless you're writing documentation that
refers to a technical specification that uses those characters. If you use the Alice and Bob
characters in a document, use only names from that cast of characters.

For further guidance, see the section of this guide on [writing inclusive documentation](https://developers.google.com/style/inclusive-documentation).

### Example company names

When you need a company name in an example, use Example Organization. If you need to
differentiate between two different fictional companies, you can add a description to the company
names. For example, you can use Enterprise Example Organization and Startup Example
Organization.

### Example phone numbers

Most phone numbers in our documentation are examples. To show an example phone number, use a US
number in the range 800‑555‑0100 through 800‑555‑0199. That range is
reserved for use in examples and in fiction.

Never use a real phone number in examples.

For information about formatting, see [Format phone numbers in HTML or Markdown](https://developers.google.com/style/phone-numbers#format-phone-numbers).

### Example IP addresses

When you need an IPv4 address in an example, such as in a log, use one of the [RFC 5737](https://tools.ietf.org/html/rfc5737) addresses that are
reserved for use in documentation:

- `192.0.2.0` through `192.0.2.255`
- `198.51.100.0` through `198.51.100.255`
- `203.0.113.0` through `203.0.113.255`

For IPv4 address ranges, use the following examples:

- `192.0.2.0/24`
- `198.51.100.0/24`
- `203.0.113.0/24`

When you need an IPv6 address, use values from the [RFC 3849](https://tools.ietf.org/html/rfc3849) range. Example IPv6 addresses include
the following:

- `2001:db8::`
- `2001:db8:ffff:ffff:ffff:ffff:ffff:ffff`
- `2001:db8:1:1:1:1:1:1`
- `2001:db8:2:2:2:2:2:2`
- `2001:db8:3:3:3:3:3:3`
- `2001:db8:4:4:4:4:4:4`

For IPv6 address ranges, use the following example:

- `2001:db8::/32`

### Example street addresses

Avoid using real street addresses in examples. Instead, use one of the following fictional
street addresses:

- 1800 Amphibious Blvd.
  Mountain View, CA 94045
- Avenida da Pastelaria, 1903
  Lisbon, 1229-076
- 8 Rue du Nom Fictif
  341 Paris

### Example project names

When you need an example project name, create a name that's meaningful or descriptive.

Ensure that the name is applicable to the reader's environment. Don't use unclear components like `foo`, `bar`, and `baz` in names.

When necessary, use an appended numbering scheme. For example, `staging`, `frontend-development`, `backend-development`, `production-1`, `production-2`.

### Example service account IDs

When you need a unique ID for a service account in an example, use the numeric ID `123456789012345678901`.

Recommended: The allow policy shows the
identifier `deleted:serviceAccount:my-service-account@my-project.iam.gserviceaccount.com?uid=123456789012345678901`.

_Source: <https://developers.google.com/style/examples>_
