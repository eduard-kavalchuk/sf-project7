# Use a multistage approach
FROM python:3.8-alpine@sha256:41ea2b8caa7fa3740fd0f0a1cad0c26961707a7e3c7cc49559f54b277ef86fb3 as build

# Install all dependencies to a temporary directory
WORKDIR /install
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt --target /install


# Use a specific image
FROM python:3.8-alpine@sha256:41ea2b8caa7fa3740fd0f0a1cad0c26961707a7e3c7cc49559f54b277ef86fb3

# Copy a directory containing a virtual environment to a draft image
WORKDIR /srv/app
RUN mkdir conf
COPY --from=build /install ./.env
COPY web.py .
COPY web.conf ./conf

# Add a directory with virtual environment to PYTHONPATH
ENV PYTHONPATH="/srv/app/.env:$PYTHONPATH"
ENV PATH="/srv/app/.env/bin:$PATH"
ENV FLASK_APP=web

EXPOSE 5000
CMD ["flask", "run", "--host", "0.0.0.0"]
