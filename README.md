### Translation Anonymizer

Companion service for the Translation API. Detects and masks PII in text before machine translation, and enables reversible deanonymization during reconstruction.

### What it does
- Uses Microsoft Presidio Analyzer with spaCy NER models (en, ru, xx) and built‑in recognizers to detect entities
- Applies Presidio Anonymizer to replace spans with typed placeholders like `<PERSON_0>`, returning a mapping for safe, deterministic deanonymization
- Provides single and batch endpoints optimized for MT workflows

Notes
- This service is part of the same LangOps learning project as the `translation-api`
- The approach is model‑ and rule‑based (Presidio + spaCy), designed for predictable, reversible masking of sensitive information


