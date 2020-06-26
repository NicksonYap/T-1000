# FROM ubuntu:20.04
# # COPY . /app
# # RUN make /app
# # CMD python /app/app.py

# RUN apt update

# ### Install Anaconda 3
# # ref: https://github.com/ContinuumIO/docker-images/blob/5541d565c2682d883475ce6f875114a0ed6714af/anaconda3/debian/Dockerfile
# RUN apt install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

# RUN apt install -y wget
# RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh -O ~/anaconda3.sh
# RUN bash ~/anaconda3.sh -b -p $HOME/anaconda3
# RUN rm ~/anaconda3.sh
# # RUN source ~/.bashrc

# RUN apt install -y gcc g++ build-essential python-dev python3-dev htop

# RUN bash conda

FROM continuumio/anaconda3:2020.02

RUN apt update
RUN apt install -y gcc g++ build-essential python-dev python3-dev htop

#ref: https://pythonspeed.com/articles/activate-conda-dockerfile/
COPY . /app
RUN cd /app && conda env create -f linux_env.yml

# RUN conda init bash
# RUN conda activate ray-0.8.5
SHELL ["conda", "run", "-n", "ray-0.8.5", "/bin/bash", "-c"]
