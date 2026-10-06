# About

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

| Page                           | Canonical URL                                       | Upstream last updated |
| ------------------------------ | --------------------------------------------------- | --------------------- |
| About this guide               | <https://developers.google.com/style>               | 2026-04-27            |
| Highlights                     | <https://developers.google.com/style/highlights>    | 2025-04-02            |
| Philosophy of this style guide | <https://developers.google.com/style/philosophy>    | 2024-10-15            |
| Third-party content            | <https://developers.google.com/style/other-sources> | 2024-10-15            |

---

## About this guide

This style guide provides editorial guidelines for writing clear and consistent technical
documentation for an audience of software developers and other technical practitioners.

If you're new to the guide and looking for introductory topics about our style, then start with [Highlights](https://developers.google.com/style/highlights), [Voice and tone](https://developers.google.com/style/tone), and [Text-formatting summary](https://developers.google.com/style/text-formatting). Otherwise, use the guide as
a reference document for specific questions. For example, you can look up terms in the [word list](https://developers.google.com/style/word-list).

### Editorial resources

We recommend using the following editorial resources.

#### Reference hierarchy

Use the following references, including this guide, in this order:

1. **Project-specific style**. Follow style guidance specific to your project or product, such
   as necessary exceptions to this guide or terms that are relevant only to your product.

2. **This style guide**. If project-specific style guidelines don't provide explicit
   guidance, then follow this guide.

3. **Third-party references**. If the preceding references don't provide explicit guidance,
   then see these third-party references, depending on the nature of your question:
   | Type of question   | Third-party reference                                                                                                                                                                                          |
   | ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   | Spelling           | Follow [Merriam-Webster.com](https://www.merriam-webster.com/). See also [Spelling](https://developers.google.com/style/spelling).                                                                             |
   | Nontechnical style | Follow [_The Chicago Manual of Style_, 17th edition](https://www.chicagomanualofstyle.org/home.html) (subscription required).                                                                                  |
   | Technical style    | See the [Microsoft Writing Style Guide](https://docs.microsoft.com/style-guide/welcome/). But consider whether Microsoft's guidance applies; some of it might apply only to Microsoft products and interfaces. |

At multiple stages of this hierarchy, it can be helpful to look to established usage. For
example, search your organization's documentation, or check a broad language corpus such
as [Google Ngram Viewer](https://books.google.com/ngrams/).

#### Other editorial resources

You can use additional resources to research and inform your thinking, but don't consider them
part of Google developer documentation style.

Here are some other style guides from the tech community:

- [Apple Style Guide](https://help.apple.com/applestyleguide/)
- [Red Hat supplementary style guide for product documentation](https://redhat-documentation.github.io/supplementary-style-guide/)

### Annotations used in this guide

For guidance that applies only to Android or Google Cloud documentation, look for the following
logos:

- precedes terms and guidelines specific to Android
  documentation.
- precedes terms and guidelines specific to Google Cloud
  documentation.

### Break the rules

> _Break any of these rules sooner than say anything outright barbarous._
>
> —George Orwell,
> "[Politics and the English Language](https://www.orwellfoundation.com/the-orwell-foundation/orwell/essays-and-other-works/politics-and-the-english-language/)"

This guide contains guidelines, not rules. Depart from it when doing so improves your
content.

For example, if we recommend spelling a term as one word, and you determine that the
hyphenated version of a term in your domain is more appropriate for your readers, then
it's fine to use that instead. We acknowledge that sometimes there are competing forms
of the same word in wide use, especially as new terms emerge, and you might have good
reasons for departing from our guidance.

When you depart from this guide, be consistent throughout your document.

_Source: <https://developers.google.com/style>_

---

## Highlights

The style guide covers a lot of material, so the following page provides an overview of its most
important points. For more information about topics on the page, follow the links.

### Tone and content

- [Be conversational and friendly](https://developers.google.com/style/tone) without being
  frivolous.
- [Don't pre-announce anything](https://developers.google.com/style/future) in
  documentation.
- [Use descriptive link text](https://developers.google.com/style/cross-references#descriptive-link-text).
- [Write accessibly](https://developers.google.com/style/accessibility).
- [Write for a global audience](https://developers.google.com/style/translation).

### Language and grammar

- [Use second person](https://developers.google.com/style/person): "you" rather than
  "we."
- [Use active voice](https://developers.google.com/style/voice): make clear who's performing
  the action.
- [Use standard American spelling](https://developers.google.com/style/spelling) and
  punctuation.
- [Put conditions before instructions](https://developers.google.com/style/sentence-structure),
  not after.
- [For usage and spelling of specific words, see the word list](https://developers.google.com/style/wordlist).

### Formatting, punctuation, and organization

- [Use sentence case](https://developers.google.com/style/capitalization) for document
  titles and section headings.
- [Use numbered lists](https://developers.google.com/style/lists#types-of-lists) for sequences.
- [Use bulleted lists](https://developers.google.com/style/lists#types-of-lists) for most other lists.
- [Use description lists](https://developers.google.com/style/lists#types-of-lists) for pairs of related
  pieces of data.
- [Use serial commas](https://developers.google.com/style/commas-serial).
- [Put code-related text in code font](https://developers.google.com/style/code-in-text).
- [Put UI elements in bold](https://developers.google.com/style/ui-elements).
- [Use unambiguous date formatting](https://developers.google.com/style/dates-times).

### Images

- [Provide alt text](https://developers.google.com/style/images#text-associated-with-images).
- [Provide high-resolution or vector images](https://developers.google.com/style/images#high-resolution-images) when practical.

_Source: <https://developers.google.com/style/highlights>_

---

## Philosophy of this style guide

This document discusses some of the principles and philosophy behind this
style guide.

### Intended purpose

This style guide codifies and records our style decisions and describes our
house style. The guide doesn't claim to be objectively correct.

This guide is _not_ intended to do the following:

- Provide an industry documentation standard.
- Compete with other well-known style guides.
- Replace another style guide that you already follow.
- Provide a complete set of basic writing guidelines.
- Provide legal advice. For legal advice, consult a lawyer.

> **Note**: Two disclaimers:
>
> - The guidance in this style guide doesn't limit the changes that Google can make to its
>   documentation.
> - If you don't read a given guideline, then you are still responsible for behaving ethically
>   and lawfully with regard to documentation.

### Explanation of reasons for guidelines

We generally don't explain the reasoning behind most of our guidelines. We
have a couple of reasons for that:

- Many of our decisions are driven by accessibility, localization,
  globalization, and ease of understanding. Giving those reasons as explanations
  everywhere they apply would be repetitive.
- Often, a given guideline is one good option among several; in those cases,
  we sometimes just chose one option for consistency.
- Too much explanation can clutter up a page. Readers most often want a
  brief answer to a specific question, rather than a detailed explanation.

That said, we recognize that it's sometimes useful to know why we made a
given choice, so we've started to include occasional explanations in the [What's new](https://developers.google.com/style/whats-new) page.

_Source: <https://developers.google.com/style/philosophy>_

---

## Third-party content

Don't copy content from another source because it might violate copyright. Instead, paraphrase
and link to their content.

Content includes the following types: text, images, code, logos, and speech.

Recommended: A [recovery point objective (RPO)](https://en.wikipedia.org/wiki/Disaster_recovery#Recovery_Point_Objective),
which is the maximum acceptable length of time during which data might be lost from your app due to
a major incident.

Not recommended: Recovery Point Objective (RPO): "RPO is the
maximum targeted period in which data (transactions) might be lost from an IT service due to a major
incident" (<https://en.wikipedia.org/wiki/Disaster_recovery#Recovery_Point_Objective>).

### Avoid third-party content

Unless you are sure that your company owns the assets, avoid copying from these sources:

- Third-party sources: This list includes documentation, websites, books, blogs, videos, images,
  podcasts, and more.
- Reference sources: Avoid copying from dictionaries, encyclopedias, and Wikipedia.
- Open source product documentation: Open source software (OSS) has different license options,
  which can range from no reuse without attribution to complete freedom to use the material. It's
  not safe to assume that you can reuse this content freely. When in doubt, don't use their
  content.
- GitHub content: Different GitHub users might adopt different licenses for their content. It's
  not safe to assume that you can reuse this content freely. When in doubt, don't use their
  content.

_Source: <https://developers.google.com/style/other-sources>_
