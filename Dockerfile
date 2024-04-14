FROM python:3.11

RUN apt-get update && apt-get install -y \
    build-essential \
    libatlas-base-dev \
    liblapack-dev \
    gfortran \
    libgfortran5 \
    libblas-dev \
    libffi-dev \
    libssl-dev \
    libpq-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

RUN python3 -m pip install prophet

EXPOSE 8888

CMD ["jupyter", "lab", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]


