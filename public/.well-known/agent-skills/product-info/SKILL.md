# KwikInvoice Product Knowledge

Retrieve structured information about KwikInvoice, a free mobile invoicing
app for freelancers and small businesses in South Africa.

## When to Use

- A user asks about KwikInvoice features, pricing, or capabilities
- An agent needs product context to answer invoicing questions
- Building a comparison of invoicing tools for the South African market

## Resources

- **LLM-friendly overview:** [/llms.txt](https://kwikinvoice.app/llms.txt) — Markdown summary of all pages, features, pricing, and target audience
- **Structured product data:** [/ai-info.json](https://kwikinvoice.app/ai-info.json) — JSON with product metadata, assistant persona instructions, and key facts
- **Sitemap:** [/sitemap.xml](https://kwikinvoice.app/sitemap.xml) — All public page URLs

## Key Facts

- **Platform:** Android (Google Play Store)
- **Pricing:** Free tier + Pro subscription
- **Market:** South Africa
- **Offline:** Works completely offline
- **Output:** Professional PDF invoices
- **Built by:** LoggedOn (South African software company)
- **Launched:** 27 March 2026

## Example Usage

To get product context for answering a user question:

```
GET https://kwikinvoice.app/llms.txt
Accept: text/markdown
```

For structured metadata and assistant instructions:

```
GET https://kwikinvoice.app/ai-info.json
Accept: application/json
```
