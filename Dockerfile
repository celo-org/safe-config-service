FROM python:3.10.0-slim as production

# python
ENV PYTHONUNBUFFERED=1

ENV PYTHONUSERBASE=/python-deps
ENV PATH="${PATH}:${PYTHONUSERBASE}/bin"

WORKDIR /app
COPY . .

RUN set ex \
    && buildDeps=" \
		gcc \
		libc-dev \
		" \
    && apt-get update \
    && apt-get install -y --no-install-recommends $buildDeps tini \
    && pip3 install --no-cache-dir --user -r requirements.txt \
    && apt-get purge -y --auto-remove $buildDeps \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /usr/bin/tini

ENTRYPOINT ["/usr/bin/tini", "--", "./docker-entrypoint.sh"]

# ------- development image -------
FROM production as development

ENV PATH="${PATH}:${PYTHONUSERBASE}/bin"
RUN pip3 install --no-warn-script-location --user -r requirements-dev.txt
