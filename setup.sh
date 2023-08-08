#!/bin/bash

# Define some colors for the prompts
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
DEFAULT_REPO_ID="TheBloke/Llama-2-7B-chat-GGML"
DEFAULT_FILE="llama-2-7b-chat.ggmlv3.q4_0.bin"

# Prompt the user for the Repository ID and use default if empty
echo -e "${BLUE}Please enter the Repository ID (default: ${DEFAULT_REPO_ID}):${NC}"
read REPO_ID
if [ -z "$REPO_ID" ]; then
    REPO_ID=${DEFAULT_REPO_ID}
fi

# Prompt the user for the file name and use default if empty
echo -e "${BLUE}Please enter the corresponding file name (default: ${DEFAULT_FILE}):${NC}"
read FILE
if [ -z "$FILE" ]; then
    FILE=${DEFAULT_FILE}
fi

# Clone the Llama.cpp repository
git clone https://github.com/ggerganov/llama.cpp.git
cd llama.cpp

# If on an M1/M2 Mac, build with GPU support
if [[ $(uname -m) == "arm64" ]]; then
    LLAMA_METAL=1 make
else
    make
fi

# Check for the model and download if not present
[ ! -f models/${FILE} ] && curl -L "https://huggingface.co/${REPO_ID}/resolve/main/${FILE}" -o models/${FILE}

# Set a welcoming prompt
PROMPT="Hello! Need any assistance?"

# Run the model in interactive mode with specified parameters
./main -m ./models/${FILE} \
  --color \
  --ctx_size 2048 \
  -n -1 \
  -ins -b 256 \
  --top_k 10000 \
  --temp 0.2 \
  --repeat_penalty 1.1 \
  -t 8