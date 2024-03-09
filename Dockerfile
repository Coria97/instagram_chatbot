FROM python:3.8-slim

RUN apt-get update && apt-get install -y python3-pip
RUN apt-get install -yqq unzip curl
RUN pip install selenium
RUN LATEST=`curl -sSL https://chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    echo "Installing chromium-browser=$LATEST" && \
    curl -sSL https://chromedriver.storage.googleapis.com/$LATEST/chromedriver_linux64.zip -o chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip -d /usr/local/bin && \
    rm chromedriver_linux64.zip

RUN pip3 install instapy

WORKDIR /app

COPY . .

CMD ["python", "your_script.py"]
