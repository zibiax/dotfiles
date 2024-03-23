#!/bin/zsh

# Check if conda is available
if command -v conda &> /dev/null; then
    # Check if we are in a Conda environment
    if [[ -n "${CONDA_PREFIX}" ]]; then
        # If in Conda environment, set the path for conda Python
        CONDA_PYTHON="${CONDA_PREFIX}/bin/python"
        if [[ -x "${CONDA_PYTHON}" ]]; then
            echo "Conda environment detected. You can use 'python' to run Conda Python."
        else
            echo "Error: Conda Python not found at ${CONDA_PYTHON}"
        fi
    fi
fi

# Define a function to run the system Python
system_python() {
    SYSTEM_PYTHON="/bin/python"
    if [[ -x "${SYSTEM_PYTHON}" ]]; then
        echo "Using system Python: ${SYSTEM_PYTHON}"
        "${SYSTEM_PYTHON}" "$@"
    else
        echo "Error: System Python not found at ${SYSTEM_PYTHON}"
    fi
}

# Set an alias for 'python' to run the system Python
alias python=system_python
