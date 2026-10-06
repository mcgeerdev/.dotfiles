# Voice and tone

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

| Page                           | Canonical URL                                                 | Upstream last updated |
| ------------------------------ | ------------------------------------------------------------- | --------------------- |
| Voice and tone                 | <https://developers.google.com/style/tone>                    | 2026-05-27            |
| Second person and first person | <https://developers.google.com/style/person>                  | 2025-04-10            |
| Active voice                   | <https://developers.google.com/style/voice>                   | 2024-10-15            |
| Present tense                  | <https://developers.google.com/style/tense>                   | 2024-10-15            |
| Contractions                   | <https://developers.google.com/style/contractions>            | 2025-02-21            |
| Anthropomorphism               | <https://developers.google.com/style/anthropomorphism>        | 2024-10-15            |
| Jargon                         | <https://developers.google.com/style/jargon>                  | 2025-06-25            |
| Avoid excessive claims         | <https://developers.google.com/style/excessive-claims>        | 2024-10-15            |
| Future features                | <https://developers.google.com/style/future>                  | 2026-05-19            |
| Timeless documentation         | <https://developers.google.com/style/timeless-documentation>  | 2024-10-15            |
| Write for a global audience    | <https://developers.google.com/style/translation>             | 2026-08-25            |
| Write accessible documentation | <https://developers.google.com/style/accessibility>           | 2025-04-21            |
| Write inclusive documentation  | <https://developers.google.com/style/inclusive-documentation> | 2026-05-27            |

---

## Voice and tone

In your documents, aim for a voice and tone that's conversational, friendly,
and respectful without using slang or being overly colloquial or frivolous. Use
a voice that's casual, natural, and approachable, not pedantic or pushy. Try to
sound like a knowledgeable friend who understands what the developer wants to do.

Don't try to write exactly the way you speak; you probably speak more
colloquially and verbosely than you should write, at least for developer
documentation. But, aim for a conversational tone rather than a formal one.

Don't try to be super-entertaining, but also don't aim for super-dry. Be
human, let your personality show, and be memorable. But remember that the
primary purpose of the document is to provide information to someone who's
looking for it and may be in a hurry.

