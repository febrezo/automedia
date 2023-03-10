FROM python:3.10

# Setting dependencies
RUN apt-get -y update
RUN apt-get install -y --fix-missing \
    build-essential \
    cmake \
    gfortran \
    git \
    wget \
    curl \
    graphicsmagick \
    libgraphicsmagick1-dev \
    libatlas-base-dev \
    libavcodec-dev \
    libavformat-dev \
    libgtk2.0-dev \
    libjpeg-dev \
    liblapack-dev \
    libswscale-dev \
    pkg-config \
    python3-dev \
    python3-numpy \
    software-properties-common \
    zip \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*

RUN cd ~ && \
    mkdir -p dlib && \
    git clone -b 'v19.9' --single-branch https://github.com/davisking/dlib.git dlib/ && \
    cd  dlib/ && \
    python3 setup.py install --yes USE_AVX_INSTRUCTIONS

RUN apt-get install -y tesseract-ocr

# Install Automedia dependencies firts
# Done in two steps to avoid having to compile dependencies every time a change is added
# 	- For some reason about how the package is built, gpyocr installation breaks if 
#	  the dependicies are not manually installed before.
RUN pip3 install pytest pytest-cov opencv-python Pillow google-cloud-vision codecov
COPY ./requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt
# Download NLTK dependencies
RUN python3 -c "import nltk; nltk.download('punkt'); nltk.download('averaged_perceptron_tagger'); nltk.download('maxent_ne_chunker'); nltk.download('words')"
# Install additional dependencies
RUN pip3 install libratom
# Install the app itself
COPY ./app /app
# # Adding extra files
# COPY ./extra .config/Automedia/

# Set the default behaviour
EXPOSE 11321
CMD ["python3 /app/server.py"]
