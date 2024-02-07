# Use an official Python runtime as a parent image
FROM continuumio/miniconda3

# Set the working directory in the container
WORKDIR /app

# Copy the Conda environment file to the container
COPY environment.yml /app/environment.yml

# Create the Conda environment
RUN conda env create -f environment.yml

# Activate the Conda environment when entering the container
SHELL ["/bin/bash", "-c"]
RUN echo "conda activate DeepCycle" >> ~/.bashrc

# Make the Conda environment available for Singularity
RUN conda init bash

# Set the entry point to bash
ENTRYPOINT ["/bin/bash"]
