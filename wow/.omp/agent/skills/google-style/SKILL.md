---
name: google-style
type: reference
description: |-
  Write or review developer documentation in Google developer documentation style.
  Trigger:
    - user mentions Google style, Google developer documentation style guide, developers.google.com/style
    - asks to write/rewrite/review developer documentation (READMEs, API reference, guides, tutorials, release notes, UI text)
    - asks how Google style treats a specific word, term, or punctuation mark
license: |-
  Bundled guide content is adapted from the Google developer documentation style guide
  (https://developers.google.com/style), © Google, licensed under CC BY 4.0
  (https://creativecommons.org/licenses/by/4.0/). Code samples are licensed under
  Apache 2.0 (https://www.apache.org/licenses/LICENSE-2.0). Changes are recorded in each
  file in content/.
sections:
  about: skills/google-style/content/about.md
  voice: skills/google-style/content/voice-and-tone.md
  grammar: skills/google-style/content/language-and-grammar.md
  punctuation: skills/google-style/content/punctuation.md
  formatting: skills/google-style/content/formatting-and-structure.md
  code: skills/google-style/content/code-and-api.md
  words: skills/google-style/content/word-list.md
  pages: skills/google-style/content/page-map.md
---

# Google developer documentation style guide

Editorial style for public-facing developer documentation: documentation written for
software developers and other technical practitioners. It covers voice, grammar,
punctuation, formatting, and terminology. It does not define page architecture,
information design, or product terminology.

The guide is a living web document that Google updates continuously. This skill bundles the
text of all 69 pages, retrieved 2026-09-22, in `content/`, adapted for offline reading:
navigation and generated page summaries removed, links absolutized, headings demoted, notices
rendered as blockquotes, pages combined into thematic files. The guidance itself is not
rewritten or summarized, but the bundle is not a facsimile of the published pages. Read the
canonical page when you need exact published wording. Each file in `content/` carries its own
change notice and the license terms; `pages` maps every page to its bundled file and upstream
date.
Canonical source: <https://developers.google.com/style>.

## Scope and authority

Apply sources in this order. This is the guide's own reference hierarchy.

1. **Project-specific style.** A project's own guide, its exceptions, and its product
   terminology win over anything here.
2. **This guide.** Use it when project style is silent.
3. **Third-party references.** Spelling: [Merriam-Webster](https://www.merriam-webster.com/)
   (first listed form). Nontechnical style: _Chicago Manual of Style_, 17th ed.
   Technical style: [Microsoft Writing Style Guide](https://docs.microsoft.com/style-guide/welcome/),
   filtered for Microsoft-specific guidance.

Two constraints on how strictly to apply it:

- These are guidelines, not rules. The guide explicitly says to depart from it when doing
  so improves the content. When you depart, stay consistent within the document.
- Some guidance applies only to Android or Google Cloud documentation. Upstream marks those
  with a platform logo; that logo does not survive text extraction, so check the canonical
  page before applying a rule that reads as platform-specific.

## Agent workflow

Load only the sections the request needs. Full rewrite or style review: load `voice`,
`grammar`, `punctuation`, and `formatting`. Add `code` for anything with code, CLI, API
reference, or UI instructions. Use `words` for every term-level decision.

1. Identify the content type: conceptual, task/procedural, reference, or release notes.
   Type drives heading form, tense, and person.
2. Preserve what the writer cannot change: API and identifier names, UI strings, error
   messages, quoted text, legal text, and approved product names.
3. Draft or rewrite against the core rules below, then the loaded sections.
4. Check every term against `words` before changing it. See the lookup protocol.
5. Verify formatting: heading case and form, list punctuation, code font, bold, links.
6. Report anything the guide leaves to judgment rather than silently deciding it, such as
   audience-dependent jargon, whether to define a term, or project-specific naming.

For a review, return the corrected text plus a concise list of findings. Separate
guide violations from judgment calls that need the project's own style decision.

## Core rules

Memorize these. They are the guide's own highlights, plus the specifics that come up most.

### Voice and tone

| Rule            | Detail                                                                                                                                                                              |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Person          | Second person. "you", not "we".                                                                                                                                                     |
| Voice           | Active. Make clear who performs the action.                                                                                                                                         |
| Tense           | Present. Use _will_ only for genuinely later or asynchronous events, never to describe how a feature works.                                                                         |
| Tone            | Conversational and friendly, not frivolous.                                                                                                                                         |
| Contractions    | Use common two-word contractions, especially negations (_isn't_, _don't_, _can't_): a scanning reader misses a standalone _not_. Never invent contractions or use three-word forms. |
| Future features | Don't pre-announce anything.                                                                                                                                                        |
| Avoid           | Buzzwords, jargon, cutesy phrasing, figurative and ableist language, choppy or long-winded sentences, filler like _please note_ and _at this time_.                                 |
| Global audience | Avoid culturally specific references. Write for readers with varying English ability and for translation.                                                                           |

### Structure

| Rule                | Detail                                                                                                                                                                                  |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Sentence order      | Conditions before instructions: "To view the log, click **Logs**", not the reverse.                                                                                                     |
| Headings and titles | Sentence case, descriptive, unique within the page.                                                                                                                                     |
| Task headings       | Bare infinitive: "Create an instance", not "Creating an instance".                                                                                                                      |
| Concept headings    | Noun phrase that doesn't start with an _-ing_ verb: "Migration to Google Cloud", not "Migrating to Google Cloud".                                                                       |
| Optional sections   | Prefix the heading with _Optional:_.                                                                                                                                                    |
| Procedures          | Numbered steps. Introduce with an imperative statement or a complete sentence, never a partial sentence the steps complete.                                                             |
| Lists               | Numbered for sequences, bulleted for most others, description lists for term/description pairs.                                                                                         |
| List introductions  | A complete sentence ending in a colon or a period. Never a fragment completed by the items. _the following_ is available as a noun phrase.                                              |
| Run-in headings     | After a period, capitalize the description and end it with a period. After a colon, start lowercase; add a period only if the description has a verb or expresses a standalone thought. |
| Links               | Descriptive link text. Put quotation marks and end punctuation outside the link.                                                                                                        |
| Images              | Always provide alt text. Prefer high-resolution or vector images.                                                                                                                       |

### Formatting

| Element                        | Use                                                                                                                                                                                                                                       |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Bold (`**`, `<b>`)             | UI elements, run-in headings, notice labels. Nothing else.                                                                                                                                                                                |
| Italic (`_`, `<i>`)            | Sparingly: terms under discussion, words as words, mathematical variables, version variables (`1.4.x`), full-length work titles outside links. For emphasis prefer italics over bold or underline, and prefer wording that needs neither. |
| Underline                      | Link text only.                                                                                                                                                                                                                           |
| Code font (`` ` ``, `<code>`)  | Code in text, inline code, user input, filenames, class and method names, HTTP status codes, console output, placeholders.                                                                                                                |
| Code blocks (` ``` `, `<pre>`) | Code samples and other blocks of code.                                                                                                                                                                                                    |
| Placeholders                   | ALL_CAPS.                                                                                                                                                                                                                                 |
| Quotation marks                | American style. Titles of short works, unless part of a link.                                                                                                                                                                             |
| Markdown choice                | `**` for bold and `_` for italics: easier for a human to tell apart in source.                                                                                                                                                            |
| Fonts                          | Never override global font type, size, or color, or style text inline. Use semantic HTML or Markdown.                                                                                                                                     |

### Punctuation, numbers, and dates

| Rule         | Detail                                                                                                                                                                                           |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Serial comma | Always.                                                                                                                                                                                          |
| Ampersand    | Never as a conjunction or shorthand for _and_, including in headings and navigation. Exception: naming a UI element or menu that itself uses _&_.                                                |
| Spelling     | Standard American.                                                                                                                                                                               |
| Numbers      | Spell out zero through nine, numerals for 10 and up, with documented exceptions. Spell out all ordinals: _first_, _forty-third_.                                                                 |
| Dates        | Spell out month and weekday, full four-digit year: `January 19, 2017`, `Tuesday, April 27, 2021`. Three-letter abbreviations are acceptable in headings and tables, capitalized, with no period. |
| Times        | 12-hour clock unless the product uses 24-hour. Capitalize AM and PM with one space before. Drop the minutes on round hours: `3 PM`.                                                              |

## Term lookup protocol

The word list is the guide's largest and most consulted page, and it absorbs the spelling
guidance too: `/style/spelling` redirects to it. Never guess a term decision.

1. Search `words` with the regex `^TERM\b.*\[link\]\(#`. Every entry is a plain line of the
   form `term, variant [link](#anchor)`, followed by its guidance on the next lines. Letter
   groups are `####` headings. Plain text search also works, but the regex lands on the
   entry itself rather than on cross-references to it.
2. Follow the entry exactly: preferred form, forbidden form, capitalization, hyphenation,
   and any "don't use" replacement.
3. If the term is absent, fall through the reference hierarchy: project style, then
   Merriam-Webster's first listed form, then authoritative documentation for the technology.
4. For terms coined after 2026-09-22, or when a decision is load-bearing, check the
   canonical page: <https://developers.google.com/style/word-list>.
5. Never change a term inside quoted text, an identifier, a UI string, or an error message.

Terminology also depends on judgment the word list cannot make for you: whether a term is
jargon for your audience, whether to define it, and whether prevailing convention in your
product area differs. See the Jargon and Inclusive language pages in `voice`.

## Bundled reference

| Section       | Contents                                                                                                                                                                                                                                                      |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `about`       | Guide introduction, highlights, philosophy, other sources                                                                                                                                                                                                     |
| `voice`       | Tone, person, voice, tense, contractions, anthropomorphism, jargon, excessive claims, future features, timeless documentation, global audience, accessibility, inclusive language                                                                             |
| `grammar`     | Abbreviations, articles, capitalization, numbers, pluralization, possessives, prepositions, pronouns, sentence and paragraph structure, units, dates and times, phone numbers, mathematical notation, italics for terms, product names, trademarks, filenames |
| `punctuation` | Colons, commas (including serial commas), dashes, ellipses, hyphens, parentheses, periods, quotation marks, semicolons, slashes                                                                                                                               |
| `formatting`  | Text-formatting summary, format examples, headings and targets, lists, tables, notices, footnotes, cross-references and linking, images, Markdown, HTML formatting, semantic tagging, examples                                                                |
| `code`        | Code in text, code samples, code syntax, placeholders, API reference comments, reference verbs, procedures, prescriptive documentation, UI elements                                                                                                           |
| `words`       | The complete word list, A–Z                                                                                                                                                                                                                                   |
| `pages`       | Every page with its canonical URL, bundled location, and upstream last-updated date; plus redirects and the one page not bundled                                                                                                                              |

Use `pages` to map any `developers.google.com/style/...` URL a user cites to its bundled
text, and to see how current that text is. Guidance added upstream after 2026-09-22 is not
in the bundle; the upstream changelog is at
<https://developers.google.com/style/whats-new>.
