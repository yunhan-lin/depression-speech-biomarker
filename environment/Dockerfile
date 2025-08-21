# hash:sha256:a4a699ee7de2c6d0a5b7b558c0fc8e59cae01a72155e40c80f56f73d0caf9ce9
FROM registry.codeocean.com/codeocean/py-r:python3.12.8-R4.4.2-JupyterLab4.3.5-RStudiorstudio-server-2024.12.1-563-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN conda install -y \
        pip==25.2 \
    && conda clean -ya

RUN pip install -U --no-cache-dir \
    matplotlib==3.10.5 \
    numpy==2.3.2 \
    pandas==2.3.1 \
    scikit-learn==1.7.1 \
    scipy==1.16.1 \
    seaborn \
    statsmodels==0.14.5

RUN pip3 install -U --no-cache-dir \
    matplotlib==3.10.5 \
    numpy==2.3.2 \
    pandas==2.3.1 \
    scikit-learn==1.7.1 \
    scipy==1.16.1 \
    seaborn \
    statsmodels==0.14.5

RUN Rscript -e 'remotes::install_version("ggplot2", "3.5.2")'
