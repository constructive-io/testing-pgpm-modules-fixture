#!/bin/bash


set -e  # Exit on any error

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

dbsafename() {
    local package_path="$1"
    local package_name=$(basename "$package_path")
    echo "test_${package_name}" | sed 's/[^a-zA-Z0-9]/_/g' | tr '[:upper:]' '[:lower:]'
}

cleanup_db() {
    local dbname="$1"
    echo "  Cleaning up database: $dbname"
    dropdb "$dbname" 2>/dev/null || true
}

test_package() {
    local package_path="$1"
    local package_name=$(basename "$package_path")
    local dbname=$(dbsafename "$package_path")
    
    echo -e "${YELLOW}Testing package: $package_name${NC}"
    echo "  Package path: $package_path"
    echo "  Database name: $dbname"
    
    cleanup_db "$dbname"
    
    echo "  Creating database: $dbname"
    createdb "$dbname" || {
        echo -e "${RED}FAILED: Could not create database $dbname for package $package_name${NC}"
        return 1
    }
    
    cd "$package_path" || {
        echo -e "${RED}FAILED: Could not change to directory $package_path${NC}"
        cleanup_db "$dbname"
        return 1
    }
    
    echo "  Running lql deploy..."
    lql deploy --recursive --database "$dbname" --yes --package "$package_name" || {
        echo -e "${RED}FAILED: lql deploy failed for package $package_name${NC}"
        cleanup_db "$dbname"
        return 1
    }
    
    echo "  Running lql verify..."
    lql verify --recursive --database "$dbname" --yes --package "$package_name" || {
        echo -e "${RED}FAILED: lql verify failed for package $package_name${NC}"
        cleanup_db "$dbname"
        return 1
    }
    
    echo "  Running lql revert..."
    lql revert --recursive --database "$dbname" --yes --package "$package_name" || {
        echo -e "${RED}FAILED: lql revert failed for package $package_name${NC}"
        cleanup_db "$dbname"
        return 1
    }
    
    echo "  Running lql deploy (second time)..."
    lql deploy --recursive --database "$dbname" --yes --package "$package_name" || {
        echo -e "${RED}FAILED: lql deploy (second time) failed for package $package_name${NC}"
        cleanup_db "$dbname"
        return 1
    }
    
    cleanup_db "$dbname"
    
    echo -e "${GREEN}SUCCESS: Package $package_name passed all tests${NC}"
    return 0
}

main() {
    echo "=== LaunchQL Package Integration Test ==="
    echo "Testing all packages with deploy/verify/revert/deploy cycle"
    echo ""
    
    if ! command -v lql &> /dev/null; then
        echo -e "${RED}ERROR: lql CLI not found. Please install @launchql/cli globally.${NC}"
        echo "Run: npm install -g @launchql/cli@4.9.0"
        exit 1
    fi
    
    if ! command -v createdb &> /dev/null || ! command -v dropdb &> /dev/null; then
        echo -e "${RED}ERROR: PostgreSQL client tools (createdb/dropdb) not found.${NC}"
        echo "Please ensure PostgreSQL client tools are installed and in PATH."
        exit 1
    fi
    
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    cd "$SCRIPT_DIR"
    
    echo "Finding all LaunchQL packages..."
    local packages=()
    while IFS= read -r -d '' package_dir; do
        local dir_path="$(dirname "$package_dir")"
        if [[ "$dir_path" != *"/dist" ]]; then
            packages+=("$dir_path")
        fi
    done < <(find packages -name "launchql.plan" -print0 | sort -z)
    
    echo "Found ${#packages[@]} packages to test:"
    for package in "${packages[@]}"; do
        echo "  - $(basename "$package")"
    done
    echo ""
    
    local failed_packages=()
    local successful_packages=()
    
    for package in "${packages[@]}"; do
        if test_package "$package"; then
            successful_packages+=("$(basename "$package")")
        else
            failed_packages+=("$(basename "$package")")
        fi
        echo ""
    done
    
    echo "=== TEST SUMMARY ==="
    echo -e "${GREEN}Successful packages (${#successful_packages[@]}):${NC}"
    for package in "${successful_packages[@]}"; do
        echo -e "  ${GREEN}✓${NC} $package"
    done
    
    if [ ${#failed_packages[@]} -gt 0 ]; then
        echo ""
        echo -e "${RED}Failed packages (${#failed_packages[@]}):${NC}"
        for package in "${failed_packages[@]}"; do
            echo -e "  ${RED}✗${NC} $package"
        done
        echo ""
        echo -e "${RED}OVERALL RESULT: FAILED${NC}"
        exit 1
    else
        echo ""
        echo -e "${GREEN}OVERALL RESULT: ALL PACKAGES PASSED${NC}"
        exit 0
    fi
}

main "$@"
