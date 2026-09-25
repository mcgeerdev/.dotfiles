# Monthly behaviour patterns (machine format + dashboard summary)

Distill behavioural patterns from one calendar month of weekly digest
JSON. The reported month is the previous calendar month at run time; if
the user message says `Report month YYYY-MM.`, report that month.

## Data

Every `/Users/devanmcgeer/.dotfiles-release/wow/.omp/audits/weekly/YYYY-MM-*.json`
in the reported month, plus the newest earlier
`/Users/devanmcgeer/.dotfiles-release/wow/.omp/audits/patterns/*.json`
(ignore summary.json). Digests are the only data: no databases, no
transcripts, no web.

## Output

Write `/Users/devanmcgeer/.dotfiles-release/wow/.omp/audits/patterns/YYYY-MM.json`
(create directories; overwrite on rerun):

```json
{
  "month": "YYYY-MM",
  "weeks": ["YYYY-MM-DD.json"],
  "patterns": [{"text": "", "evidence": ["week + number that shows it"]}],
  "month_over_month": [""],
  "questions": [""]
}
```

Only patterns visible in two or more weeks qualify; at most 6. `questions`
is at most 3 things the next full usage-audit should answer. If the month
has no weekly digests, write the file with empty arrays anyway.

Also write, same directory, `summary.json` (overwrite):
`{"month": "YYYY-MM", "patterns": ["...", ...]}` — the same patterns as
one plain-text string each, under 120 characters, no markdown. This is
the only human-facing output: apply skill://technical-writing and the
unslop skill to these strings. Empty month: one string,
"No weekly digests found for YYYY-MM".
