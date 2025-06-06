FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && \
    # Small models used for demonstration
    python -m spacy download en_core_web_sm && \
    python -m spacy download ru_core_news_sm && \
    python -m spacy download xx_ent_wiki_sm

COPY app/ ./app/
COPY config/ ./config/

ENV PYTHONUNBUFFERED=1 \
    PORT=8001 \
    APP_NAME="anonymizer" \
    ENVIRONMENT=production \
    LOG_LEVEL=INFO

EXPOSE 8001

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8001"]