Consider that readers come from many different cultures and may have varying
levels of ability reading English. As much as possible, avoid culturally
specific references. Simple and consistent writing can also make it easier to
translate documents into other languages. For more information, see [Writing for a global audience](https://developers.google.com/style/translation).

For other writing best practices, see the following resources:

- [Write accessible documentation](https://developers.google.com/style/accessibility)
- [Write inclusive documentation](https://developers.google.com/style/inclusive-documentation)

### Some things to avoid where possible

- Buzzwords or [technical jargon](https://developers.google.com/style/jargon).
- Being too cutesy.
- [Avoid figurative language](https://developers.google.com/style/inclusive-documentation#figurative-language),
  which includes metaphors and ableist language.
- Placeholder phrases like _please note_ and _at this time._
- Choppy or long-winded sentences.
- Starting all sentences with the same phrase (such as _You can_ or _To
  do_).
- Current pop-culture references.
- Exclamation marks. In general, avoid exclamation points. See [Specific guidance on exclamation points](https://developers.google.com/style/periods#exclamation-points).
- Wackiness, zaniness, and goofiness.
- Phrasing that denigrates or insults any group of people.
- Phrasing in terms of _let's_ do something.
- Using phrases like _simply_, _It's that simple_, _It's easy_, or _quickly_ in a
  procedure.
- Internet slang, or other [internet abbreviations](https://developers.google.com/style/abbreviations#dont-use) such as _[tl;dr](https://developers.google.com/style/word-list#tldr)_ or _[ymmv](https://developers.google.com/style/word-list#ymmv)_.

### Some techniques and approaches to consider

- If you're having trouble expressing something, step back and ask yourself,
  "What am I trying to say?" Often, the answer you give yourself reveals what you
  should be saying in the document.
- If you're uncertain about your phrasing or tone, ask a colleague to take a
  look.
- Try reading parts of your document out loud, or at least mouthing the
  words. Does it sound natural? Not every sentence has to sound natural when
  spoken; these are written documents. But if you come across a sentence that's
  awkward or confusing when spoken, consider whether you can make it more
  conversational.
- Use transitions between sentences. Phrases like _Though_ or _This way_ can
  make paragraphs less stilted. (Then again, sometimes transitions like _However_ or _Nonetheless_ can make paragraphs more stilted.)
- Even if you're having trouble hitting the right tone, make sure you're
  communicating useful information in a clear and direct way; that's the most
  important part.

### Politeness and use of _please_

It's great to be polite, but using _please_ in a set of instructions is
overdoing the politeness.

Recommended: To view the document, click **View**.

Not recommended: To view the document,
please click **View**.

Recommended: For more information, see
[link to other document].

Not recommended: For more information,
please see [link to other document].

### Examples

| Too informal                                                                                                    | Just about right                                             | Too formal                                                                                                                                               |
| --------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Dude! This API is totally awesome!                                                                              | This API lets you collect data about what your users like.   | The API documented by this page may enable the acquisition of information pertaining to user preferences.                                                |
| Just like a certain pop star, this call gets your _telephone_ number. The easy way to ask for someone's digits! | To get the user's phone number, call `user.phoneNumber.get`. | The telephone number can be retrieved by the developer via the simple expedient of using the `get` method on the `user` object's `phoneNumber` property. |
| Then—BOOM—just garbage-collect, and you're golden.                                                              | To clean up, call the `collectGarbage` method.               | Please note that completion of the task requires the following prerequisite: executing an automated memory management function.                          |

_Source: <https://developers.google.com/style/tone>_

---

## Second person and first person

### Address the reader as _you_

In general, address the reader of your documents
using the second person instead of the first person: use _you_ or _your_ instead of _we_, _our_, or _us_.

Assume that the reader is the person who's doing the
tasks or making the decisions. Use the word _user_ only to refer to the user
of the software that your reader is developing.

| Recommended                                                          | Not recommended                                                            |
| -------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| The following sections describe how you can create a website.        | The following sections describe how we can create a website.               |
| Consider adding a description to your table.                         | Let's add a description to our table.                                      |
| This document shows you how to develop an app for your organization. | This document shows the user how to develop an app for their organization. |

If you're telling the reader to do something, then use the imperative (the _you_ is
implied). For example:

Recommended: Click **Submit**.

It's OK to use the imperative in running text after you establish who is being addressed.
However, consider whether the imperative text needs to be formatted as as a procedure.

Recommended: You can obtain the IP address
for the appliance from your network administrator. Store the address in a variable for future
use in the runbook.

Not recommended: To hold the backup data,
create a storage bucket. In the Google Cloud console, go to the **Buckets** page. Click **Create bucket**.

There are some situations in which using _you_ might not be accurate or
appropriate. Use the second person to address what the reader does, but use the
third person for what the software or an end user does. For example, in API
documentation, you can use the third person when you state facts about programming
elements, but address the reader as _you_ when you tell them what to do with
them.

### Use first-person plural pronouns carefully

It's OK to use first-person plural pronouns (such as _we_, _our_, or _us_)
to refer to the organization that's represented as the author of the document. However, ensure
that the antecedent for the pronoun is clear.

Recommended: Example Organization provides
A and B, but we don't provide C and D.

Recommended: For more information, contact
our sales organization.

Recommended: The example.org support team
regularly reviews tickets. Expect to hear from us in 2-3 business days.

### Address your audience consistently

It's important to identify who the _you_ is that you're addressing
(a developer? a sysadmin? someone else?) and to be consistent
about that. Make it clear to the reader who you expect them to be (sometimes
with an explicit _audience_ sentence near the beginning of the document).

_Source: <https://developers.google.com/style/person>_

---

## Active voice

In general, use active voice (in which the grammatical subject of the
sentence is the person or thing performing the action) instead of passive voice
(in which the grammatical subject of the sentence is the person or thing being
acted upon), although there are exceptions. Make clear who's performing the
action.

In passive voice, it's easy to neglect to indicate who
or what is performing a particular action. In this kind of construction, it's
often hard for readers to figure out who's supposed to do something (such as the
reader, the computer, the server, an end user, or a visitor to a web page).

Recommended: Send a query to the service.
The server sends an acknowledgment.

Not recommended: The service is queried,
and an acknowledgment is sent.

It's possible to indicate who's performing the action in passive voice (using _by_), but the resulting prose is generally not as good as if you were to recast
the sentence as active voice. So whenever possible, make the doer the subject of
the sentence.

Recommended: Send a query to the service.
The server sends an acknowledgment.

Not recommended: The service is queried by
you, and an acknowledgment is sent by the server.

For more information, see [Active voice vs. passive voice](https://developers.google.com/tech-writing/one/active-voice) in Google's Technical Writing One guide.

### Exceptions

In certain cases, it's okay to use passive voice. For example, passive can be
okay in the following instances:

- To emphasize an object over an action.

Recommended: The file is saved.

- To de-emphasize a subject or actor.

Recommended: Over 50 conflicts were
found in the file.

Not recommended: You created over 50
conflicts in the file.

- If your readers don't need to know who's responsible for the action.

Recommended: The database was purged
in January.

_Source: <https://developers.google.com/style/voice>_

---

## Present tense

Use present tense for statements that describe general behavior that's not associated with
a particular time.

Recommended: Send a query to the service.
The server sends an acknowledgment.

Not recommended: Send a query to the
service. The server will send an acknowledgment.

However, it's fine to use future tense (_will_) to distinguish an action that will occur in
the future.

Recommended: Add the filename to the
backup list. The file will be archived the next time the backup process runs.

In the following example, future tense is appropriate because Pub/Sub sends
messages asynchronously; messages are not received immediately by subscribers.

Recommended: A message is sent that
will notify any Pub/Sub subscribers.

Not recommended: A message is sent
that notifies any Pub/Sub subscribers.

Don't use future tense to describe how a product or feature will work after the next release
or update. For more information, see [Document future features](https://developers.google.com/style/future).

Also avoid the hypothetical future _would_—for example:

Recommended: If you send an unsubscribe
message, the server removes you from the mailing list.

Not recommended: You can send an
unsubscribe message. The server would then remove you from the mailing list.

_Source: <https://developers.google.com/style/tense>_

---

## Contractions

In general, we write our documentation in an [informal tone](https://developers.google.com/style/tone), so we
recommend using common two-word contractions such as _you're_, _don't_, and _there's_.

### Negation contractions

In particular, we recommend using negation contractions such as _isn't_, _don't_, and _can't_. It's easy for a reader to miss the word _not_ when they're scanning, whereas
it's harder to misread _don't_ as _do_.

If you need to emphasize the negative, you can use text formatting such as `is
<em>not</em>`, which renders as "is _not_." But in most cases, you don't
need emphasis to make your point clear.

### Contractions to avoid

Don't make up nonstandard contractions such as _guides're_ or _browser's_ (where _'s_ means _is_).

Don't use three-word contractions such as _mightn't've_.

_Source: <https://developers.google.com/style/contractions>_

---

## Anthropomorphism

Don't attribute human qualities to software or hardware.

Anthropomorphism is a category of figurative language, which is less precise and is often harder
to understand and translate than direct language. For more information, see [Write for a global audience](https://developers.google.com/style/translation).

Recommended: A Delimiter object specifies
where to split a string.

Not recommended: A Delimiter object tells
the splitter where a string should be broken.

Recommended: The PC detects a new
device.

Not recommended: The PC sees a new
device.

_Source: <https://developers.google.com/style/anthropomorphism>_

---

## Jargon

Jargon is the specialized and often figurative terminology of a specific group to represent a
larger concept—for example, _camel case_, _swim lane_, _break-glass procedure_, or _out-of-the-box_. Jargon can also include
vaguely defined or overloaded terms like _solution_, _support_, or _workload_.

Typically, the meaning of jargon isn't understood except by the specific group. For this reason,
jargon can hamper our efforts to publish content that's clear, that reaches a [global audience](https://developers.google.com/style/translation) in multiple languages, that serves readers at various levels of product knowledge, and that's
inclusive of different groups and cultures. For more information about writing with
inclusivity and diversity in mind, see [Write inclusive documentation](https://developers.google.com/style/inclusive-documentation).

However, some jargon is widely understood and accepted by our industry or by the intended
audience of a document. It can be valuable to include jargon in a document when you know that
readers search for those terms. If you're going to use jargon, consider the following questions:

- **Can you write around the term?** If you don't need the term for search engine
  optimization (SEO), try writing around it. For example, instead of writing _Hold a
  post-mortem_, write _When the project is finished, review what processes worked or didn't
  work_. Instead of writing _Create a back-of-the-envelope design_, write _Use an informal
  design process_.

- **Can you replace the term with a different, more specific term?** For example, the [word list](https://developers.google.com/style/word-list) for this style guide offers several replacement terms: _affected area_ or _spatial
  impact_ (for _blast radius_), _import_ or _load_ (for _ingest_), and _ready-made_ or _pre-built_ (for _off-the-shelf_). When a term on the word list is
  marked as "Don't use" (some jargon can be considered offensive, violent, or not inclusive),
  replace that term or write around it.

- **Are you using the term only once in your document?** If so, describe the term in plain
  language and refer to it in parentheses, or link to a trusted definition. Recommended: You then move the task to an
  earlier part of the process (also known as _shifting left_).

  Recommended: A [split-brain](<https://en.wikipedia.org/wiki/Split-brain_(computing)>) situation can develop.

- **Are you using the term throughout your document?** If so, briefly describe the term in
  parentheses on first reference, or link to a trusted definition. Recommended: The application is in the
  same state as a _cold standby_ (a backup or redundant system that's identical to a primary
  system).

  Recommended: A better approach is to use
  a pattern called a [_dead letter queue_](https://en.wikipedia.org/wiki/Dead_letter_queue).

- **Is the term used in a command or code sample?** If so, use the words only in direct reference to the code items
  ([formatted as code](https://developers.google.com/style/code-in-text)), and make it clear
  what you're referring to.

  Recommended: Add a user to the
  allowlist (`whitelist`) by entering the following: `whitelist adduser *EMAIL_ADDRESS*`.

  Not recommended: Add a user to the
  whitelist by entering the following: `whitelist adduser
  *EMAIL_ADDRESS*`.

_Source: <https://developers.google.com/style/jargon>_

---

## Avoid excessive claims

In documentation, don't make excessive claims. An _excessive claim_ is an assertion
in the documentation that does any of the following:

- Makes a statement about performance or cost that isn't easily verifiable with data
  that's available to the reader.
- Makes a statement about security that would be invalidated by a security incident.
- Makes a statement that might be interpreted as subjective or even disparaging,
  especially about third-party products.

When you're assessing whether some text makes an excessive claim, take into account
not just what's true today about a product's performance, cost, security, or
functionality, but what might be true in the future.

Consider the following guidelines:

- When you describe products, avoid superlatives like _best_, _simplest_, _fastest_, _never_, and _always_. Similarly, be
  careful about words like _ensure_ and _guarantee_ and use them only when
  something can truly be ensured or guaranteed.
- If you make specific performance claims—how fast a product is, how much storage
  it requires, and so on—make sure that you reference the source of your information.
- If documentation claims that a product is secure, the documentation
  is invalid (and not credible) if someone succeeds in compromising the product.
  It's safer to suggest that a feature "helps with security" or "is designed for
  security" because those statements are true even if a security incident occurs.
- A statement that you make about a competitive product might be untrue if you
  misinterpret how the product works, or later if the other company comes out with
  a new release.

The safest approach is always to write factually and objectively, limiting what you say to
verifiable information that will be true over the lifespan of your documentation.

Recommended: Our product
distributes datasets and computation in memory across a cluster, and
therefore it can be faster for this scenario than ExampleCorporation's product. For
more information, see [Performance comparison](https://www.google.com/).

Not recommended: Our product is
faster than ExampleCorp's product.

Recommended: Using our security product
is part of an overall strategy that helps prevent account takeovers from phishing attacks.

Not recommended: Our security product
prevents account takeovers from phishing attacks.

_Source: <https://developers.google.com/style/excessive-claims>_

---

## Future features

Avoid documenting future features or products, even in innocuous
ways. Don't pre-announce anything in documentation unless it has been approved by your legal counsel.

See also [Present tense](https://developers.google.com/style/tense) and [Timeless documentation](https://developers.google.com/style/timeless-documentation).

_Source: <https://developers.google.com/style/future>_

---

## Timeless documentation

Timeless documentation is documentation that avoids words and phrases that anchor the
documentation to a point in time or assume knowledge of prior or future products and features. In
general, document the current version of a product or feature.

Timeless documentation is especially important for technical documents that might be read a long
time after they are written. Words like _now_, _new_, and _currently_ can render
such documentation inaccurate, outdated, or unmeaningful. In contrast, timeless documentation
focuses on how the product works right now—not on how it has changed from previous versions,
and not how it might change in the future.

| Recommended                                                  | Not recommended                                                  |
| ------------------------------------------------------------ | ---------------------------------------------------------------- |
| These subcommands let you interact with HTTP load balancing. | These new subcommands let you interact with HTTP load balancing. |
| The following command-line options aren't supported:         | The following command-line options aren't currently supported:   |
| The emulator supports the following filters:                 | The emulator now supports the following filters:                 |

If you're writing procedural or time-stamped content such as press releases, blog posts, or
release notes, such time-based words and phrases are okay. For example, _new_ is okay in a blog
post that announces updates to a product: _Dataflow includes several new features._ Or, _soon_ is okay in procedural content to emphasize a change in state after a user performs a
step: _The VM goes offline soon after you send the shutdown command._ However, some of these
words can become outdated or incorrect when used in product documentation to refer to a product's
features and capabilities, so we recommend against using such words in that context.

Writing timeless product documentation has the following value:

- It reduces the maintenance required to keep documentation up to date.
- It avoids assuming the reader is familiar with earlier versions of the product.

### Words and phrases to avoid

The following words and phrases can undermine timelessness in documentation:

- **Words and phrases that make promises or project plans and
  strategies**. In the context of describing product or feature capabilities, words and phrases such
  as _at present_, _as of this writing_, or _eventually_ can prematurely disclose plans
  for a product or feature, or they can inappropriately imply that a product or feature might change.
  In those cases, don't use such words and phrases.

  For more information, see [Documenting future features](https://developers.google.com/style/future).

- **Words and phrases that are implied**. At Google, we assume our documentation is
  current unless a specific release version is specified. Thus, words and phrases such as
  _currently_ and _as of this writing_ are implied by the existence of the documentation
  itself.

- **Words and phrases that become outdated soon after publication**. Words such as _soon_ and _latest_ quickly become irrelevant.

- **Words and phrases that assume prior knowledge of a product or feature**. If you must use
  words like _new_, give a reference point such as a date or version release number—for
  example, _The January 14, 2021 release of BigQuery includes a new resource panel._

When describing product or feature capabilities in product and reference documentation, avoid
the following words and phrases:

- as of this writing
- currently
- does not yet
- eventually
- existing
- future, in the future
- latest
- new, newer
- now
- old, older
- presently, at present
- soon

_Source: <https://developers.google.com/style/timeless-documentation>_

---

## Write for a global audience

We write our developer documentation in US English, but some of it is
translated into languages other than English or is read by developers for whom
English is not their primary language.

Write with localization, translation, and
internationalization in mind. The following list defines these terms:

- _Localization:_ Adapting a product and its associated documentation for a specific country.
  This process involves more than translation—for example, using local currencies or units of
  measurement.
- _Translation:_ Translating one language to another language. This process might involve
  localization, but the two terms aren't synonymous with one another.
- _Internationalization:_ Designing a product and its associated documentation to minimize
  the localization effort—for example, placing all UI strings in a separate file to simplify
  translation.

For more information, see [Language localization](https://wikipedia.org/wiki/Language_localisation).

For other writing best practices, see the following resources:

- [Write accessible documentation](https://developers.google.com/style/accessibility)
- [Write inclusive documentation](https://developers.google.com/style/inclusive-documentation)
- [Voice and tone](https://developers.google.com/style/tone)

### Use clear, concise, and unambiguous language

Consider global audiences and translation and write in a way that's clear, concise, and
unambiguous.

#### Use simpler words and shorter sentences

- Use a simple word. For example, don't use words like _commence_ when you mean _start_ or _begin_. Don't use _consequently_ when you mean _so_. Don't use words like
  _utilize_ or _leverage_ when you mean _use_. (It's fine to use these words when
  you're conveying a special sense—for example, _Cloud Spanner utilizes up to 100% of the available
  CPU resources._)

- Use a single word when it conveys the same idea as a phrase. For example, don't
  use a phrase like _a number of_ when you can use _some_ or _many_.

- Write shorter sentences. The shorter the sentence, the easier it is to translate. English sentences can be
  shorter in length than some languages, so an English sentence of average length might result in a
  long sentence when translated. Longer sentences can impair understanding, cause rendering issues
  on the page or product interface, lengthen translation time, and increase translation and
  review costs.

#### Avoid phrasal verbs

- Avoid phrasal verbs when possible. A phrasal verb combines multiple words to form a single
  verb phrase. These verbs are also known as compound verbs. Try to substitute a simpler verb first.
  There might not be a better verb; for example, a few exceptions to this rule include _set up_, _log in_, and _sign in_.

  Recommended: This document uses the following
  terms:

  Not recommended: This document makes use of
  the following terms:

#### Use modifiers appropriately

- Don't use too many modifiers. In particular, don't use more than two nouns as modifiers of
  another noun.

  Recommended: A cloud-native DevSecOps
  pipeline in a hybrid environment

  Not recommended: A hybrid cloud-native
  DevSecOps pipeline

- Don't misplace modifiers. For example, place a word like _only_ immediately before the
  word or phrase that it relates to. If the meaning is still ambiguous, try rephrasing the sentence.

  Recommended: Request only one token.

  Recommended: Request no more than one token.

  Not recommended: Only request one token.

#### Use active voice and present tense

- Use [present tense](https://developers.google.com/style/tense) and avoid complex or uncommon verb forms.
- Use active voice. The subject of the sentence is the person or thing performing the action.
  With passive voice, it's often hard for readers to figure out who's supposed to do something.
  For more information, see [Active voice](https://developers.google.com/style/voice).
- Avoid participles and gerunds (that is, _verbing_) when possible. _Verbing_ can be
  less direct and ambiguous. Consider replacing _using_ with _by using_,
  _that use_ (or _that uses_), or _you use_ as appropriate. For more information, see
  the word list entry [using](https://developers.google.com/style/word-list#using).

  | Recommended                                                                  | Not recommended                                                                  |
  | ---------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
  | You must configure the VPC firewall rules before you deploy the VM instance. | Configuring the VPC firewall rules is required before deploying the VM instance. |
  | This guide describes how to set up database replication.                     | This guide describes setting up database replication.                            |

#### Use words in their primary sense

- Don't use the same word to mean different things. In particular, avoid using the same word as
  both a noun and a verb in close proximity. For examples of words that have multiple meanings, see the word
  list entries for [once](https://developers.google.com/style/word-list#once), [while](https://developers.google.com/style/word-list#while), [as](https://developers.google.com/style/word-list#as), and [since](https://developers.google.com/style/word-list#since).
- Avoid directional language (for example, _above_ or _below_) in procedural
  documentation. For more information, see
  [UI elements and interaction](https://developers.google.com/style/ui-elements#buttons).

#### Use helper words and optional words

- Use qualifying nouns for technical keywords. For example, when referring to a file called `example.yaml`, call it the _`example.yaml` file_ and not _`example.yaml`_ by itself. For more information, see [Grammatical treatment of code elements](https://developers.google.com/style/code-in-text#keywords).

- Repeat a word if the redundancy improves comprehension.

  | Recommended                                                                                                                    | Not recommended                                                                                                    |
  | ------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------ |
  | If the VM has started and if you're able to connect...                                                                         | If the VM has started and you're able to connect...                                                                |
  | The resource hierarchy design creates both IAM segmentation and network segmentation by default.                               | The resource hierarchy design creates both IAM and network segmentation by default.                                |
  | An egress rule whose action is `allow`, whose destination is `0.0.0.0/0`, and whose priority is the lowest possible (`65535`). | An egress rule whose action is `allow`, destination is `0.0.0.0/0`, and priority is the lowest possible (`65535`). |

- Use helper words. Helper words such as _then_, _that_, and _of_ are frequently left out of conversational English. Use these words to avoid ambiguity.

  | Recommended                                                                                     | Not recommended                                                                            |
  | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
  | If the attribute key is not found, then the default value is returned.                          | If the attribute key is not found, the default value is returned.                          |
  | This document is intended for data engineers and assumes that you have the following knowledge: | This document is intended for data engineers and assumes you have the following knowledge: |
  | Identify all of the datasets.                                                                   | Identify all the datasets.                                                                 |
  | Start the profiler, and then run the app.                                                       | Start the profiler, then run the app.                                                      |
  | See also [Optional pronouns](https://developers.google.com/style/pronouns#optional-pronouns).   |

- Don't omit relative pronouns. To provide clarity and to avoid ambiguity, use relative
  pronouns such as _that_ and _which_. For more information, see [Relative pronouns](https://developers.google.com/style/pronouns#relative-pronouns).

  Recommended: You can programmatically update
  the rules that you previously defined.

  Not recommended: You can programmatically
  update the rules you previously defined.

#### Clarify abbreviations and pronouns

- Define abbreviations. Abbreviations can be confusing out of context, and they don't translate
  well. Spell things out whenever possible, at least the first time that you use
  a given term. For more information, see [Abbreviations](https://developers.google.com/style/abbreviations).

- Clarify antecedents. Using pronouns can get tricky when translators are working with small,
  unconnected strings of text. Help them out by making things as clear as
  possible. For example, if a pronoun is ambiguous, then replace it with the
  appropriate noun.

  Recommended: If you use the term _green beer_ in an ad, then make sure that the ad is targeted.

  Not recommended: If you use the term _green beer_ in an ad, then make sure that it's targeted.

#### Use apostrophes appropriately

Be careful with how you use plural and possessive forms. In general, don't form a plural with _'s_, don't use the plural or possessive form with trademarks of company, product, and feature
names, and don't use uncommon contractions. For more information, see [Possessives](https://developers.google.com/style/possessives), [Pluralization](https://developers.google.com/style/pluralization), and [Contractions](https://developers.google.com/style/contractions).

### Address users and their needs directly

Address the user and their needs directly and avoid providing unnecessary information.

- Address the reader directly. Use _you_, instead of _the user_ or _they_, unless
  you're referring to someone who uses the software that the reader is developing. For more
  information, see [Second person and first person](https://developers.google.com/style/person).

- Provide context. Don't assume that the reader already knows what you're talking about.

- Avoid negative constructions when possible. Consider whether it's necessary to tell the reader
  what they can't do instead of what they can.

### Be consistent

Use standard sentence structures, consistent terminology, and appropriate punctuation to avoid
creating barriers to understanding, ambiguity, and mistranslations.

#### Use consistent terminology

If you use a particular term for a concept in one place, then use that exact same term
elsewhere, including the same capitalization. If you use different names for the same thing,
translators might think you're referring to different concepts, and thus might use different
translations. Inconsistency in terminology and phrasing can increase translation costs,
particularly when translation memory and machine translations are used as first steps in
translation.

#### Use standard sentence structures and formatting

- Use standardized phrases for frequently used sentences, introductory phrases, and other common
  tasks. For examples, read about [introducing links](https://developers.google.com/style/cross-references#link-introductions), [introducing output](https://developers.google.com/style/placeholders#placeholders-in-output), and [introducing code samples](https://developers.google.com/style/code-samples#introductions).

- Use standard English word order. Sentences follow the _subject + verb + object_ order.

- Try to keep the main subject and verb as close to the beginning of the sentence as possible.

- Use the conditional clause first. If you want to tell the audience to do something in a
  particular circumstance, mention the circumstance before you provide the instruction. For more
  information, see [Sentence structure](https://developers.google.com/style/sentence-structure).

- Make list items consistent. Make list items parallel in structure. Be consistent in your
  capitalization and punctuation. For more information, see [Lists](https://developers.google.com/style/lists).

#### Use consistent text formatting

- Use consistent typographic formats. Use bold and italics consistently. Don't switch from
  using italics for emphasis to underlining. For more information, see
  [Text-formatting summary](https://developers.google.com/style/text-formatting).
- Use consistent capitalization. For more information, see
  [Capitalization](https://developers.google.com/style/capitalization).

### Be inclusive

You're not writing for your culture. Write with inclusivity in mind. For more information, see [Writing inclusive documentation](https://developers.google.com/style/inclusive-documentation).

- Write [dates and times](https://developers.google.com/style/dates-times) in unambiguous and clear ways.
- Don't be too
  culturally specific. In particular, don't refer to specific holidays, cultural practices, or sports
  unless you're certain they're known worldwide.
- Use a diverse set of example names. If you
  need to use people's names (for example, as email addresses), use a diverse set of names. For more
  information, see [Example domains and names](https://developers.google.com/style/examples).
- Avoid
  colloquialisms, idioms, or slang. Phrases like _ballpark figure_, _back burner_, or
  _hang in there_ can be confusing and difficult to translate.
- Avoid humor. Most humor
  is difficult to translate, and much humor is culturally specific.
- Avoid geographically
  specific references, like the seasons. Remember that August isn't summer in the southern hemisphere.
  For more information, see [Expressing divisions of the year](https://developers.google.com/style/dates-times#divisions-year).

### Consider accessibility for images

Use screenshots and text in figures sparingly. Images don't get translated. Any new information
should be conveyed through text and not introduced in a figure or image. For more information, see [Figures and other images](https://developers.google.com/style/images).

_Source: <https://developers.google.com/style/translation>_

---

## Write accessible documentation

We write our developer documentation with accessibility in mind. This page is not an exhaustive
reference, but describes some general guidelines and examples that illustrate best practices to
follow. The [World Health Organization](https://www.who.int/en/news-room/fact-sheets/detail/disability-and-health) estimates that 15% of the world's population (more than 1 billion people) have an accessibility
need. When documentation is written with accessibility in mind, it improves the overall
experience for all readers.

For other writing best practices, see the following resources:

- [Write for a global audience](https://developers.google.com/style/translation)
- [Write inclusive documentation](https://developers.google.com/style/inclusive-documentation)
- [Voice and tone](https://developers.google.com/style/tone)

### General dos and don'ts

- Don't use ableist language. Avoid bias and harm when discussing disability and accessibility.
  For more information, see [Writing inclusive documentation](https://developers.google.com/style/inclusive-documentation).
- Ensure that readers can reach all parts of the document (including
  tabs, form-submission buttons, and interactive elements) by using only a keyboard,
  without a mouse or trackpad.
- Use a screen reader to test your documentation. This test can help you find accessibility
  issues in your content and is a good way to self-edit your content. To try out a screen reader,
  see [List of screen readers](https://wikipedia.org/wiki/List_of_screen_readers).
- In HTML, use [semantic tagging](https://developers.google.com/style/semantic-tagging). For example, use the `em` element only to
  indicate emphasis, not to indicate italics.
- In HTML, prefer [native elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Element) over custom styles.
- Avoid unnecessary font formatting. (Screen readers explicitly describe
  text modifications.)
- If you're documenting a product that includes specialized accessibility
  features, then explicitly document those features. For example, the Google Cloud
  CLI (`gcloud` CLI) includes togglable accessibility features
  such as percentage progress bars and ASCII box rendering.
- Don't force line breaks (hard returns) within sentences and paragraphs. Line breaks might not
  work well in resized windows or with enlarged text.
- Avoid when possible [camel case](https://wikipedia.org/wiki/Camel_case) and [all caps](https://wikipedia.org/wiki/All_caps). Some screen readers read
  capitalized letters individually, and some languages are [unicase](https://wikipedia.org/wiki/Unicase). Follow [capitalization](https://developers.google.com/style/capitalization) guidelines.
- Depending on the screen reader (or personal settings), not all punctuation marks are read. Make
  sure that the same meaning is conveyed to the reader without punctuation marks. For that reason, avoid
  when possible the use of exclamation marks, question marks, and semicolons.
- Don't use _&_ instead of _and_ in headings, text, navigation, or
  tables of contents. However, it's OK to use _&_ when referencing UI
  elements that use _&_, or in table headings and diagram labels where space
  constraints require abbreviation. Of course, it's fine to use `&` for technical purposes in code.

### Ease of reading

- Break up walls of text to aid in scannability. For example, separate [paragraphs](https://developers.google.com/style/paragraph-structure),
  create [headings](https://developers.google.com/style/headings),
  and use [lists](https://developers.google.com/style/lists).

- Use shorter sentences. Try to use fewer than 26 words per sentence.

- Define acronyms and abbreviations on first usage and if they're used infrequently.

- Use parallel writing structures for similar things. For example, start each list in the same
  format.

- Place distinguishing and important information of a paragraph in the first sentence to aid in
  scannability.

- Use clear and direct language. Avoid the use of double negatives and exceptions for exceptions.

  Recommended: You can continue without a
  path.

  Not recommended: A missing path won't
  prevent you from continuing.

- Left-align text for readability. Don't center or full-justify text.

### Headings and titles

Use descriptive headings and titles because they help a reader navigate their browser and the
page. It's easier to jump between pages and sections of a page if the headings and titles are
unique.

- Use a heading hierarchy.
- Don't skip levels of the heading hierarchy. For example, put an `h3` element
  only after an `h2` element.
- To change the visual formatting of a heading, use CSS rather than using a heading level that
  doesn't fit the hierarchy.
- Don't have empty headings or headings with no associated content.
- Tag headings using heading elements. In HTML: `h1`, `h2`, and so on. In Markdown: `#`, `##`, and so on.
- Use a level-1 heading for the page title or main content heading.

For more information and examples, see [Headings and titles](https://developers.google.com/style/headings).

### Links

- Use [meaningful link text](https://developers.google.com/style/cross-references#descriptive-link-text).
  Links should make sense when read out of context.
- Don't use _click here_ or _read this document_. Some people who use screen readers
  jump from link to link to scan a page and need to understand what a link contains.
- Use _see_ to refer to links and cross-references. For more information, see [see](https://developers.google.com/style/word-list#see).
- When a link does anything that the reader might not expect, such as downloading a file,
  opening in a new tab, or jumping to another section on the same page, explain that behavior when
  you link. For more information, see [Explain unexpected link behavior](https://developers.google.com/style/cross-references#explain-behavior).
- When possible, avoid adjacent links. Instead, put a character in between to separate them.

### Lists

- In a [procedure](https://developers.google.com/style/procedures),
  make each instruction a [list item](https://developers.google.com/style/lists).
- Use lists to make it easier for the reader to follow the steps.

### Images

- For every image, provide an alt attribute. For alt attributes that contain [alt text](https://developers.google.com/style/images#alt-text), use alt text that adequately summarizes the
  intent of each image. If the image is purely decorative, use empty alt text.
- Don't present new information in images. Always provide an equivalent text explanation with
  the image.
- Don't repeat images unless absolutely necessary.
- Don't use images of text, code samples, or terminal output. Use actual text.
- Use SVG instead of PNG if available. SVGs stay sharp when you zoom in on the image.

For more information, see [Text associated with images](https://developers.google.com/style/images#text-associated-with-images).

### Videos, recordings, and GIFs

- Provide captions, transcripts, or descriptions of audio and video content. For example, you
  can use the [autocaption feature](https://support.google.com/youtube/answer/6373554) in YouTube.
- Ensure that captions can be translated into major languages.
- Don't use flickering or flashing elements. They can cause anything from motion sickness
  to a seizure.

### Buttons and icons

- For form-submission buttons, use the native HTML `button` element.
- An icon is a symbol or image that represents an object or a function. For information
  about using icons, see the [Buttons and icons](https://developers.google.com/style/ui-elements#buttons) section
  of the "UI elements and interaction" page.

### UI navigation

When you use angle brackets (`>`) to document menu paths, add an [`aria-label` attribute](https://www.w3.org/TR/WCAG20-TECHS/ARIA14.html) to help screen readers interpret the brackets as "and then" instead of as
"greater than" or "keyboard arrow right". For more information and examples, see [Menu bar](https://developers.google.com/style/ui-elements#term-menus).

### Tables

- Introduce tables in the text preceding the table because not all screen readers preannounce
  tables.
- Use table headings for the first column and the first row only. Use the [`th` element](https://www.w3.org/TR/html4/struct/tables.html#edef-TH).
- If your tables include both row and column headings, then mark heading cells with the [`scope` attribute](https://www.w3.org/WAI/tutorials/tables/two-headers/).
- If your tables have more than one row containing column headings, then use the [`headers` attribute](https://www.w3.org/WAI/tutorials/tables/multi-level/) and make sure that the headings have unique IDs.
- Avoid when possible tables in the middle of a numbered procedure.
- Don't merge cells. Don't use `colspan` or `rowspan` attributes.
- Don't use tables unless it's the best method to present your information. Tables are
  challenging for screen readers. For more information, see [List or table](https://developers.google.com/style/tables#list-or-table).
- Don't present new information in tables through images or symbols alone; always provide a
  descriptive `alt` attribute for the image or symbol. For more information, see
  [Alt text](https://developers.google.com/style/images#alt-text).

For more information, see [Tables](https://developers.google.com/style/tables).

### Interactive elements

Introduce an interactive element (such as a button that expands and collapses) in the text
preceding the element.

Recommended if practical: To see a list of
requirements, expand the **Requirements** section.

Recommended: To see a list of requirements,
click the arrow_right expander arrow.

### Forms

- Label every input field by using a `label` element.
- Place labels outside of fields.
- When you're creating an error message for form validation, clearly state
  what went wrong and how to fix it—for example: "Name is a required field."

### Custom CSS and JavaScript

Try to use your site's standard styles and standard JavaScript code as much
as possible. However, if you do use custom styles or code, then follow these guidelines:

- Pick colors that respect [accessible color contrast ratios](https://webaim.org/resources/contrastchecker/) (4.5:1 for text).
- Don't use `visibility:hidden` or `display:none`. Both
  styles hide information from screen readers.
- Avoid when possible using mouseover events. But if you do use them, then add alternate
  focus and blur events for keyboard users.
- Ensure that any ordering and positioning defined in styles reflects the
  DOM and the reading order (such as left to right and top to bottom) of your page.

### Document rendering

Make sure that your document conveys all the information that you intended when you
view it in the following contexts:

- Without sound
- Using only sound
- Without images, including animation
- [Without color](https://colororacle.org/)
- Using a keyboard
- With screen magnification
- Without punctuation

Don't use color, size, location, or other visual cues as the primary way
of communicating information.

- If you're using color, an icon, or outline thickness to convey state,
  then also provide a secondary cue, such as a change in the text label.

- Refer to buttons and other elements by their label. For visual elements
  that have no text, don't try to describe the element. Instead, use the element's `[aria-label](https://www.w3.org/TR/WCAG20-TECHS/ARIA14.html)` attribute if possible.
  For example:

  Recommended: Click **Save**.

  Recommended: Click **Notifications**.

  Not recommended: Click the bell icon.

- Don't use directional language to orient the reader, such as _above_, _below_,
  or _right-hand side_. This type of language doesn't work well for accessibility or for
  localization reasons. For example, what's on the right side for left-to-right languages
  appears on the left side for right-to-left languages.

  Don't use directional language to refer to a position in a document. For example, the text
  isn't _below_ if it's being read by a screen reader. Instead, use _earlier_, _preceding_, or _following_.

  Recommended:
  In the preceding diagram, clients run jobs on multi-team or single-team clusters.

  Not recommended: In the diagram above,
  clients run jobs on multi-team or single-team clusters.

  If a [UI element](https://developers.google.com/style/ui-elements) is hard to find, [provide a screenshot](https://developers.google.com/style/images).

  Recommended:
  Click menu **Menu**.

  Not recommended: In the left-side
  panel, click the button with three lines.

### More resources

- [Google's main accessibility page](https://www.google.com/accessibility/)
- [Web Content Accessibility Guidelines (WCAG) 2.0](https://www.w3.org/WAI/WCAG20/glance/)
- [Web Accessibility Initiative (WAI)](https://www.w3.org/WAI/)
- [Using ARIA](https://www.w3.org/TR/using-aria/)

- [Web Accessibility Tutorials](https://www.w3.org/WAI/tutorials/)

_Source: <https://developers.google.com/style/accessibility>_

---

## Write inclusive documentation

> **Note**: This document includes references to potentially disrespectful or offensive terms.
> These terms are listed here to provide usage guidance and alternative terms.

When you write developer documentation with inclusivity and diversity in mind,
you help ensure that the content is more precise and clear for all readers.
Avoid any kind of idiomatic or figurative language that can be misinterpreted or
distracting.

This page is not an exhaustive reference, but provides some general guidelines
and examples that illustrate some best practices for writing inclusive
documentation.

For other writing best practices, see the following resources:

- [Write for a global audience](https://developers.google.com/style/translation)
- [Write accessible documentation](https://developers.google.com/style/accessibility)
- [Voice and tone](https://developers.google.com/style/tone)

### Avoid unnecessarily gendered language

Be mindful of the [pronouns](https://developers.google.com/style/pronouns#gender-neutral-pronouns) that are used in narrative
examples, and be aware of other possible sources of gendered language.

| Recommended                                                      | Not recommended                                               |
| ---------------------------------------------------------------- | ------------------------------------------------------------- |
| Equipment installation takes around 16 person-hours to complete. | Equipment installation takes around 16 man-hours to complete. |
| Build AI that benefits humanity.                                 | Build AI that benefits mankind.                               |

### Avoid figurative language

Use simple language and terminology that's precise and clear for all of your
audiences:

- Avoid idiomatic or figurative language that can be misunderstood,
  distracting, or difficult for translation.
- Avoid [jargon](https://developers.google.com/style/jargon).
- Use terms that are established industry standards and widely understood by
  the target audience.

When you try to achieve a [friendly and conversational tone](https://developers.google.com/style/tone), you might mistakenly use figurative language. Figurative language can
come in the form of figures of speech and other turns of phrase. Be attentive to
your word choice, especially when you aim for an informal tone.

Don't use metaphors, and don't use a term in a metaphorical sense
([use words in their primary sense](https://developers.google.com/style/translation#use-words-in-their-primary-sense)).
For example, avoid using the metaphor of _pets versus cattle_ when you
compare on-premises or stateful systems with stateless cloud systems.

For guidance about specific terms, see the [Word list](https://developers.google.com/style/word-list).

#### Avoid ableist language

Ableist language includes
words or phrases such as _crazy_, _insane_, _blind to_ or _blind eye to_, _cripple_, _dumb_, and others. Choose a more
accurate or alternative word, depending on the context.

| Recommended                                                                       | Not recommended                                                                                                                        |
| --------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| Before launch, give everything a final check for completeness and clarity.        | Before launch, give everything a final sanity-check.                                                                                   |
| There are some baffling outliers in the data.                                     | There are some crazy outliers in the data.                                                                                             |
| It slows down the service, causing a poor user experience until the queue clears. | It cripples the service, causing a poor user experience until the queue clears.                                                        |
| Replace the placeholder in this example with the appropriate value.               | Replace the [dummy variable](https://developers.google.com/style/word-list#dummy-variable) in this example with the appropriate value. |

#### Avoid graphic or metaphorical language

Avoid unnecessarily graphic or metaphorical language, when you can use a more
precise term.

For example, instead of _[STONITH](https://developers.google.com/style/word-list#stonith)_, use specific terms to
describe the process that's used to stop an errant node. If you need to mention a term
such as _STONITH_, you can mention it once when you first explain the
relevant feature, and phrase it in a way that de-emphasizes the term.

Recommended:
This approach might require you to fence failed nodes.

Sometimes okay:
This approach might require you to fence failed nodes (sometimes referred to
as _STONITH_).

Always use the most precise and well-understood terms for your context.
In some contexts, an industry-established term has a specific technical meaning
that doesn't have an accurate synonym or alternative. For examples, see the word
list entries for [terminate](https://developers.google.com/style/word-list#terminate) and [execute](https://developers.google.com/style/word-list#execute).

| Recommended                                          | Not recommended                            |
| ---------------------------------------------------- | ------------------------------------------ |
| If the connection doesn't respond, check for errors. | If the connection hangs, check for errors. |
| Point to **File**, and then click **New**.           | Hover over **File**, and hit **New**.      |

For guidance about specific terms, see the [Word list](https://developers.google.com/style/word-list).

### Write diverse and inclusive examples

Write documentation for a [global audience](https://developers.google.com/style/translation#be-inclusive).
Use diverse names, genders, ages, and locations in examples. Keep the following
advice in mind:

- Follow our [gender-neutral pronoun](https://developers.google.com/style/pronouns#gender-neutral-pronouns) guidance.
- Avoid being too culturally specific to the US. Be mindful when referring
  to specific holidays (see also the word list entry for [_the holidays_](https://developers.google.com/style/word-list#holiday)), cultural practices,
  sports, and figures of speech.
- In examples, [choose a diverse set of names](https://developers.google.com/style/examples#example-person-names) to help reflect our global audience. For guidelines about fictional people,
  see [Further notes about example people](https://developers.google.com/style/examples#further-notes-about-example-people).
- When writing about older adults, avoid terms and figures of speech such
  as _the elderly_, _the aged_, _seniors_, _senior citizens_, or _80 years young_. Instead, use terms such as _older adults_ or _aging population_, or mention the person's
  relative age or relationship to the other people in your example when those
  details are relevant.

### Write about features and users in inclusive ways

Avoid referring to people in divisive ways. For example, instead of referring
to people as _native speakers_ or _non-native speakers_ of English, consider
whether your document needs to discuss this at all, and revise it
to discuss the feature in terms that are relevant to anyone regardless of what
languages they know.

Avoid using socially charged terms for technical concepts where possible. For
example, avoid terms such as [blacklist](https://developers.google.com/style/word-list#blacklist) and [native](https://developers.google.com/style/word-list#native) feature, and don't use terms like [first-class citizen](https://wikipedia.org/wiki/First-class_citizen), even though such terms might still be widely used.

#### Replace or write around non-inclusive terms

This section contains guidance about how to replace or write around a non-inclusive term. If a
term is well established in the industry and replacing it could cause confusion, see [Replace established terms](#replace). If a term occurs in code samples or keywords, see [Write around non-inclusive code terms](#write-around). For information about avoiding
non-inclusive jargon, see [Jargon](https://developers.google.com/style/jargon).

##### Replace established terms

Many non-inclusive terms are in wide use in the industry, such as _whitelist_. If replacing
an established term could cause confusion for readers, you can directly refer to the non-inclusive
term on the first use, and put it in parentheses. Then use the inclusive, replacement term
throughout the rest of the document.

Recommended: To make sure that administrators
get the notification, add them to an allowlist (sometimes called a _whitelist_). Anyone who
isn't on the allowlist is blocked ...

Recommended: In this model, a Jenkins
controller (master) handles HTTP requests. The Jenkins controller is designed to ...

Recommended: In cloud architecture, servers
are treated as commodities (sometimes described by using the metaphor _cattle, not pets_).

In many cases, instead of directly replacing a word, you can rewrite to improve the clarity of a
sentence. For example, instead of replacing the verb _whitelist_ with _allowlist_, try
rewriting the sentence.

Recommended: You can allow requests from a
range of IP addresses by entering a CIDR block instead of a single address in the field.

Not recommended: You can allowlist a range of
IP addresses by entering a CIDR block instead of a single address in the field.

##### Write around non-inclusive code terms

In some cases, non-inclusive terms are embedded in code (or similar) as names or keywords, and
you can't simply ignore those terms and use different terminology. What you can do, however, is _minimize_ your use of the term (hence avoid propagating it as a term of art), while still
providing clear documentation to your readers. Don't use a non-inclusive name or keyword unless it's
in code font.

Following are scenarios for writing around non-inclusive terms that occur in code and keywords.

One scenario is if you're documenting an existing system in which an entity is already named
by using a non-inclusive term. For example, there might be a configuration file that includes the
following cluster name:

```
apiVersion: v1
kind: Config
preferences: {}

clusters:
- cluster:
  name: master
- cluster:
  name: replica-1
```

Another scenario is if your documentation includes a non-inclusive term that's an established
keyword, such as the keyword `SLAVE` in dialects of SQL:

```
START SLAVE UNTIL SQL_AFTER_MTS_GAPS;
```

The first time that you refer to a code item that uses a non-inclusive term, you can directly
refer to that term, but format it in code font, and put it in parentheses if possible.

Recommended: The configuration file helps you
create a parent node (which is named `master` in the file).

Recommended: Start the replica by using the `START SLAVE` statement.

In subsequent mentions, use the preferred term (_parent node_, _replica_). If it's
necessary to refer to the entity name or keyword, continue doing so only with code formatting.

### Avoid bias and harm when discussing disability and accessibility

Many developers create products with accessibility and disability in mind.
When documenting these features, and when writing about people with
disabilities or about accessibility, work to eliminate unintentional bias and
harm. Take the time to educate yourself about the ways that the communities that you're
writing about prefer to be identified and described before writing about them in
your documentation.

Some general guidelines in this area include the following:

- Don't describe people without disabilities as _normal_ or _healthy_. This
  contributes to othering and alienation of people with disabilities by implying that
  they are abnormal or sick. Instead, use terms such as _nondisabled person_, _sighted person_, _hearing person_, _person without disabilities_, or _neurotypical person_.

- Research the ways that the people in the communities that you're writing about
  prefer to be identified and use the terms that they prefer. In many cases, avoid
  terms that remove personhood or that define people by their disability. For
  example, avoid terms such as _the disabled_ or _a quadriplegic_.
  Instead, use terms such as _people with disabilities_ or _a quadriplegic person_.

  However, many members of some communities prefer _identity-first language_—for
  example, that preference is common in autistic, blind, and Deaf communities. Capitalization of
  identities also can vary (for some perspectives, visit [Identity-First Language](https://autisticadvocacy.org/about-asan/identity-first-language/) and [Self-Identification in the Deaf Community](https://www.verywellhealth.com/deaf-culture-big-d-small-d-1046233)). Whenever possible, research and choose terms
  that respect the ways that people in the communities identify.

- Use _see_ to refer to links and cross-references. For more information, see [see](https://developers.google.com/style/word-list#see).

- Avoid terms that reflect or project feelings and judgments about a person's disability,
  such as _victim of_, _suffering from_, or _wheelchair-bound_. Instead, use neutral
  terms such as _experiencing_, _living with_, or _uses a wheelchair_.

- Avoid euphemisms or patronizing terms such as _physically challenged_, _special_, _differently abled_, or _handi-capable_.

_Source: <https://developers.google.com/style/inclusive-documentation>_
