# 使用NVIDIA官方PyTorch镜像作为基础镜像  
FROM nvcr.io/nvidia/pytorch:25.02-py3  
  
# 设置工作目录  
WORKDIR /openrlhf  
  
# 设置环境变量  
ENV DEBIAN_FRONTEND=noninteractive  
ENV PYTHONUNBUFFERED=1  
  
# 更新系统包并安装必要的系统依赖  
RUN apt-get update && apt-get install -y \  
    git \  
    wget \  
    curl \  
    vim \  
    htop \  
    && rm -rf /var/lib/apt/lists/*  
  
# 卸载可能冲突的包  
RUN pip uninstall xgboost transformer_engine flash_attn pynvml -y  
  
# 克隆OpenRLHF仓库  
RUN git clone https://github.com/OpenRLHF/OpenRLHF.git .  
  
# 安装OpenRLHF及其依赖  
# 基础安装  
# RUN pip install -e .  
  
# 可选：安装vLLM加速支持（推荐）  
# RUN pip install -e .[vllm]  
  
# 可选：安装所有优化组件  
RUN pip install -e .[vllm,ring,liger]  
  
# 设置默认命令  
CMD ["/bin/bash"] 