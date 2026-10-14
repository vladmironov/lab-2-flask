FROM python:3.12-slim AS builder

WORKDIR /build
COPY app/requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:3.12-slim AS runtime

ARG LAB_LOGIN=unknown
ARG LAB_TOKEN=unknown

LABEL org.lab.login=$LAB_LOGIN \
      org.lab.token=$LAB_TOKEN

ENV LAB_LOGIN=$LAB_LOGIN \
    LAB_TOKEN=$LAB_TOKEN \
    ROCKET_SIZE=Small \
    PORT=8000 \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PATH=/home/appuser/.local/bin:$PATH

RUN useradd -u 10001 -m -s /usr/sbin/nologin appuser

WORKDIR /app
COPY --from=builder /install /usr/local
COPY app/app.py /app/app.py

USER appuser
EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD python -c "import urllib.request,sys; sys.exit(0 if urllib.request.urlopen('http://127.0.0.1:8000/health').status==200 else 1)"

CMD ["python", "app.py"]
