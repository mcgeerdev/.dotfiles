# Code and api

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

| Page                                  | Canonical URL                                                    | Upstream last updated |
| ------------------------------------- | ---------------------------------------------------------------- | --------------------- |
| Code in text                          | <https://developers.google.com/style/code-in-text>               | 2026-01-06            |
| Code samples                          | <https://developers.google.com/style/code-samples>               | 2025-10-10            |
| Document command-line syntax          | <https://developers.google.com/style/code-syntax>                | 2025-10-10            |
| Format placeholders                   | <https://developers.google.com/style/placeholders>               | 2026-08-13            |
| API reference code comments           | <https://developers.google.com/style/api-reference-comments>     | 2026-07-01            |
| Verb forms in reference documentation | <https://developers.google.com/style/reference-verbs>            | 2024-10-15            |
| Procedures                            | <https://developers.google.com/style/procedures>                 | 2026-06-08            |
| Prescriptive documentation            | <https://developers.google.com/style/prescriptive-documentation> | 2025-02-07            |
| UI elements and interaction           | <https://developers.google.com/style/ui-elements>                | 2026-05-06            |

---

## Code in text

In ordinary text sentences (as opposed to, say, [code samples](https://developers.google.com/style/code-samples)),
use code font to mark up most things that have anything to do with code. Code
font helps to clarify for your reader which text refers to an entity in these
ways:

- Signals to your reader that the text is meant to be entered
  verbatim.
- Shows where the boundaries of the text to enter are.
- Clearly separates the entity from surrounding text.

To mark text as code font, use the following:

- In HTML, use the `code` element.
- In Markdown, use backticks (`` ` ``).

For information about choosing HTML or Markdown, see [Markdown versus HTML](https://developers.google.com/style/markdown).

This page explains how to format code in ordinary text sentences. For more information about
formatting and explaining placeholders, command-line syntax, and code samples, see the following
resources:

- [Formatting placeholders](https://developers.google.com/style/placeholders)
- [Documenting command-line syntax](https://developers.google.com/style/code-syntax)
- [Code samples](https://developers.google.com/style/code-samples)
- [Code style guides](https://developers.google.com/style/code-samples#coding)
- [Formatting a heading or title](https://developers.google.com/style/headings#formatting-a-heading-or-title)

### Some specific items to put in code font

The following table includes items that should be in code font, but it's not an exhaustive
list:

| Item                                                                                                                                                  | Recommended                                                                                                                                                                                                                                                                             |
| ----------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Attribute names and values                                                                                                                            | The `imageURL` attribute contains the path for the image file that you can open in a browser—for example, `https://www.example.com/images/product.jpg`. You can create a VM instance using the `e2-highcpu-16` machine type in the `us-central1-a` region.                              |
| Class names                                                                                                                                           | The `SnapshotDiskOperator` class includes the `generate_snapshot_name` method.                                                                                                                                                                                                          |
| Command output                                                                                                                                        | The output is similar to the following: `Found sysprep-specialize-script-ps1 in metadata.         ...         Finished running specialize scripts.         `                                                                                                                            |
| [Command-line utility names](#tool-names), such as `gcloud`, `gsutil`, `kubectl`, and `bq`                                                            | You can use the `kubectl` tool to define a network policy.                                                                                                                                                                                                                              |
| Data types                                                                                                                                            | Nested data is represented as a `STRUCT` type.                                                                                                                                                                                                                                          |
| Database elements (such as row and column names)                                                                                                      | The query extracts the `month`, `julianday`, and `dayofweek` values from the `datetime` and `timestamp` columns.                                                                                                                                                                        |
| Defined (constant) values for an element or attribute                                                                                                 | The constant `city` has the value `"San Francisco"`.                                                                                                                                                                                                                                    |
| [DNS record types](https://wikipedia.org/wiki/List_of_DNS_record_types)                                                                               | Create a DNS `AAAA` record in your public DNS zone that points to the IP address of the load balancer.                                                                                                                                                                                  |
| Element names (HTML and XML)                                                                                                                          | The `script` and `df-messenger` HTML elements should be in the `body` element of your page. A C-CDA document contains a header and a body enclosed within a `ClinicalDocument` XML element. When you refer to an element name, don't put angle brackets (`<>`) around the element name. |
| Enum (enumerator) names                                                                                                                               | Generated from the protobuf enum `BOOL = 1;`.                                                                                                                                                                                                                                           |
| Environment variable names                                                                                                                            | Set the `CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES` environment variable to include the resolution of your monitor.                                                                                                                                                                   |
| Filenames, [filename extensions](https://developers.google.com/style/filenames#file-type-names) (if used), and paths                                  | Open the `pg_hba.conf` file, which is typically in the `/etc/postgresql/13/main` directory.                                                                                                                                                                                             |
| Folders and directories                                                                                                                               | The configuration information for the reader deployment is in the `opentsdb-read.yaml.tpl` file in the `deployments` folder of the guide repository.                                                                                                                                    |
| [HTTP content-type](https://www.w3.org/Protocols/rfc1341/4_Content-Type.html) values                                                                  | The value of the `Content-Type` header value is required and must be set to `application/fhir+json` as defined in the FHIR specification.                                                                                                                                               |
| [HTTP status codes](#statuscodes)                                                                                                                     | The HTTP `500 Internal Server Error` status code indicates that the server encountered an unexpected condition that prevented it from fulfilling the request.                                                                                                                           |
| HTTP verbs                                                                                                                                            | To specify image content directly using a local image file, you can use a `POST` request.                                                                                                                                                                                               |
| IAM role names                                                                                                                                        | Grant the new service account the `roles/cloudfunctions.invoker` IAM role for the `trace` function.                                                                                                                                                                                     |
| IP addresses                                                                                                                                          | The other nodes of the cluster should contact this host on IP address `10.10.10.10.`                                                                                                                                                                                                    |
| Language keywords                                                                                                                                     | The SQL statement contains the dataset table name after the `FROM` keyword in the format of `*PROJECT_NAME*.*DATASET*.*TABLE_NAME*`.                                                                                                                                                    |
| [Method and function names](#methods)                                                                                                                 | The `ST_GEOPOINT` function uses the longitude and latitude of the Colosseum in Rome. To fetch the status of the job, call the `get_job_status` method.                                                                                                                                  |
| Namespace aliases                                                                                                                                     | Use Config Sync to apply the package only to the `default` namespace.                                                                                                                                                                                                                   |
| [Placeholder variables](https://developers.google.com/style/placeholders)                                                                             | Replace `*SUBNETWORK_NAME*` with the resource ID of the private subnet that you want the blueprint to use.                                                                                                                                                                              |
| Package names                                                                                                                                         | The Beautiful Soup library for parsing web pages is distributed as the `beautifulsoup4` package.                                                                                                                                                                                        |
| Port numbers                                                                                                                                          | Each member Pod must have a container that's listening on TCP port `50000`.                                                                                                                                                                                                             |
| Query parameter names and values                                                                                                                      | If you want to return all contents under a directory, use the `recursive=true` query parameter with your request.                                                                                                                                                                       |
| Strings (such as URLs or domain names) that are used in commands and code                                                                             | In IAM, a condition can specify a page that only Human Resources admins can access—for example, `https://hr.example.com`. The `logID` field includes the domain `corpaudits.example.com`.                                                                                               |
| Text input                                                                                                                                            | In the **Key name** field, enter `config-management`.                                                                                                                                                                                                                                   |
| [UI elements](https://developers.google.com/style/ui-elements) that are rendered based on previously entered text (such as a server or instance name) | From the **Server name** list, select **`my-sql-cluster1`**. Click **`my-instance`**. If a code-formatted element appears in UI, add bold as well. For more information, see [Code in UI elements](#code-in-ui).                                                                        |

Generally, don't put quotation marks around code unless the quotation marks
are part of the code.

### Items to put in ordinary (non-code) font

The following table includes items that should not be in code font, but it's
not an exhaustive list. If you're referring to any of these items as computer input or output,
or as a code entity like an attribute or value, then use code font.

| Item                                                    | Recommended                                                                                                                                                                                                                                                                        |
| ------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Domain names                                            | The test environment is designed only for standard application offerings from example.com.                                                                                                                                                                                         |
| Names of products, services, and organizations          | Example Organization has current and former employees who use Google products such as Google Docs and Google Sheets.                                                                                                                                                               |
| URLs that the reader is supposed to follow in a browser | You can find support at https://support.example.com. It's usually best to format a URL as a link and use descriptive link text instead of exposing the URL itself. For more information, see [Avoid URLs as link text](https://developers.google.com/style/cross-references#urls). |

### Code in UI elements

If a [UI element](https://developers.google.com/style/ui-elements#formatting) meets the [requirements for code font](#code),
then use both code font and bold for that element.

Recommended: In the **Network** list, select **`my-net-2`**.

Recommended: In the **Query results** pane,
the **`Store`** column is displayed.

### Items that are sometimes in code font

The following list includes items that are sometimes in code font, but it's not an exhaustive
list.

- **Boolean values**. If you refer directly to a Boolean data type value (such
  as `true` or `false`, or `1` or `0`), then format
  the value as code. If you refer to the evaluation of a Boolean condition as true or
  false, then refer to the evaluation in non-code font.

  Recommended:

  - If the update succeeds, returns `true`.
  - `enableCertificateValidation`: If true, validates the SSL certificate
    before proceeding. If false, trusts the certificate without validating it.

- **Command-line utility names**. Often, command-line utility names are spelled the same
  as the software project or product with which they are associated, with only differences in
  capitalization. In such cases, use code font for the command and ordinary font for the name of
  the project or product.

  Recommended:

  - Invoke the GCC 8.3 compiler using `gcc` for C programs or `g++` for C++ programs.
  - To send the file over FTP with IPv6, use `ftp -6`.
  - The options for the `curl` command are explained on the
    curl project website.
  - The `apt` program includes commands from the `apt-get` and `apt-cache` programs for working with APT packages.

- **Email addresses as input or output**. If you want the reader to use the email address
  as computer input or output, use code font. If you want the reader to treat the email address as
  a way to contact someone or a reference to someone, use non-code font and hyperlink the email
  address.

  Recommended:

  - Enter the username, not the full email address. For example, enter `alex`,
    not `alex@example.com`.
  - For help, contact <support@example.com>.

### Method names

When you refer to a method name in text, omit the class name except where
including it would prevent ambiguity.

Recommended: To retrieve the zebra's
metadata, call its `get` method.

Not recommended: To retrieve the zebra's
metadata, call its `animal.get` method.

### HTTP status codes

To refer to a single status code, use the following formatting and
phrasing:

an HTTP `400 Bad Request` status code

In particular, call it a _status code_ instead of a _response
code_ or _error code_, and put the number and the name in code font.
If the _HTTP_ is implicit from context, you can leave it out.

To refer to a range of codes, use the following form:

an HTTP `2xx` or `400` status code

In particular, use **N*xx* (with a specific digit in place of _N_) to indicate _anything in the *N*00-*N*99
range_, and put the status code number in code font even if you're leaving
out the code's name.

If you prefer to specify an exact range, you can do so:

an HTTP status code in the `200`-`299` range

Here, too, put the numbers in code font.

### Grammatical treatment of code elements

In general, don't use code elements such as keywords and filenames as if they were
English verbs or nouns. Don't inflect the name of a code element, such as to make it
plural or possessive. Instead, include a noun after the name of the code element, and
inflect that noun.

| Recommended                                                                                                                                                                                            | Not recommended                                                                  |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------- |
| The `ADDRESS` constant's value is defined in the `settings.h` file.                                                                                                                                    | `ADDRESS`'s value is defined in `settings.h`.                                    |
| To add the data, send a `POST` request.                                                                                                                                                                | `POST` the data.                                                                 |
| To retrieve the data, send a `GET` request.                                                                                                                                                            | Retrieve information by `GET`ting the data.                                      |
| You can't close the file before opening it. You can't call the `close` method for a file before you call `open`.                                                                                       | `Close`ing the file requires you to have `open`ed it first.                      |
| Takes an array of extended ASCII code points (an array of `INT64` values) and returns `BYTES` values. For `STRING` arguments, returns the original string with all alphabetic characters in uppercase. | Takes an array of extended ASCII code points (ARRAY of INT64) and returns BYTES. |

### Linking API terms in Android

When you're writing code comments that you'll turn into generated reference
documentation, link to the first instance of each element of Android APIs, such as classes, methods,
constants, and XML attributes. Use code font and regular HTML `a` elements to link to this reference material.
For later uses of the same API element in the same section, use code font
but do not link to the reference documentation.

Link `AndroidManifest.xml` elements and attributes to the API
guide pages. Link the attribute for a particular widget or layout to its Javadoc
in the widget or layout's API reference entry.

Recommended:

```
<a href="/guide/topics/manifest/data-element.html">data</a>
```

Very common classes such as `Activity` and `Intent` don't need to be linked every time. If you use a term as a concept rather than a
class, then don't put it in code font and don't capitalize it. Here are some
objects that do not always require Javadoc links or capitalization:

- activity, activities
- service
- fragment
- view
- loader
- action bar
- intent
- content provider
- broadcast receiver
- app widget

If you use one of these terms in the context of referring to an actual
instance, use the formal class name and link to its reference page. Here are two
examples:

Recommended: The [`Activity` class](https://developer.android.com/reference/android/app/Activity.html) is an important part of an application's overall lifecycle...

Recommended: The user interface for an
activity is provided by a hierarchy of views—objects derived from the [`View` class](https://developer.android.com/reference/android/view/View.html).

To link to a class or method:

- To link to a class, use the class name as link text—for example:

```
<a href="/reference/android/widget/TextView">TextView</a>
```

- To link to a method, use the method name as a fragment identifier. If
  you're linking to a static method, also include the class name in the link
  text. If you need to distinguish between overloaded versions of a particular
  method, consider showing the full signature—for example:

```
<a href="/reference/android/app/Activity.html#onCreate(android.os.Bundle)">onCreate(Bundle)</a>
```

- To link the attribute for a particular widget or layout to its Javadoc
  in the widget or layout's API reference entry, use the URL for the page, and
  then add the fragment identifier `#attr_android:*ATTRIBUTE_NAME*`. For example, to link to

the XML attribute `android:inputType` for the `TextView` widget, add the following:

```
<a href="/reference/android/widget/TextView.html#attr_android:inputType>inputType</a>
```

_Source: <https://developers.google.com/style/code-in-text>_

---

## Code samples

This page explains how to format code samples. For more information about formatting and
explaining code that appears in text, command-line syntax, and placeholders, see the following
resources:

- [Code in text](https://developers.google.com/style/code-in-text)
- [Documenting command-line syntax](https://developers.google.com/style/code-syntax)
- [Formatting placeholders](https://developers.google.com/style/placeholders)

### Basic guidelines

Follow these guidelines when formatting code samples:

- **Follow the indentation guidelines in the relevant [code style guide](#coding)**. For most programming languages, this means using
  spaces instead of tabs and using two spaces for each indentation level. However, some contexts
  use four spaces for each indentation level, and some contexts use tabs. This guidance applies to
  formatting code samples, not to [formatting commands](https://developers.google.com/style/code-syntax#formatting-a-command).

- **Wrap lines** at 80 characters. If you expect readers to have a relatively narrow
  browser window or to print out your document, consider wrapping at a smaller number of
  characters for readability.

- **Mark code blocks as preformatted text**. In HTML, use a `pre` element;
  in Markdown, indent every line of the code block by four spaces.

- **Indicate omitted code by using a comment** in the syntax of the language of your code
  sample. Don't use three dots or the ellipsis character (`…`). If a code
  block contains an omission, don't format the block as click-to-copy.

Recommended:

```
<pre>
function helloWorld() {
  alert('Hello, world! This sentence is so long that it wraps onto a second
    line.');
}
</pre>
```

This renders the following code block:

```
function helloWorld() {
  alert('Hello, world! This sentence is so long that it wraps onto a second
    line.');
}
```

Recommended:

```
apiVersion: serving.knative.dev/v1
kind: Service
# Several lines of code are omitted here.
spec:
  template:
    spec:
      containers:
      - image: *IMAGE_URL*
        ports:
        - name: h2c
          containerPort: 8080
```

### Introductory statements

In most cases, precede a code sample with an introductory sentence or
paragraph. The introduction can end with a colon or a period; usually a colon if it
immediately precedes the sample, usually a period if there's more material (such
as a note paragraph) between the introduction and the sample, or if the
introduction paragraph ends in a sentence that isn't directly related to the
sample.

Recommended (ending with a period): The
following code sample shows how to use the `get` method. For
information about other methods, see [link]. [sample]

Also recommended: The following code
sample shows how to use the `get` method: [sample] For information about
other methods, see [link].

Not recommended (ending with a colon): The
following code sample shows how to use the `get` method. For
information about other methods, see [link]: [sample]

For more information about how to introduce code samples, see [Document command-line syntax](https://developers.google.com/style/code-syntax).

### Code style guides

The following public Google coding-style guides are available on GitHub:

- [C++ style guide](https://google.github.io/styleguide/cppguide.html).
- [HTML/CSS style guide](https://google.github.io/styleguide/htmlcssguide.html).
- [Java style guide](https://google.github.io/styleguide/javaguide.html).
- [JavaScript style guide](https://google.github.io/styleguide/javascriptguide.xml).
- [Python style guide](https://google.github.io/styleguide/pyguide)
- [Full list of Google's programming style guides](https://google.github.io/styleguide/)

Some open source projects have their own overriding style guides. For
example, Java code in the Android Open Source Project follows the [AOSP Java Code Style for Contributors](https://source.android.com/setup/contribute/code-style) guide.

_Source: <https://developers.google.com/style/code-samples>_

---

## Document command-line syntax

This page shows how to document command-line commands and their arguments. For more
information about formatting code that appears in text, placeholders, and code samples, see the
following links:

- [Code in text](https://developers.google.com/style/code-in-text)
- [Formatting placeholders](https://developers.google.com/style/placeholders)
- [Code samples](https://developers.google.com/style/code-samples)

### Best practices

When you write procedural or conceptual documentation for a command-line command, apply the
following best practices:

- **Provide an inline link to the command reference**. A good place for that link is in
  the text that introduces the command or a series of steps.

  Recommended:

  To connect to the instance, use the [`gcloud compute ssh` command](https://cloud.google.com/sdk/gcloud/reference/compute/ssh):

```
gcloud compute ssh
```

- **Determine which arguments are needed to complete each task in the recommended way**.
  To minimize the number of options that you need to document in non-reference content, use as
  few optional arguments as possible. Rely on the command reference for the complete list of
  arguments.

- **Provide a click-to-copy command example that the reader doesn't need to edit after they
  copy it**. If possible, include only runnable code and placeholder variables in the
  click-to-copy example.

  Some command examples contain [optional arguments](#optional-arguments), [mutually exclusive arguments](#set-of-two-arguments), or [repeated arguments](#arguments-that-can-repeat) that are indicated by square brackets (`[]`), pipes (`|`),
  braces (`{}`), and ellipses (`...`). These characters can break
  commands if they're not first removed. For that reason, avoid using these
  arguments in click-to-copy examples.

  For more information, see the [Optional arguments in click-to-copy commands](#click-to-copy-commands) section of this document.

### Format a command

To mark a block of code such as a lengthy command or a code sample, use the
following formatting:

- In HTML, use the `pre` element.
- In Markdown, use a code fence (` ``` `).

To format a command with multiple elements, do the following:

- When a line exceeds 80 characters, you can safely add a line break before
  some characters, such as a single hyphen, double hyphen, underscore, or
  quotation marks. After the first line, indent each line by four spaces to vertically align each line
  that follows a line break.

- When you split a command line with a line break, each line except the
  last line must end with the command-continuation character. Commands that don't
  have the command-continuation character don't work.

  - Linux or Cloud Shell: A backslash typically preceded with a space
    (` \`)
  - Windows: A caret preceded with a space (` ^`)

- Format placeholder text with [placeholders](https://developers.google.com/style/placeholders).

- Follow the command line with a descriptive list of the placeholders
  used in the command line. For more information, see [Explaining placeholders](https://developers.google.com/style/placeholders#explain-placeholders).

- When documenting a command-line option or argument, use end puctuation for complete
  sentences. Don't use end punctuation for single words or noun phrases, unless there is a mix of
  sentences and noun phrases. This guidance is similar to [end punctuation in lists](https://developers.google.com/style/lists#capitalization-and-end-punctuation).
  For more information, see [Google AIP guidelines for documentation](https://google.aip.dev/192#style).

When you're documenting a `bash` or `sh` command, follow the [quotation mark style](https://google.github.io/styleguide/shellguide.html#s5.7-quoting) in Google's shell style guide.

### Command prompt

If your command-line instructions show multiple lines of input in one block, then start each line
of input with the prompt symbol. If you don't want users to copy the prompt symbol when they copy
the command, you might be able to turn off text selection for the symbol—for example, by using
CSS.

Don't show the current directory path before the prompt, even if
part of the instruction includes changing directories. However, if the overall
context of the command interface changes—such as from the local machine
to a remote machine—then add an additional prompt indicator, as appropriate, for
the new context.

Recommended:

Enter the following code into the terminal:

```
$ adb devices
```

The output is the following:

```
List of devices attached
emulator-5554  device
emulator-5556  device
```

Recommended:

```
$ adb shell
shell@ $ screencap /sdcard/screen.png
shell@ $ exit
$ adb pull /sdcard/screen.png
```

When you're showing a one-line command, the command prompt
(the `$` symbol) is optional. However, if your document includes both
multi-line and one-line commands, then we recommend using the command prompt
for all of the commands in the document for consistency.

If your command-line instructions include a combination of input and output
lines, we recommend using separate code blocks for input and output.

Recommended:

```
$ cat ~/.ssh/my-ssh-key.pub
```

The output is similar to the following:

```
ssh-rsa *KEY_VALUE* *USERNAME*
```

### Optional arguments

Use square brackets around an argument to indicate that it's optional. If there's more than one
optional argument, enclose each item in its own set of square brackets.

Avoid using optional arguments in click-to-copy code examples. For best practices on documenting
optional arguments with click-to-copy commands, see the [Best practices](#best-practices) and [Optional arguments in click-to-copy commands](#click-to-copy-commands) sections of this document.

In the following example, `*GROUP*` is required, but `*GLOBAL_FLAG*` and `*FILENAME*` are optional:

```
gcloud dns *GROUP* [*GLOBAL_FLAG*] [*FILENAME*]
```

### Mutually exclusive arguments

Use curly braces to indicate that the reader must choose one—and only one—of the
items inside the braces. There can be more than two mutually exclusive choices. To separate each
choice, use a pipe (`|`).

Avoid using mutually exclusive arguments in click-to-copy code examples. For best practices on
documenting mutually exclusive arguments with click-to-copy commands, see the [Best practices](#best-practices) and [Optional arguments in click-to-copy commands](#click-to-copy-commands) sections of this document.

In the following example, choose either `*FILE_1*` or `*FILE_2*`:

```
{*FILE_1*|*FILE_2*}
```

In the following example, there are also two options:

- Left side of pipe: If the source code is deployed from a cloud
  repository, the following is required:
  `--source=*CLOUD_SOURCE* --source-url=*SOURCE_URL*`
- Right side of pipe: If the source code is in a local directory:
  - `--bucket=*BUCKET*` is required.
  - `--source=*LOCAL_SOURCE*` is optional, as specified by the square
    brackets.

```
{--source=*CLOUD_SOURCE* --source-url=*SOURCE_URL* | --bucket=*BUCKET* [--source=*LOCAL_SOURCE*]}
```

### Arguments that can repeat

Use three dots and no spaces (`...`) to indicate that the reader can specify multiple
values for the argument.

Avoid using an ellipsis in click-to-copy code examples. For best practices on documenting optional
arguments with click-to-copy commands, see the [Best practices](#best-practices) and [Optional arguments in click-to-copy commands](#click-to-copy-commands) sections of this document.

In this example, the reader can specify multiple instances of the optional
parameter `*GLOBAL_FLAG*`:

```
gcloud dns *GROUP* [*GLOBAL_FLAG* ...]
```

### Optional arguments in click-to-copy commands

[Optional arguments](#optional-arguments), [mutually exclusive arguments](#set-of-two-arguments), and [repeated arguments](#arguments-that-can-repeat) contain characters (such as square brackets, curly braces, pipes, and ellipses) that can break
commands if the reader doesn't remove them. Avoid using these types of arguments in click-to-copy
commands. Instead, choose one of the following approaches:

- **Remove the optional arguments**. As a best practice, [use only the necessary arguments](#best-practices) to complete the task for the most common use case. If possible, remove optional arguments from
  the command; always provide a link to the command reference for the command, where readers can
  find the full list of options. For more information, check with product management or a
  technical support specialist for the most relevant arguments.

  Recommended:

  To get an aggregate list of all virtual machine (VM) instances in all zones for a project,
  use the [`gcloud compute instances list` command](https://cloud.google.com/sdk/gcloud/reference/compute/instances/list):

```
gcloud compute instances list
```

If you want to narrow the list of VMs to a specific zone, use the previous command with the `--zones` flag.

- **Use separate code blocks for each option**. In some cases, it might be ideal to
  provide more than one click-to-copy code block within the same section.

  Recommended:

  To create a bootable Compute Engine image, use the [`gcloud compute images import` command](https://cloud.google.com/sdk/gcloud/reference/compute/images/import):

```
gcloud compute images import *IMAGE_NAME* \
    --source-file=*SOURCE_FILE*
```

If you're importing an image with an existing license, specify the `--byol` flag:

```
gcloud compute images import *IMAGE_NAME* \
    --source-file=*SOURCE_FILE* \
    --byol
```

- **Document optional arguments in separate tasks**. In some cases, it might be best to
  treat different options in separate sections.

  Recommended:

  To create a bootable or non-bootable Compute Engine image based on an existing virtual
  disk, use the [`gcloud compute images import` command](https://cloud.google.com/sdk/gcloud/reference/compute/images/import).

#### Import a bootable virtual disk

If your virtual disk has a bootable operating system installed on it, run the following
command:

```
gcloud compute images import *IMAGE_NAME* \
    --source-file=*SOURCE_FILE*
```

#### Import a non-bootable virtual disk

If your virtual disk doesn't have a bootable operating system installed on it, include the `--data-disk` flag:

```
gcloud compute images import *IMAGE_NAME* \
    --source-file=*SOURCE_FILE* \
    --data-disk
```

- **Let the reader know that the command contains optional arguments**. If you must
  include special characters to indicate optional arguments, indicate that fact when you
  introduce the command.

  Recommended:

  To create a VM with a custom name and attach one or more existing stateful disks to that VM,
  use the [`gcloud compute instance-groups managed create-instance` command](https://cloud.google.com/sdk/gcloud/reference/compute/instance-groups/managed/create-instance) with one or multiple `--stateful-disk` flags. In the following example, you
  optionally specify the `auto-delete` subflag to keep or discard each disk when the
  VM is permanently deleted:

```
gcloud compute instance-groups managed create-instance *NAME* \
    --instance=*VM_NAME* \
    --stateful-disk=device-name=*DEVICE_NAME*,source=*DISK*[,auto-delete=*DELETE_RULE*]
```

For example, the following command creates a managed instance that's named `db-instance` and attaches the persistent disk `db-data-disk-1` as a
stateful disk that is detached and preserved if its VM is deleted:

```
gcloud compute instance-groups managed create-instance example-database-mig \
    --instance=db-instance \
    --stateful-disk=device-name=data-disk,source=projects/example-project/zones/us-east1-c/disks/db-data-disk-1,auto-delete=never
```

### Output from commands

You don't have to show output for every command. Add output only if it adds value—for
example, if the reader needs to copy a value from the output or if they need to verify a value
in the output.

If you are showing output, use one of the following introductory phrases to separate the command
from the output.

Recommended: The output is similar to the following:

Recommended: The output is the following:

If you want to explicitly call out something about the output, you can customize the introductory
phrase.

Recommended: The output is similar to the
following, in which the `IP` column shows the IP address for each resource:

To indicate that one or more lines of output are omitted from sample output, use three dots and
no spaces (`...`) on a separate line. Do not use the ellipsis character (`…`).
For example:

```
Reading file status
Upload done, resetting board...
...
Wakeup reason: 0
```

For more information about presenting output, also see the following:

- For more information about how to present output in procedures, see [Order of multiple components in a step](https://developers.google.com/style/procedures#order-of-multiple-components-in-a-step).
- For more information about using placeholders in output, see [Placeholders in output](https://developers.google.com/style/placeholders#placeholders-in-output).
- For more information about using examples such as domain names and IP addresses in output, see [Example domains and names](https://developers.google.com/style/examples).

### Command-line terminology

When discussing commands and their constituent parts in the `gcloud` CLI
and in Linux commands, follow this guidance:

- Avoid mapping nomenclature of the `gcloud` CLI's commands to
  Linux commands.
- Linux commands can be complicated. It's wise to describe what the entire
  command does rather than what its individual elements are called.
- For Linux commands or commands in the `gcloud` CLI, ask yourself if the reader must
  know the name of the command-line element or if explaining the command is sufficient.

#### gcloud commands

```
gcloud *GROUP* | *COMMAND* [--account=*ACCOUNT*] [--configuration=*CONFIGURATION*] \
    [--flatten=[*KEY*,...]][--format=*FORMAT*] [--help] [--project=*PROJECT_ID*] \
    [--quiet, -q][--verbosity=*VERBOSITY*; default="warning"] [--version, -v] \
    [-h] [--log-http][--trace-token=*TRACE_TOKEN*] [--no-user-output-enabled]
```

For the sake of accurate classification, the `gcloud` CLI's
syntax distinguishes between a _command_ and a _command group_. In
docs, however, command-line contents are generally referred to as commands.

You can use commands (and groups) alone or with one or more flags. A _flag_ is a Google Cloud-specific term for any element
other than the command or group name itself. A command or flag might also
take an _argument_, for example, a region value.

##### Example command

```
gcloud init
```

##### Example command with a flag

```
gcloud init --skip-diagnostics
```

##### Example command with multiple elements

```
gcloud ml-engine jobs submit training ${JOB_NAME} \
    --package-path=trainer \
    --module-name=trainer.task \
    --staging-bucket=gs://${BUCKET} \
    --job-dir=gs://${BUCKET}/${JOB_NAME} \
    --runtime-version=1.2 \
    --region=us-central1 \
    --config=config/config.yaml \
    -- \
    --data_dir=gs://${BUCKET}/data \
    --output_dir=gs://${BUCKET}/${JOB_NAME} \
    --train_steps=10000
```

The preceding command consists of the following elements:

- `ml-engine` is a `gcloud` command group.
- `jobs` is an `ml-engine` command group.
- `submit` is a `jobs` command group.
- `training` is a `submit` command.
- `${JOB_NAME}` is an argument that refers to an environment
  variable called `JOB_NAME` that was set earlier.
- `--package-path` is a flag set to a path to a Python package to build.
- `--` in isolation separates the `gcloud` arguments that precede it from
  the [user arguments](https://cloud.google.com/sdk/gcloud/reference/ml-engine/jobs/submit/training#USER_ARGS) that follow it.

In addition to the term flag, _option_ is often used as a
catchall term when you don't want to mire the reader in specialized
nomenclature.

For more information, see the [Cloud SDK: gcloud](https://cloud.google.com/sdk/gcloud/reference/) topic.

#### Linux commands

> **Caution**: Linux command syntax is notoriously complex. This section covers only the most
> common elements. For a more detailed reference, see
> [The Linux Command Line](http://wiki.lib.sun.ac.za/images/c/ca/TLCL-13.07.pdf).

Where the `gcloud` CLI uses the catchall terms
flag and option, Linux commands use _options_, _parameters_, _arguments_, and a host of specialized syntax elements. The following is an
example:

```
find /usr/src/linux -follow -type f -name '*.[ch]' | xargs grep -iHn pcnet
```

The preceding command consists of the following elements:

- `find` is the command name.
- `/usr/src/linux` is an argument that specifies the path to look
  in. Easier to refer to as only a path.
- `-follow` is an option. The hyphen (`-`), often called a _dash_ in
  this context, is part of the option.
- `-type` is an option with a value of `f`.
- `-name` is an option with a value of `'*.[ch]'`, where
  the asterisk (`*`) is a _metacharacter_ signifying a wildcard.
  Metacharacters are used in Linux shell commands for _globbing_, or filename
  expansion. In addition to the asterisk, metacharacters include the question mark
  (`?`) and caret (`^`).

The results of the first command are redirected by using a _pipe_ (`|`) to the `xargs grep -iHn pcnet` command. Other
redirection symbols include the greater than symbol (`>`), less than symbol
(`<`), left double angle quotation mark (`<<`), and right double
angle quotation mark (`>>`). Redirection means capturing
output from a file, command, program, script, or even code block within a script
and sending it as input to another file, command, program, or script.

#### Linux signals

Linux signals require vocabulary choices that
are generally discouraged elsewhere in documentation. We recommend using the terms in the
following table _only_ in the context of process control:

| Signal       | Description                                                                                                                                                                                                                                                                                                        |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `SIGKILL`    | Signal sent to _kill_ a specified process, all members of a specified process group, or all processes on the system. `SIGKILL` cannot be caught, blocked, or ignored. Do not substitute _cancel_, _end_, _exit_, _quit_, _stop_, or _terminate_.                                                                   |
| `SIGTERM`    | Signal sent as a request to _terminate_ a process. Although similar to `SIGKILL`, this signal gives the process a chance to clean up any child processes that might be running. Do not substitute _cancel_, _end_, _exit_, _quit_, or _stop_.                                                                      |
| `SIGQUIT`    | Signal sent from a keyboard to _quit_ a process. Some processes can catch, block, or ignore a quit signal. Do not substitute _cancel_, _end_, _exit_, _quit_, or _stop_.                                                                                                                                           |
| `SIGINT`     | Signal sent to _interrupt_ a process immediately. The default action of this signal is to terminate a process gracefully. It can be handled, ignored, or caught. It can be sent from a terminal—for example, when a user presses `Control+C`. Do not substitute _suspend_, _end_, _exit_, _pause_, or _terminate_. |
| `SIGPAUSE`   | Signal that tells a process to _pause_, or _sleep_, until any signal is delivered that either terminates the process or invokes a signal-catching function. Do not substitute _cancel_ or _interrupt_.                                                                                                             |
| `SIGSUSPEND` | Signal sent to temporarily _suspend_ execution of a process. Used to prevent delivery of a particular signal during the execution of a critical code section. Do not substitute _pause_ or _exit_.                                                                                                                 |
| `SIGSTOP`    | Signal sent to _stop_ execution of a process for later continuation (upon receiving a `SIGCONT` signal). `SIGSTOP` cannot be caught, blocked, or ignored. Do not substitute _cancel_, _end_, _exit_, _interrupt_, _quit_, or _terminate_.                                                                          |

_Source: <https://developers.google.com/style/code-syntax>_

---

## Format placeholders

This page explains how to format placeholders in commands, code samples, and text
strings. This page doesn't explain how to implement visual styling for placeholders, but it does
show examples of how Google developer documentation style renders placeholders as visually
distinct from other text.

For more information about formatting code, command-line syntax, and code samples, see the
following links:

- [Code in text](https://developers.google.com/style/code-in-text)
- [Documenting command-line syntax](https://developers.google.com/style/code-syntax)
- [Code samples](https://developers.google.com/style/code-samples)

Placeholders in sample code and commands represent values that the reader must replace when they use
the sample input. Placeholders in example output can also represent other values that vary. In
general, a placeholder has a descriptive name as a default value.

For example, the placeholder `*PROJECT_ID*` represents a project ID in sample
code, commands, and example output.

In example output, the placeholder `*HTTP_RESPONSE_CODE*` represents an
HTTP response code; the reader isn't expected to set this to a specific value.

### Placeholders

When you create placeholders follow this general guidance around using the letter _x_:

- In general, don't use a single _x_ or a series of _x_'s as placeholders; use a more
  informative placeholder.
- In some contexts (such as HTTP status codes), a series of _x_'s is the standard,
  so it's OK to use (for example) _xx_ in those cases.

There are several ways to format placeholders, depending on whether you're
working in HTML or Markdown, or whether the placeholder is inline, in a code block, or in a
paragraph. For details, see the following sections.

#### Placeholders in inline text

If your sample code and command placeholders occur in a sentence, use the following formatting:

- In HTML, wrap variable placeholders by using the `var` element, like this:

```
<code><var>PLACEHOLDER_NAME</var></code>
```

- In Markdown, wrap inline placeholders in backticks (`), and use an
asterisk (*) before the first backtick and after the second one
(``*`PLACEHOLDER_NAME`*``).

If your placeholder does not represent a code sample or command, use the following formatting:

- In HTML, wrap placeholders by using the `var` element, like this:

```
<var>PLACEHOLDER_NAME</var>
```

#### Placeholders in code blocks

If your placeholders are in a block of code, use the following formatting:

- In HTML, wrap the code block in a `pre` element,
  and tag placeholders with `var` elements:

```
<pre>
gcloud compute forwarding-rules create <var>FORWARDING_RULE_NAME</var> \
    --global | --region=<var>REGION</var> \
    --load-balancing-scheme=<var>LOAD_BALANCING_SCHEME</var> \
    --network=<var>NETWORK</var> \
    ...
</pre>

```

- In Markdown, wrap the code block in a code fence (```). Inside a
  code fence, you can't apply formatting like bold or italic.

````
```
PLACEHOLDER_NAME
```
````

#### Placeholder text

**Use uppercase characters with underscore delimiters.**

For example, in HTML:

Recommended:

- `.../<var>API_NAME</var>`
- `.../<var>METHOD_NAME</var>`

Not recommended:

- `.../<var>API-name</var>`
- `.../<var>API_name</var>`
- `.../<var>API name</var>`
- `.../<var>api_name</var>`
- `.../<var>api-name</var>`
- `.../<var>apiName</var>`

In Markdown:

Recommended:

- `.../*API_NAME*`
- `.../*METHOD_NAME*`

If the context in which your placeholders appear makes using
uppercase characters with underscore delimiters a bad idea, use something else
that makes sense to you, but be internally consistent.

**Don't include possessive adjectives in placeholders.**

Not recommended:

- `.../<var>MY_API_NAME</var>`
- `.../<var>YOUR_API_NAME</var>`

> **Note**: You can mark up command-line syntax with
> [brackets](https://developers.google.com/style/code-syntax#optional-arguments),
> [braces](https://developers.google.com/style/code-syntax#set-of-two-arguments), and
> [ellipses](https://developers.google.com/style/code-syntax#arguments-that-can-repeat). Don't put
> the brackets, braces, or ellipses in the `var` element.

### Explain placeholders

When you use a placeholder in text or code, explain the placeholder the first time you use it.
It's not necessary to repeat the explanation in the document unless doing so might benefit the
reader—for example, in circumstances such as the following:

- Your document is lengthy.
- You've introduced several other placeholders in a long procedure.
- Your document isn't intended to be read from beginning to end.

The following is an example of a command that uses a placeholder with an explanation of that
placeholder:

```
<pre class="devsite-click-to-copy">
gcloud compute instances create <var>INSTANCE_NAME</var> \
    --metadata enable-guest-attributes=TRUE
</pre>

<p>Replace <code><var>INSTANCE_NAME</var></code> with the name that
you want your new VM instance to have.</p>
```

#### Single placeholder

Use the following format for a single placeholder:

- Replace _PLACEHOLDER_ with a description of what
  the placeholder represents.

Recommended:

1. Stream the build logs to the Google Cloud console:

```
gcloud builds log --stream=*BUILD_ID*
```

Replace `*BUILD_ID*` with the ID of the `WORKING` build that
you copied in the preceding step.

#### Two or more placeholders

Use the following format for two or more placeholders:

- Follow the command line with a descriptive list of the placeholders
  used in the command line. Explain what each placeholder represents
  even if the placeholder value is intuitive to you.

- Introduce this list with _Replace the following:_

- List the placeholders in the order in which they appear in the command line.

- Tag each placeholder in a code sample or command with `code` and `var` elements, followed by a [colon and a description that starts with a lowercase letter](https://developers.google.com/style/colons).
  For
  non-code samples, remove the `code` elements—for example:

```
<li><code><var>INSTANCE_NAME</var></code>: description</li>
```

- If the description contains an example, introduce it with an _em dash_ or _such as_—for example:

```
<li><code><var>INSTANCE_NAME</var></code>: description&mdash;for example,...</li>
```

```
<li><code><var>INSTANCE_NAME</var></code>: description, such as...</li>
```

- Each item in the list follows our [list style](https://developers.google.com/style/lists).

Recommended:

1. Set the maximum concurrency target for a new reservation:

```
bq mk \
    --project_id=*ADMIN_PROJECT_ID* \
    --location=*LOCATION* \
    --target_job_concurrency=*CONCURRENCY* \
    --reservation \
    *RESERVATION_NAME*
```

Replace the following:

- `*ADMIN_PROJECT_ID*`: the project that owns the reservation
- `*LOCATION*`: the location of the reservation
- `*CONCURRENCY*`: the maximum concurrency target
- `*RESERVATION_NAME*`: the name of the reservation

Recommended:

1. In Cloud Shell, set the environment variables:

```
export ONPREM_PROJECT=*ON_PREM_PROJECT_NAME* \
    export ONPREM_ZONE=*ZONE*
```

Replace the following:

- `*ON_PREM_PROJECT_NAME*`: the Google Cloud project
  name for your on-premises project. You can find your project number on the
  [Dashboard](https://console.cloud.google.com/home/dashboard) page of the Google Cloud console.
- `*ZONE*`: a [Google Cloud zone](https://developers.google.com/compute/docs/regions-zones#identifying_a_region_or_zone) that's close to your location—for example, `us-east1`.

#### Placeholders in output

If you provide a code output example, explain any placeholders that appear in
sample output:

- Use `var` elements to identify the placeholder text in
  the output.

- Follow the example output with a list of the placeholders used in the
  example.

- Introduce the list of placeholders with _This output includes the
  following values:_

- List the placeholders in the order in which they appear in the
  example.

- Tag each placeholder with a `var` element,
  followed by a colon and a description that starts with a lowercase letter—for example:

```
<li><code><var>INSTANCE_NAME</var></code>: description</li>
```

- If the description contains an example, introduce it with an _em dash_ or _such as_—for example:

```
<li><code><var>INSTANCE_NAME</var></code>: description&mdash;for example,...</li>
```

```
<li><code><var>INSTANCE_NAME</var></code>: description, such as...</li>
```

For more information, see [Output from commands](https://developers.google.com/style/code-syntax#output).

Recommended:

##### Response

The output is similar to the following:

```
{
 "name": "operations/build/*PROJECT_ID*/*OPERATION_ID*",
 "metadata": {
  "@type": "type.googleapis.com/google.devtools.cloudbuild.v1.BuildOperationMetadata",
  "build": {
   "id": "*BUILD_ID*",
   "status": "QUEUED",
   "createTime": "2019-09-20T15:55:29.353258929Z",
   "steps": [
    {
     "name": "gcr.io/compute-image-import/gce_vm_image_import:release",
     "env": [
      "BUILD_ID=*BUILD_ID*"
     ],
     "args": [
      "-timeout=7056s",
      "-image_name=*IMAGE_NAME*",
      "-client_id=api",
      "-data-disk",
      "-source_file=*SOURCE_FILE*"
     ]
    }
   ],
   "timeout": "7200s",
   "projectId": "*PROJECT_ID*",
   "logsBucket": "gs://*PROJECT_NUMBER*.cloudbuild-logs.googleusercontent.com",
   "options": {
    "logging": "LEGACY"
   },
   "logUrl": "https://console.cloud.google.com/gcr/builds/*BUILD_ID*?project=*PROJECT_NUMBER*"
  }
 }
}
```

This output includes the following values:

- `*PROJECT_ID*`: the project ID for the project that
  the image was imported into
- `*OPERATION_ID*`: the ID of the import operation
- `*BUILD_ID*`: the ID of the build for the import
  operation
- `*IMAGE_NAME*`: the name of the image to be
  imported
- `*SOURCE_FILE*`: the URI for the image in Cloud
  Storage—for example, `gs://my-bucket/my-image.vmdk`
- `*PROJECT_NUMBER*`: the number for the import
  project

_Source: <https://developers.google.com/style/placeholders>_

---

## API reference code comments

When you're documenting an API, provide a complete API reference, typically
generated from source code using document comments that describe all public
classes, methods, constants, and other members.

Use the basic guidelines in this document as appropriate for a given programming
language. This document doesn't specify how to mark up document comments.

For more information, see the following resources:

- [AIP-192: Documentation](https://google.aip.dev/192) in Google's API standards
- [Inline API documentation](https://cloud.google.com/apis/design/documentation) in the Google Cloud API design guide
- The specific style guide for each programming language

### Documentation basics

The API reference **must** provide a description for each of the following:

- Every class, interface, struct, and any other similar member of the API (such
  as union types in C++).

- Every constant, field, enum, and typedef.

- Every method, with a description for each parameter, the return value, and any
  exceptions thrown.

The following are **extremely strong suggestions**. In some cases, they don't
make sense for a particular API or in a specific language, but in general,
follow these guidelines:

- On each unique page (for a class, interface, etc.), include a code sample
  (~5-20 lines) at the top.

- Put all API names, classes, methods, constants, and parameters in code font,
  and link each name to the corresponding reference page. Most document
  generators do this automatically for you.

- Put string literals in code font, and enclose them in double quotation marks.
  For example, XML attribute values might be `"wrap_content"` or `"true"`.

- Make sure that the spelling of a class name in documentation matches the
  spelling in code, with capital letters and no spaces (for example, `ActionBar`).

  - Don't make class names plural (`Intents`, `Activities`); instead, add a
    plural noun (`Intent` objects, `Activity` instances). For more
    information, see [Plural product and feature names](https://developers.google.com/style/pluralization#plural-product-and-feature-names).

  - However, if a class has a name that's a common term, you can refer to it
    with the corresponding English word, in lowercase and _not_ in code font
    (activities, action bar).

### Classes, interfaces, structs

In the first sentence of a class description, briefly state the intended purpose
or function of the class or interface with information that can't be deduced
from the class name and signature. In additional documentation, elaborate on how
to use the API, including how to invoke or instantiate it, what some of the key
features are, and any best practices or pitfalls.

Many documentation tools automatically extract the first sentence of each class
description for use in a list of all classes, so make the first sentence unique
and descriptive, yet short. Additionally:

- Don't repeat the class name in the first sentence.

- Don't say "this class will/does ..."

- Don't use a period before the actual end of the sentence, because some
  document generators naively terminate the "short description" at the first
  period. For example, some generators terminate the sentence if they see _e.g._, so use _for example_ instead.

The following example is the first sentence of the description for Android's [`ActionBar` class](http://developer.android.com/reference/android/app/ActionBar.html):

> _A primary toolbar within the activity that may display the activity title,
> application-level navigation affordances, and other interactive items._

### Members

Make descriptions for members (constants and fields) as brief as possible. Be
sure to link to relevant methods that use the constant or field.

For example, here's the description for the `ActionBar` class's [`DISPLAY_SHOW_HOME`](http://developer.android.com/reference/android/app/ActionBar.html#DISPLAY_SHOW_HOME) constant:

> _Show 'home' elements in this action bar, leaving more space for other
> navigation elements. This includes logo and icon._
> _See also: `setDisplayOptions(int)`, `setDisplayOptions(int, int)`_

### Methods

In the first sentence for a method description, briefly state what action the
method performs. In subsequent sentences, explain why and how to use the method,
state any prerequisites that must be met before calling it, give details about
exceptions that may occur, and specify any related APIs.

Document any dependencies (such as [Android permissions](http://developer.android.com/guide/topics/security/permissions.html))
that are needed to call the method, and how the method behaves if such a
dependency is missing (for example, "the method throws a [SecurityException](http://developer.android.com/reference/java/lang/SecurityException.html)"
or "the method returns null").

For example, here's the description for Android's [`Activity.isChangingConfigurations` method](<http://developer.android.com/reference/android/app/Activity.html#isChangingConfigurations()>):

> _Checks whether this activity is in the process of being destroyed in order to
> be recreated with a new configuration. This is often used in `onStop` to
> determine whether the state needs to be cleaned up or if it's passed on to the
> next instance of the activity using `onRetainNonConfigurationInstance`._

Use present tense for all descriptions—for example:

- _Adds a new bird to the ornithology list._

- _Returns a bird._

#### Description

- If a method performs an operation and returns some data, start the description
  with a verb describing the operation—for example:

  - _Adds a new bird to the ornithology list and returns the ID of the new
    entry._

- If it's a "getter" method and it returns a boolean, start with "Checks
  whether ...."

- If it's a "getter" method and it returns something other than a boolean,
  start with "Gets the ...."

- If it has no return value, start with a verb like one of the following:

  - Turning on an ability or setting: "Sets the ...."

  - Updating a property: "Updates the ...."

  - Deleting something: "Deletes the ...."

  - Registering a callback or other element for later reference:
    "Registers ...."

  - For a callback: "Called by ...." (Usually for a method that's named
    starting with "on", such as `onBufferingUpdate`.) For example, "Called by
    Android when ...." Then, later in the description: "Subclasses implement this
    method to ...."

- If it's a convenience method that constructs the class object, start with
  "Creates a ...."

#### Parameters

For parameter descriptions, follow these guidelines:

- Capitalize the first word, and end the sentence or phrase with a period.

- Begin descriptions of non-boolean parameters with "The" or "A" if possible:

  - _The ID of the bird you want to get._

  - _A description of the bird._

- For boolean parameters that tell the API to do or not do something, state
  what the API does if the parameter is true and if it's false. For example:

  - _`enableCertificateValidation`: If true, validates the SSL certificate
    before proceeding. If false, trusts the certificate without validating it._

- For boolean parameters that declare the already-established state of something
  (rather than telling the API to do something), use the format "True if ...;
  false otherwise." For example:

  - _True if the zoom is set; false otherwise._

- In this context, don't put the words "true" and "false" in code font or
  quotation marks.

- For parameters with default behavior, explain what the behavior is for each
  value or range of values, and then say what the default value is. Use the
  format _Default:_ to explain the default value.

#### Return values

Be as brief as possible in the return value's description; put any detailed
information in the class description.

- If the return value is anything other than a boolean, start with "The ..."—for
  example:

  - _The bird specified by the given ID._

- If the return value is a boolean, use the format "True if ...; false
  otherwise."—for example:

  - _True if the bird is in the sanctuary; false otherwise._

#### Exceptions

In languages where the reference generator automatically inserts the word
"Throws", begin your description with "If ...":

- _If no key is assigned._

Otherwise, begin with "Thrown when ...":

- _Thrown when no key is assigned._

#### Deprecations

When something is deprecated, tell the user what to use as a replacement. (If
you track your API with version numbers, mention which version it was first
deprecated in.)

Only the first sentence of a description appears in the summary section and
index, so put the most important information there. Subsequent sentences can
explain why something is deprecated, along with any other information that's
useful for a developer using your API.

If a method is deprecated, tell the reader what to do to make their code work.

##### Examples

> _Deprecated. Use #CameraPose instead._
> _Deprecated. Access this field using the `getField` method._

_Source: <https://developers.google.com/style/api-reference-comments>_

---

## Verb forms in reference documentation

When you're writing reference documentation for a method, phrase the main
method description in terms of what the method does (_gets_, _lists_, _creates_, _searches_), rather than what the developer would use it to do (_get_, _list_, _create_, _search_).

It's a subtle distinction that manifests mostly in whether the initial verb
in the description has an _-s_ at the end or not.

Recommended: tasks.insert: Creates a new
task on the specified task list.

Not recommended: tasks.insert: Create a
new task on the specified task list.

For more information and examples, see the [Google Cloud API design guide](https://cloud.google.com/apis/design/documentation#method_description).

_Source: <https://developers.google.com/style/reference-verbs>_

---

## Procedures

A procedure is a sequence of numbered steps for accomplishing a task. For information about
lists of items that aren't part of a procedure, see the [Lists](https://developers.google.com/style/lists) page.

### Introductory sentences

In most cases, introduce a procedure with an introductory sentence. This
introductory sentence should provide context to the reader that isn't part of
the section heading. Don't simply repeat the heading: if the heading explains
what the procedure is, and no additional context is needed, then don't
include an introductory statement.

The sentence can end with a colon or a period. Use a colon if it immediately
precedes the procedure. Use a period if there's more material (such as a
note paragraph) between the introduction and the procedure.

You can introduce a procedure with an imperative statement. Don't introduce a procedure with
a partial sentence that's completed by the numbered steps.

Recommended: To customize the buttons,
follow these steps:

Also recommended: Customize the buttons:

Also recommended: To customize the buttons, do the following:

Not recommended: To customize the
buttons:

For more information about introducing lists, see [Lists](https://developers.google.com/style/lists#introductory-sentences-for-lists).

### Single-step procedures

When a procedure consists of only one step, write the step in one sentence and format it as a [bulleted list](https://developers.google.com/style/lists#numbered-lettered-bulleted-lists).

Recommended:

- To clear (flush) the entire log, click **Clear logcat**.

Not recommended:

To clear (flush) the entire log, follow this step:

1. Click **Clear logcat**.

Also not recommended:

To clear (flush) the entire log, follow this step:

- Click **Clear logcat**.

### Sub-steps in numbered procedures

In a numbered procedure, sub-steps are labeled with lowercase letters, and
sub-sub-steps get lowercase Roman numerals.

When a step has sub-steps, treat the step like an [introductory sentence](#introductory-sentences): put a colon or a
period at the end of the step, as appropriate.

For more information about lists, see [Lists](https://developers.google.com/style/lists#introductory-sentences-for-lists).

Recommended:

1. To add a VM instance, do the following:
   1. Click **Create instance**.
   2. For **Name**, enter a name for the VM instance, and then do the following:
      1. For **Region**, specify where you want to deploy the VM instance.
      2. For **Machine type**, select an option.
   3. Click **Create**.
2. To connect to the VM instance by using SSH, click **SSH**.

### Order of multiple components in a step

To document a complex procedural step, use the following order:

1. Describe the action to take.

2. List a command, if necessary.

3. Explain any placeholders that are used in the command.

   For more information, see [Formatting placeholders](https://developers.google.com/style/placeholders).

4. Explain the command in more detail, if necessary.

5. List the output of the command, if necessary.

   For more information, see [Output from commands](https://developers.google.com/style/code-syntax#output).

6. In a separate paragraph, explain [the result of an action](https://developers.google.com/style/procedures#steps-with-results-or-justifications), or any output, if necessary.

The following example demonstrates the preceding order:

1. Plan the Terraform deployment:

```
terraform plan -out=*NAME*
```

Replace `*NAME*` with the name of your Terraform plan.

The `terraform plan` command does the following:

1.  Parses the Terraform configuration, building a list of resources to provision.
2.  Refreshes the current state of resources already provisioned in Google Cloud.
3.  Creates a plan to make the currently provisioned resources match the parsed
    configuration.

The output is similar to the following:

```
Plan: 26 to add, 0 to change, 0 to destroy.
------------------------------------------------------------
This plan was saved to: *NAME*
```

The output shows what resources to add, change, or destroy.

### Multi-action procedures

In general, use one step for each action. However, you can combine small actions
into one step [by using angle brackets](https://developers.google.com/style/ui-elements#term-menus) (`>`) for sequential menu selections.

Recommended:

1. Click **Next > Finish**.

Also recommended:

1. Click
   **File > New > Document**.

Don't make the steps too long. If they feel too long, consider splitting them
into multiple steps.

### Multiple procedures for the same task

In general, if there's more than one way to complete a task, then document
one procedure that's accessible for all readers. If all methods are accessible, pick the shortest
and simplest approach if possible. If you need to document multiple ways to complete a
task, then separate them in different pages, headings, or tabs.

The following guidelines can help you choose which procedure to document:

- Choose a procedure that lets readers do all the steps by using only a keyboard.
- Choose the shortest procedure.
- Choose a procedure that uses a programming language that most of your
  audience is familiar with.

### Repetitive procedures

Avoid repeating procedures. Instead, reference those procedures and link to
them.

Recommended:

1. Create a user as you did in the previous step.

Also recommended:

1. [Create a user as you did in the previous step.](#)

### Optional steps

For an optional step, at the beginning of the step, type _Optional_ followed by a colon.

Recommended:

1. Optional: Type an arbitrary string ...

Not recommended:

1. (Optional) Type an arbitrary string ...

For information about optional sections, see [Heading and title text](https://developers.google.com/style/headings#heading-and-title-text).

### Steps that say where to complete a task

Tell the reader where to complete an action—for example, in a
particular tool or UI field—before you state the action.

Recommended:

1. In Google Docs, click **File > New > Document**.
2. In the Google Cloud console, go to the **Monitoring** page.

Not recommended:

1. Click **File > New > Document** in Google
   Docs.
2. Go to the **Monitoring** page in the Google Cloud console.

If a set of procedures is split across multiple headings, then in each
procedure, restate where the reader completes the action. For example, if two
procedures in a document take place in the console, then start both
procedures with "In the console ..."

### Steps with goals

For some steps, it's useful to state the goal
that the step accomplishes.

When a step includes a goal, state the goal before the action. This
structure helps readers understand and complete the step more easily.

Recommended:

1. To start a new document, click **File > New > Document**.Not recommended:

1. Click **File > New > Document** to start a
   new document.

Sometimes, the preceding format can imply that the required step is
optional. In such cases, use the following format:

Recommended:

1. Start a new document: click **File > New > Document**.

It's usually clear within the context of a procedure whether a step is
required. In such cases, the "To ..." format is more natural than the colon
format.

To determine whether you need to use the colon format, consider how the
goal of the step relates to the goal of the procedure. For example, in a
procedure for creating a bar chart, a step with the goal "To create the
chart" is clearly required. A step with the goal "To enhance the chart" is
also unlikely to create confusion. But a step with the goal "To sort the
data by date" might or might not be necessary. To clarify that the step
isn't optional, use "Sort the data by date:" instead.

### Steps with results or justifications

Some steps consist of an action along with a resulting reaction that helps
the reader navigate to the next step. State the action first and the result
second. Keep the result in the same paragraph as the action. But also consider whether you
can avoid repetitiveness and overwhelming the reader with too much bolding of UI elements.

Recommended:

1. Click **Run**. The query results appear after the query runs.Recommended:

1. Click **Enter**.
1. In the **New file** dialog that appears, click **Next**.Not recommended:

1. Click **Enter**. The **New file** dialog appears.
1. In the **New file** dialog, click **Next**.

For information about describing output, see [Output from commands](https://developers.google.com/style/code-syntax#output).

Other steps benefit from including a justification for why the step is
important. State the action first and the justification second.

Recommended:

1. Store the private key in a secure location. You need it later.

### Summary of guidelines for writing procedures

| Guidance                                                                                                                                                                                                                                                                                                                                                              | Recommended                                                                                                   | Not recommended                                                                                                  |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| Make sure that the first sentence in a procedural step includes an imperative verb.                                                                                                                                                                                                                                                                                   | Clone the repository that contains the sample data.                                                           | You need the project ID later in this document. Retrieve the project ID.                                         |
| Use complete sentences.                                                                                                                                                                                                                                                                                                                                               |                                                                                                               |                                                                                                                  |
| Use parallel structure and consistent verb form.                                                                                                                                                                                                                                                                                                                      | Download the service account key to your local machine. Click **More**, and then click **Download**.          | Download the service account key to your local machine by clicking **More** and then clicking **Download** file. |
| For an optional step, type _Optional:_ as the first word of the step.                                                                                                                                                                                                                                                                                                 | Optional: Type an arbitrary string...                                                                         | (Optional) Type an arbitrary string...                                                                           |
| Set the context (such as a tool or an environment) in which the reader performs a procedure. If there are multiple headings associated with a set of procedures, restate the context of the procedure in the first step, even if the context is the same as in the previous procedure.                                                                                | In Cloud Shell, connect to the development cluster. In the Google Cloud console, go to the **BigQuery** page. |                                                                                                                  |
| Write in the order that the reader needs to follow. State the location of the action before stating the action.                                                                                                                                                                                                                                                       | In Google Docs, click **File > New > Document**. In the Google Cloud console, go to the **Monitoring** page.  | Click **File > New > Document** in Google Docs. Go to the **Monitoring** page in the Google Cloud console.       |
| State the purpose or goal of the action before stating the action.                                                                                                                                                                                                                                                                                                    | To start a new document, click **File > New > Document**.                                                     | Click **File > New > Document** to start a new document.                                                         |
| Don't use directional language to orient the reader, such as _above_, _below_, or _right-hand side_. This type of language doesn't work well for accessibility or for localization. If a UI element is hard to find, provide a screenshot. For information about documenting icons, see [Buttons and icons](https://developers.google.com/style/ui-elements#buttons). | Click menu**Menu**. In the preceding diagram,... In the following diagram,...                                 | Click the button with three lines. In the above diagram, ... In the diagram below, ...                           |
| Don't use _please_.                                                                                                                                                                                                                                                                                                                                                   | To open a document, click **File > Open**.                                                                    | To open a document, please click **File > Open**.                                                                |
| Avoid using _run the following command_ to introduce code. Instead, focus on what the command does.                                                                                                                                                                                                                                                                   | In Cloud Shell, deploy the load generator:... Define a firewall rule to allow internal traffic:...            | In Cloud Shell, deploy the load generator by running the following command:... Run the following command:...     |
| If the reader must press **Enter** after a step, then include that instruction as part of the step.                                                                                                                                                                                                                                                                   | Click the search box, type `custom function`, and then press **Enter**.                                       | Click the search box and type `custom function`.<br>Press **Enter**.                                             |
| Don't include keyboard shortcuts.                                                                                                                                                                                                                                                                                                                                     | Copy the command, and then paste it...                                                                        | Press Ctrl+C, and then press Ctrl+V...                                                                           |
| When there's more than one way to do something, give only the best way. Giving alternate ways can confuse readers.                                                                                                                                                                                                                                                    |                                                                                                               |                                                                                                                  |
| If your procedure includes code samples, see how to format [code samples](https://developers.google.com/style/code-samples).                                                                                                                                                                                                                                          |                                                                                                               |                                                                                                                  |
| If your procedure includes commands, see how to format [commands](https://developers.google.com/style/code-syntax#formatting-a-command).                                                                                                                                                                                                                              |                                                                                                               |                                                                                                                  |
| Ensure that the reader has the information that they need in order to prepare for the task ahead of time. Having information in advance supports task management, executive functioning, memory, and emotional regulation.                                                                                                                                            | The following hardware and software are required:...                                                          |                                                                                                                  |
| Include as few steps as possible to complete the task. Limit interruptions in the path.                                                                                                                                                                                                                                                                               |                                                                                                               |                                                                                                                  |
| Focus on one reader decision at a time. Separate each instruction by making each instruction a separate list item.                                                                                                                                                                                                                                                    |                                                                                                               |                                                                                                                  |

_Source: <https://developers.google.com/style/procedures>_

---

## Prescriptive documentation

Write prescriptive documentation.

_Prescriptive_ (or _opinionated_) documentation recommends a way to achieve tasks
and accomplish goals. It tells the reader what to do instead of giving them a list of options to
choose from. When a goal or task is complex and involves multiple approaches or products,
prescriptive documentation recommends a path.

Prescriptive writing affects several aspects of documentation:

- **The purpose and structure of a document**. Prescriptive documentation states a clear,
  specific purpose. Headings and content are written with that purpose in mind.
- **Example scenarios and procedures**. Scenarios and procedures reflect the use cases that
  are most likely relevant to the readers.
- **Sample commands**. Prescriptive documentation provides commands and arguments that
  accomplish the task for the most common use case. For more information about documenting
  command-line options, see [Optional arguments in click-to-copy commands](https://developers.google.com/style/code-syntax#click-to-copy-commands).

For instance, best practice documents are typically prescriptive documents. For an example, see [Operations best practices](https://cloud.google.com/architecture/security-foundations/operation-best-practices).

### Word choice for recommendations and requirements

To indicate required or optional user actions or the outcomes of a process, select an appropriate
auxiliary verb—for example, _must_, _can_, or _might_. Generally avoid the word _should_. The word can create ambiguity and uncertainty for readers and is thus problematic for
prescriptive documentation. For example, if you're telling the reader what to do, _should_ implies that the action is recommended but optional, which can leave the reader unsure about what to
do.

To clarify what you mean, determine if an action is _required_ versus _optional_, an
outcome is _expected_ versus _possible_, or a state is _actual_ versus _recommended_.

- **If an action is required**: use _must_, or rephrase
  the sentence so that it's a clear imperative instruction such as
  "Do the following before you continue."

- **If an action is recommended**: use _We recommend ..._ or _Google recommends ..._. You can use _should_ if a
  recommended action is generally recognized. For example, "You should
  use a strong password ..." or "You should follow the principle of
  least privilege ...."

- **If an action is optional**: use _can_. For example,
  "You can also use approach B to solve the same problem."

- **If an outcome is expected**: describe the outcome in terms of
  what is expected. For example: "The process returns 10 items."

- **If an outcome is possible**: use _might_ or _can_.
  For example, "The process can take about 30 minutes."

- **If a state is actual**: when you're describing the state of
  something, such as the value of a variable, avoid writing "The value
  should be true." Instead, clarify which of the following you mean:
  - "You must set the value to true."
  - "The server sets the value to true."
  - "If the value is false, follow these steps to change it to true."

  For information about clarifying who's performing an action, see [Active voice](https://developers.google.com/style/voice).

Recommended: Ensure that the
Classroom Share Button conforms to our min-max size guidelines and related
color/button templates.

Recommended: The column of the data
table that the filter operates on.

Recommended: Whether it's a brand new
project or an existing one, perform the following steps.

Not recommended: The Classroom Share
Button should conform to our min-max size guidelines and related color and
button templates.

Not recommended: The column of the
data table that the filter should operate on.

Not recommended: Whether it's a brand
new project or an existing one, here's what you should do.

### More resources

- See also [can](https://developers.google.com/style/word-list#can), [could](https://developers.google.com/style/word-list#could), [may](https://developers.google.com/style/word-list#may), [might](https://developers.google.com/style/word-list#might), [must](https://developers.google.com/style/word-list#must), and [would](https://developers.google.com/style/word-list#would) in the
  word list.

_Source: <https://developers.google.com/style/prescriptive-documentation>_

---

## UI elements and interaction

### Focus on the task

When practical, state instructions in terms of what the reader
should accomplish, rather than focusing on the widgets and gestures.
By avoiding reference to UI elements, you help the reader understand
the purpose of an instruction, and it can help future-proof
procedures.

Recommended: Refresh the page.

Recommended: Expand the **Advanced options** section.

However, know the audience and understand the context. In some cases, the point
of a procedure is to guide the reader through elements on the page. Or the UI might not be obvious,
and it's helpful to explain the gestures for completing a step. Provide the level of detail
that seems useful for the intended audience.

Recommended: Click **Refresh**.

Recommended: To expand the **Advanced
options** section, click the arrow_rightexpander arrow.

The rest of this page focuses on scenarios where you've decided it's
useful to explicitly discuss UI elements.

For information about writing procedures, see [Procedures](https://developers.google.com/style/procedures).

### Format names of UI elements

When referring to any UI element by name, put its name in bold, using the `b` element in HTML or `**` in Markdown. This
includes names for buttons, menus, dialogs, windows, list items, or any other
feature on the page that has a visible name. Don't use code font for UI elements,
unless it's an element that meets the [requirements for code font](https://developers.google.com/style/code-in-text).
In that case, use both code font and bold.

> **Note**: The reason for using the
> [`b` element](https://html.spec.whatwg.org/multipage/semantics.html#the-b-element) is that in
> modern HTML, `b` connotes text to which you want to draw visual attention, whereas the
> [`strong` element](https://html.spec.whatwg.org/multipage/semantics.html#the-strong-element)
> indicates strong importance.

Don't make an official feature name or product name bold, except when it
directly refers to an element on the page that uses the name (such as a window
title or button name).

Recommended:
In the **New project** window, select the **New activity** checkbox, and then click **Next**.

Not recommended:
In the New Project window, select "New Activity", and then click the
"Next" button.

If you document a UI element outside the context of a procedure, try to provide context for the
element.

Recommended: The service lets you check the status of all
jobs in the **Current jobs** section of the service console.

Not recommended: The service lets you check the status of
all jobs in the **Current jobs** section.

### Use appropriate capitalization

In most cases, follow the capitalization as it appears on the page. However,
if labels are inconsistent or they're all uppercase, use sentence case.

| Guidance                                                                                                  | Recommended                                             | Not recommended                                         |
| --------------------------------------------------------------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------- |
| When a label is all uppercase, use sentence case.                                                         | Click refresh **Refresh**.                              | Click **REFRESH**.                                      |
| When referring to multiple labels that are inconsistently cased, use sentence case for all of the labels. | Click **New project**, and then click **New activity**. | Click **NEW PROJECT**, and then click **New Activity**. |

### Refer to UI elements

Don't use UI elements as if they were English verbs or nouns.

| Recommended                                                                                  | Not recommended                   |
| -------------------------------------------------------------------------------------------- | --------------------------------- |
| In the **Name** field, enter an account name.                                                | **Name** the account.             |
| To save the settings, click **Save**.                                                        | **Save** the settings.            |
| In the **Service account ID** field, enter a name. For **Service account ID**, enter a name. | Specify a **Service account ID**. |

### Terminology and usage

A user interface can contain a variety of UI elements. In general, focus on
the feature and its functionality, not the UI element. If you think it adds
clarity for the reader, use the name of the UI element. For example, both of the
following sentences are valid:

Recommended:
Go to **File > Tools**.

Recommended:
In the **File** menu, click **Tools**.

Don't use slang terms for UI elements—for example, _hamburger icon_ or _zippy_. For more information, see [Buttons and icons](#buttons).

Recommended:
To expand the **Advanced options** section, click the arrow_rightexpander arrow.

Recommended:
Expand **Advanced options**.

Not recommended:
To expand the **Advanced options** section, click the zippy.

The following sections define some terms to use when referring to UI
elements.

For prepositions to use with these elements, see the [Prepositions](#prepositions) table.

#### Windows, pages, dialogs, panes, and sections

Most often, a _window_ is the entire application window in a desktop
environment. However, it can also refer to modular application elements that you
can open and close. For example, in Android Studio, several windows are
available in the **View > Tool Windows** menu.

Recommended:
In the **MyApp** window, click **Edit**.

Not recommended:
In the **MyApp** page, click **Edit**.

_Page_ is the preferred term when referring to a web page in general and to a subpage
of a console in particular. For more information, see [console](https://developers.google.com/style/word-list#console).

Recommended:
In the Google Cloud console, go to the **Deployments** page.

Not recommended:
In the Google Cloud console, go to the **Deployments** window.

A _dialog_ is a smaller window that is usually detached from the
main application window and appears in front of the window.

Recommended:
In the **Welcome** dialog, click **OK**.

Not recommended:
In the **Welcome** pop-up window, click **OK**.

A _pane_ (or _panel_) is typically a distinct rectangular region within a larger
browser or application window. A pane or panel can often be tightly coupled to surrounding UI
regions, whereas a window is distinctly separate and can be hidden. Do not use terms such as _window_, _section_, _area_, or _column_ to refer to a pane or panel.

Recommended:
In the **Create service account** pane, click **New**.

Not recommended:
In the **Create service account** section, click **New**.

A _section_ is a labeled grouping of options and controls, usually within a window, pane, or
panel. Do not use terms such as _area_ or _column_ to refer to a section.

Recommended: In the **Create metric** pane, do the
following:

- In the **Metric type** section, select **Counter**.
- In the **Labels** section, click **Add label**.

#### Menus and menu bars

In a desktop application, the _menu bar_ appears at the top of the
window or at the top of the screen; it's a set of _menus_ (such as **File** or **Edit**), each of which is a set of related _commands_ and/or nested submenus.

To refer to an item in a menu, use the term _command_, not _choice_, _menu item_,
or _option_. Exception: if you're documenting how to build an interface,
you can use _menu item_.

To refer to a menu, use the form _the ***LABEL_NAME*** menu._

To tell the reader where to find a command in a menu or submenu, use a phrase like _In the **File** menu, select **Open**._

Don't use _drop-down_ as a synonym for _menu_. See [drop-down](https://developers.google.com/style/word-list#drop-down).

##### Use angle brackets

Another option is to use angle brackets (>). If you use angle brackets, follow these
guidelines:

- Put a nonbreaking space (`&nbsp;`) before each angle bracket.
- Don't bold each menu name separately; instead, enclose the entire sequence in a single bold
  tag (`<b>...</b>` or `**...**`).
- Wrap the angle bracket with a span tag and add an `aria-label` attribute with
  _and then_ text
  (for example, `<span aria-label="and then">></span>`).
  Otherwise, some screen readers might read `>` as "greater than."

In the following example, the text renders as _Select **View > Tools > Developer Tools**_. A screen reader
interprets this as _Select View and then Tools and then Developer Tools_.

#### HTML

```
Select <b>View&nbsp;<span aria-label="and then">></span> Tools&nbsp;<span aria-label="and then">></span> Developer Tools</b>.
```

#### Markdown

```
Select **View&nbsp;<span aria-label="and then">></span> Tools <span aria-label="and then">></span> Developer Tools**.
```

This notation is useful for abbreviating a longer phrase like _In the **File** menu, select **Open**._ However, this notation applies only to
menu items. Don't use it to describe a combination of different UI elements.

Recommended: Select **MyApp > Preferences**, and then select the **Languages** preference pane.

Not recommended:
Select **MyApp** > **Preferences** > **Languages** > **+** > **CSS**.

#### Navigation menu

A _navigation menu_ is a control—usually a pane or window—that contains a list of items
that the user can click to go to pages in an application or website. Don't use the terms _navigation bar_, _navigation pane_, _navigation panel_, or _navigation window_ for such a control.

Recommended:
In the BigQuery navigation menu, click **Scheduled queries**.

#### Toolbar

A _toolbar_ is a set of buttons for common user actions. A toolbar
button that includes a menu is called a _menu button_. Refer to the
toolbar by name if you think that the user needs help finding a button.

Recommended:
On the Google Cloud console toolbar, click notifications_none **Notifications**.

Recommended: Click notifications_none **Notifications**.

#### Buttons and icons

A _button_ initiates an action when clicked (or tapped, in the case
of a touchscreen). To refer to a button, use the button's label.

Recommended: Click **OK**.

Not recommended: Click the "OK"
button.

An icon is a symbol or image that represents an object or a function. An icon
can be a button as well. If the button includes an icon, write the name of the
button as shown in the tooltip, and add the button icon before the
name. If you need to use a space between the icon and the name for readability,
use a nonbreaking space.

Recommended: Click more_vert **Settings and utilities**.

Not recommended: Click more_vert.

If the icon tooltip is identical to the name of the icon, use an [empty `alt` attribute](https://developers.google.com/style/images#alt-text).

If you're unsure of the name of the icon, inspect the element using browser
tools. In many cases, a visual element like an icon has an ARIA attribute
that provides a textual description of the element for use by screen readers.
To inspect an element, right-click the element and select **Inspect** or **Inspect element**, depending on your browser. Look for one of the following
types of labels: `aria-labelledby`, `aria-label`, `aria-describedby`, `label`, `placeholder`, or `title`.
For more information, see [Using aria-label](https://www.w3.org/TR/WCAG20-TECHS/ARIA14.html) and [Accessible Name and Description calculation](https://www.w3.org/TR/html-aapi/#accessible-name-and-description-calculation).

If a button with an icon doesn't include a tooltip, submit a bug report
requesting that a tooltip be added. Tooltips are crucial for accessibility, and
for documentation and discoverability in general.

Recommended: Click ![](https://developers.google.com/static/style/images/icon-add.png) **Add**.

Not recommended: Click the ![hammer icon](https://developers.google.com/static/style/images/icon-add.png) icon.

If a UI element name ends with an ellipsis (...), leave out the ellipsis.

Recommended: Click **Browse**.

Not recommended: Click **Browse ...**.

Don't use directional language to orient the reader, such as _above_, _below_, or _right-hand side_. Phrases like those don't work well for
accessibility or for localization. If a UI element is hard to find, provide a
screenshot.

Recommended: Click menu **Menu**.

Not recommended: In the left-side panel,
click the button with three lines.

##### Difficult-to-find UI elements

If you have UI elements that are difficult to find, consider one of the following options
as an alternative to using directional language, which can be problematic for
accessibility and localization reasons.

- Use the button icon along with its name as shown in the button tooltip. Recommended: Click refresh **Refresh**.

- Add context to help the user find the element. Recommended: On the Cloud Run toolbar, click refresh **Refresh**.

- Use a screenshot.

  Recommended: In the list of services, click view_column **Column display options**.

![List of services.](https://developers.google.com/static/style/images/list-of-services.png)
For more information about when and how to use screenshots, see [Diagrams, figures, and other images](https://developers.google.com/style/images).

#### Tab

A _tab_ is a navigation element that looks like a file tab. To refer
to a tab, use the form _the ***LABEL_NAME*** tab_.

Recommended: Select **Tools > Options**, and then click the **Edit** tab.

#### Text box

A _text box_ is a box that the user can type in. Use _box_ and the form _the ***LABEL_NAME*** box_. Format the text
that the user types by using the `code` element in HTML, or by using code
formatting (monospace) in other markup.

Recommended: In the **Owner** box,
enter your name.

Recommended: In the **Name** box,
enter `wsfc-1`.

In Google Cloud, use _field_ instead of _box_.

In Google Workspace documentation, use _field_ instead of _box_.

Recommended: In the **Instance** field,
specify a value less than 64 characters long.

#### List box, combo box, and spin box

A _list box_ is a box that offers the user a list of items. To refer to a list box, use
the form _the ***LABEL_NAME*** list_ or _the ***LABEL_NAME*** box_, whichever is clearer.

Recommended: In the **Item** list, select **Desktop**.

A _combo box_ is a combination of a text box and a list box. To
refer to a combo box, use the form _the ***LABEL_NAME*** box_. To refer to
entering a value into a combo box, use the verbs _type or select_ or _enter_.

Recommended: In the **Font** box, type
or select the font that you want to use.

A _spin box_ is a box that lets the user choose a value by clicking
arrows or by typing. To refer to a spin box, use the form _the ***LABEL_NAME*** box_. To refer to entering a value into a spin
box, use the verb _enter_.

Recommended: In the **Font Size** box,
enter a font size.

#### Checkbox

A _checkbox_ is a small box that indicates whether an option is
on or off. To refer to a checkbox, use the form _the ***LABEL_NAME*** checkbox_.

Be wary of using the verbs _check_ and _uncheck_, which can be ambiguous; it's often
best to use _select_ and _clear_ instead.

Recommended: Select the **Automatically
check for updates** checkbox.

Recommended: Clear the **Bookmarks** checkbox.

If you need to refer to the state of the checkbox, it's often best to refer to it as _selected_ or _not selected_.

Recommended: Make sure that the **Bookmarks** checkbox is selected.

Recommended: Make sure that the **Bookmarks** checkbox isn't selected.

#### Radio button

A _radio button_ is a small button used to choose one item from a
group of mutually exclusive options. To refer to a radio button, use the radio
button's label, or refer to the group of buttons by its label.

Recommended: Select **Do not remember
passwords**.

Recommended: For **Startup mode**,
select an option.

#### Expander arrow

An _expander arrow_ is the UI element used to expand or collapse a section of
navigation or content. Avoid referring to these explicitly in documentation, but when you do, use
the terms _expander arrow_ and _expandable section_ rather than terms like _expando_ or _zippy_.

Recommended: To expand the **Advanced options** section, click the arrow_rightexpander arrow.

Not recommended: To expand
the **Advanced options** section, click the zippy.

#### Toggle

A _toggle_ is the UI element that switches back and forth between on and off
states. Don't use the word _toggle_ as a verb. Describe the action that you want the
user to take.

Recommended: To turn on the setting, click
the **Wi-Fi** toggle.

In some cases, you might not know what state the toggle is in before the user interacts with it
so be clear what position the toggle should be in.

Recommended: In **Settings**, click
the **Magic mode** toggle to the on position.

### Press and type keyboard keys

To indicate that the user should press a given keyboard key or
combination, use the `kbd` element.

The following is an example of a `<kbd>` tag:

Recommended: `Press <kbd>Control+C</kbd>.`

When rendered, the text appears as follows:

Recommended: Press `Control+C`.

If you're working with non-HTML markup, use monospace formatting, which is how the `kbd` element renders.

To refer to a letter key, use uppercase instead of lowercase.

Recommended: To save, press `Control+S`.

Not recommended: To save, press `Control+s`.

To refer to a key that the user types to enter that key's value as text input,
use the `code` element, not the `kbd` element.
For more information, see [Code font](https://developers.google.com/style/text-formatting#code-font).

To refer to a keyboard key, use the key's name. If that's ambiguous, use the
form _the `*KEY_NAME*` key_.

Recommended: Press `Esc`.

Recommended: Press the `Esc` key.

Spell out the names of modifier keys such as Command, Control, Option, and
Shift. Don't use symbols for those keys. To refer to a key combination, use the
form _`*MODIFIER*+*KEY_NAME*`_.

Recommended: Press `Control+V`.

When you provide shortcuts for multiple operating systems, put the macOS shortcut in
parentheses after the Windows and Linux shortcut.

Recommended: To copy, press `Control+C` (or `Command+C` on macOS).

Not recommended: To copy, press `Ctrl+C` (`⌘+C`).

To refer to a key or combination that uses the Shift key, use the form _`*MODIFIER*+Shift+*KEY_NAME*`_.

Recommended: Press `Control+Shift+?`.

Spell out the names of characters that could be confusing in a keyboard
shortcut, such as comma, hyphen, period, and plus.

To refer to a keyboard shortcut, use either _keyboard shortcut_ or _key
combination_.

To refer to pressing a key or combination to cause an action to occur, use
the verb _press_. To refer to typing a key or combination as part of text, use
the verbs _enter_ or _type_.

### Prepositions

When documenting the UI, use the following prepositions.

| Preposition | UI element                               | Recommended                                                                                                                                                                                                                                     |
| ----------- | ---------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| in          | dialogs fields lists menus panes windows | In the **Alert** dialog, click **OK**. In the **Name** field, enter `wsfc-1`. In the **Item** list, select **Desktop**. In the **File** menu, click **Tools**. In the **Metrics** pane, click **New**. In the **Task** window, click **Start**. |
| on          | pages tabs toolbars                      | On the **Create an instance** page, click **Add**. On the **Edit** tab, click **Save**. On the **Dashboard** toolbar, click **Edit**.                                                                                                           |

### Verbs in procedures

To describe an action on the page, use the following verbs. For more
information about each verb, see its corresponding entry on the [word list](https://developers.google.com/style/word-list).

- [Click](https://developers.google.com/style/word-list#click)
- [Choose](https://developers.google.com/style/word-list#choose)
- [Drag](https://developers.google.com/style/word-list#drag)
- [Enable](https://developers.google.com/style/word-list#enable)
- [Enter, type](https://developers.google.com/style/word-list#enter)
- Go to (see [scroll](https://developers.google.com/style/word-list#scroll))
- [Hold the pointer over](https://developers.google.com/style/word-list#hold-the-pointer-over)
- [Press](https://developers.google.com/style/word-list#press)
- [Select](https://developers.google.com/style/word-list#select)
- [Tap](https://developers.google.com/style/word-list#tap)
- [Turn on, turn off](https://developers.google.com/style/word-list#turn-on)

For information about writing procedures, see [Procedures](https://developers.google.com/style/procedures).

_Source: <https://developers.google.com/style/ui-elements>_
