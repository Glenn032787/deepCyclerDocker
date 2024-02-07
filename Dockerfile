# Use an official Python runtime as a parent image
FROM continuumio/miniconda3

# Set the working directory in the container
WORKDIR /app

# Copy the Conda environment file to the container
COPY environment.yml /app/environment.yml

# Create the Conda environment
RUN conda env create -f environment.yml

ENTRYPOINT ["/bin/bash", "-c", "source activate DeepCycle && exec \"$@\"", "--"]

# Set a default command to run within the Conda environment
CMD ["echo", "Running default command within DeepCycle environment"]
