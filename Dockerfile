FROM nvidia/cuda:12.1.1-runtime-ubuntu22.04

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git python3 python3-pip wget

RUN git clone https://github.com/comfyanonymous/ComfyUI.git .

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

RUN mkdir -p /app/models/checkpoints

EXPOSE 8188

CMD ["python3", "main.py", "--listen", "0.0.0.0", "--port", "8188"]
