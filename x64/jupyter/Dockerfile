FROM python:latest
MAINTAINER M1CH

RUN apt update && \
    apt install -y \ 
      bison \
      byacc \
      libportaudio2 \
    && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /


#      --prefix=/usr/local \
RUN wget http://downloads.sourceforge.net/project/ngspice/ng-spice-rework/27/ngspice-27.tar.gz && \
    ls -l / && \
    tar xzf ngspice-27.tar.gz && \
    cd ngspice-27 && \
    ./autogen.sh && \
    ./configure \
      --enable-xspice \
      --enable-cider \
      --disable-debug \
      --with-readline=yes \
      --with-ngshared \
      --enable-openmp && \
    make -j4 && \
    make install && \
    cd / && \
    rm -rf /ngspice-27.tar.gz /ngspice-27 && \
    ln -s /usr/local/lib/libngspice.so /lib/libngspice.so

RUN pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U && \
    pip install \
      jupyter \
      ipykernel \
      ahkab \
      keras \
      theano \
      bcolz \
      pandas \
      cffi \
      PySpice \
      sounddevice \
      matplotlib \
      paho-mqtt \
      RISE && \
    jupyter-nbextension install rise --py --sys-prefix && \
    jupyter-nbextension enable rise --py --sys-prefix


RUN echo "[global]" > ~/.theanorc && \
    echo "device = cpu" >> ~/.theanorc && \
    echo "floatX = float32" >> ~/.theanorc && \
    mkdir ~/.keras && \
    echo '{' > ~/.keras/keras.json && \
    echo '  "image_dim_ordering": "th",' >> ~/.keras/keras.json && \
    echo '  "epsilon": 1e-07,' >> ~/.keras/keras.json && \
    echo '  "floatx": "float32",' >> ~/.keras/keras.json && \
    echo '  "backend": "theano"' >> ~/.keras/keras.json && \
    echo '}' >> ~/.keras/keras.json

RUN mkdir -p /opt/notebooks

CMD ['/usr/local/bin/jupyter', 'notebook --notebook-dir=/notebooks --ip="*" --port=8888 --no-browser']
