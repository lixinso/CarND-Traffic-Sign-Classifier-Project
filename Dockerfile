FROM ubuntu:18.04
LABEL Maintainer="Xinsong Li <lixinso@gmail.com>"

RUN apt update -y

RUN apt install -y python3 
RUN apt install -y python3-pip
RUN python3 -m pip install --upgrade pip

RUN DEBIAN_FRONTEND=noninteractive apt install -y python3-notebook

RUN apt install -y ipython3
RUN pip3 install --ignore-installed pyzmq
RUN pip3 install  jupyter
RUN pip3 install 'prompt-toolkit<2.0.0,>=1.0.15' --force-reinstall
RUN pip3 install pillow
RUN pip install opencv-python
RUN pip install moviepy
RUN pip install matplotlib
RUN apt install -y libsm6 libxext6 libxrender-dev


RUN mkdir /mydir
VOLUME ["/mydir"]
WORKDIR /mydir

CMD ["ipython3", "notebook", "--no-browser",  "--ip",  "0.0.0.0", "--allow-root"]
