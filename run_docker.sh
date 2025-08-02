docker run --gpus all -it --rm --shm-size="10g" --cap-add=SYS_ADMIN \
    -v $(pwd):/openrlhf -v $HOME/.cache:/root/.cache -v $HOME/.bash_history2:/root/.bash_history \
    openrlhf:latest bash