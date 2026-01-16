.PHONY: help build clean install test run

help:
	@echo "Atlantr Build System"
	@echo ""
	@echo "Available targets:"
	@echo "  make build    - Build the Atlantr executable"
	@echo "  make clean    - Clean build artifacts"
	@echo "  make install  - Install dependencies"
	@echo "  make run      - Run Atlantr from source"
	@echo "  make test     - Run a basic test"

install:
	@echo "Installing dependencies..."
	pip3 install -r requirements.txt
	pip3 install pyinstaller

clean:
	@echo "Cleaning build artifacts..."
	rm -rf build/ dist/ *.spec __pycache__/
	find . -type d -name "*.egg-info" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true

build: install
	@echo "Building Atlantr executable..."
	pyinstaller --clean atlantr.spec
	@echo ""
	@echo "Build complete! Executable is in dist/atlantr"

run:
	@echo "Running Atlantr from source..."
	cd 3.0 && python3 atr3.py --help

test:
	@echo "Running basic test..."
	cd 3.0 && python3 atr3.py --help
	@echo ""
	@echo "Test passed!"
