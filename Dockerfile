# Use an official Python runtime as a parent image
FROM continuumio/miniconda3

# Set the working directory in the container
WORKDIR /app

# Copy the Conda environment file to the container
# DeepCycle  estimate_cell_cycle_transitions  fit_ISMARA
COPY environment.yml /app/environment.yml
COPY bin/DeepCycle /app/bin/DeepCycle
COPY bin/estimate_cell_cycle_transitions /app/bin/estimate_cell_cycle_transitions
COPY bin/fit_ISMARA /app/bin/fit_ISMARA

# Create the Conda environment
RUN conda env create -f environment.yml
ENV PATH /opt/conda/envs/DeepCycle/bin:$PATH
ENV PATH /app/bin:$PATH
