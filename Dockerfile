FROM python:3.8-slim

WORKDIR /app

RUN apt-get update \
    && apt-get install -y libsndfile1 ffmpeg gcc

RUN pip install --upgrade pip \
    && pip install poetry

# Copy source code
COPY . /app

# Install dependencies
# RUN poetry config settings.virtualenvs.create false
RUN poetry install --no-interaction --no-dev

CMD poetry run streamlit run --server.port 80 main.py
