#!/bin/bash
source /home/lxing/miniconda3/etc/profile.d/conda.sh
conda activate dataana

# 直接用你成功运行的命令！！！
exec strands-agents-sops mcp --sop-paths /home/lxing/agent-sop/clinical_data_platform
