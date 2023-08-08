# Llama Cpp Setup

This package allows you to quickly set up and run the Llama 2 large language model on your machine. It provides an easy way to clone, build, and run Llama 2 using [llama.cpp](https://github.com/ggerganov/llama.cpp), and even allows you to choose the specific model version you want to run.

**Supported Systems:** M1/M2 Macs, Intel Macs, Linux. (Windows support is yet to come)

## Prerequisites

- Make sure you have `git`, `curl`, `make`, and the required build tools installed on your system.

## Step by Step Guide

1. Clone the repository: `git clone https://github.com/sychhq/llama-cpp-setup.git`

2. Navigate to the directory: `cd llama-cpp-setup`

3. Make the script executable: `chmod +x setup.sh`

4. Run the script: `./setup.sh`

5. Follow the on-screen prompts: The script will ask for the Model's Repository ID and the corresponding file you wish to download and run. **Note** that if no user input is provided the default repository id is `TheBloke/Llama-2-7B-chat-GGML` and the default corresponding file name is `llama-2-7b-chat.ggmlv3.q4_0.bin`.

## Usage Example

```
Please enter the Repository ID (default: TheBloke/Llama-2-7B-chat-GGML):
> TheBloke/Llama-2-13B-chat-GGML
Please enter the corresponding file name (default: llama-2-7b-chat.ggmlv3.q4_0.bin):
>llama-2-13b-chat.ggmlv3.q4_0.bin

...some setup output...

== Running in interactive mode. ==
 - Press Ctrl+C to interject at any time.
 - Press Return to return control to LLaMa.
 - To return control without starting a new line, end your input with '/'.
 - If you want to submit another line, end your input with '\'.


> Hi
Hey! How are you?

> Who is the founder of Facebook?
Mark Zuckerberg is the founder of Facebook.

>
```

# Contributing

Feel free to fork this repository, submit pull requests, or report issues and suggestions.
